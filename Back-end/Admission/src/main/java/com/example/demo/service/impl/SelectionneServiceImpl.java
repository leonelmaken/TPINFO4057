package com.example.demo.service.impl;

import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import com.example.demo.models.Admin;
import com.example.demo.models.SelectionEvent;
import com.example.demo.models.Selectionne;
import com.example.demo.repository.SelectionneRepository;
import com.example.demo.service.SelecionneService;
import com.example.demo.service.UserFeignClient;

@Service
public class SelectionneServiceImpl<UserFeignClient> implements SelecionneService {

    private final SelectionneRepository selectionneRepository;
    private final KafkaTemplate<String, Object> kafkaTemplate;
    private final UserFeignClient userFeignClient;

    @Autowired
    public SelectionneServiceImpl(SelectionneRepository selectionneRepository, KafkaTemplate<String, Object> kafkaTemplate, UserFeignClient userFeignClient) {
        this.selectionneRepository = selectionneRepository;
        this.kafkaTemplate = kafkaTemplate;
        this.userFeignClient = userFeignClient;
    }

    @Override
    public void addSelectionne(Selectionne selectionne) {
        selectionneRepository.save(selectionne);
    }

    @Override
    public List<Selectionne> getSelectionnes() {
        return selectionneRepository.findAll();
    }

    @Override
    public ResponseEntity<String> deleteSelectionne(Long id) {
        try {
            Optional<Selectionne> selectionneOptional = selectionneRepository.findById(id);

            if (selectionneOptional.isPresent()) {
                selectionneRepository.deleteById(id);
                return new ResponseEntity<>("Sélection supprimée avec succès", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Sélection non trouvée avec l'ID : " + id, HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la suppression : " + e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    private String generateMatricule(String nom, String prenom, String filiere) {
        String deuxPremieresLettresNom = nom.substring(0, Math.min(nom.length(), 2)).toUpperCase();
        String premiereLettrePrenom = prenom.substring(0, 1).toUpperCase();
        String annee = String.valueOf(Calendar.getInstance().get(Calendar.YEAR)).substring(2);

        return annee + deuxPremieresLettresNom + premiereLettrePrenom + filiere.toUpperCase();
    }

	@Override
	public ResponseEntity<String> selectStudent(Long etudiantId, KafkaTemplate<String, Object> kafkaTemplate,
			Admin admin) {
		 try {
	            // Utilisez Feign pour obtenir les informations de l'étudiant depuis le micro-service Users
	            // Remplacez "etudiantId" par l'ID réel de l'étudiant
	            User student = userFeignClient.getUserById(etudiantId).getBody();

	            // Génère le matricule unique
	            String matricule = generateMatricule(student.getNom(), student.getPrenom(), "INFO");

	            // Enregistre le matricule dans la base de données (si nécessaire)
	            // Vous devrez implémenter la logique d'enregistrement dans la base de données ici

	            // Publie un événement Kafka pour informer d'une nouvelle sélection
	            SelectionEvent selectionEvent = new SelectionEvent();
	            selectionEvent.setAdminId(admin.getAdminId());
	            selectionEvent.setEtudiantId(etudiantId);
	            selectionEvent.setMatricule(matricule);
	            kafkaTemplate.send("Gestion", selectionEvent);

	            // Retourne une réponse indiquant que l'étudiant a été sélectionné avec succès
	            return new ResponseEntity<>("Étudiant sélectionné avec succès. Matricule : " + matricule, HttpStatus.OK);
	        } catch (Exception e) {
	            return new ResponseEntity<>("Une exception s'est produite : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	}
}

