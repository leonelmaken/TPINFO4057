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

@Service
public class SelectionneServiceImpl implements SelecionneService {

    private final SelectionneRepository selectionneRepository;

    @Autowired
    private KafkaTemplate<String, Object> kafkaTemplate;

    public SelectionneServiceImpl(SelectionneRepository selectionneRepository) {
        this.selectionneRepository = selectionneRepository;
    }

    @Override
    public void addSelectionne(Selectionne selectionne) {
        // Cette méthode est utilisée pour enregistrer un objet Selectionne
        selectionneRepository.save(selectionne);
    }

    @Override
    public List<Selectionne> getSelectionnes() {
        // Cette méthode renvoie la liste de tous les objets Selectionne enregistrés dans la base de données
        return selectionneRepository.findAll();
    }

    @Override
    public ResponseEntity<String> deleteSelectionne(Long id) {
        try {
            Optional<Selectionne> selectionneOptional = selectionneRepository.findById(id);

            if (selectionneOptional.isPresent()) {
                // Supprimez le Selectionne de la base de données
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

    @Override
    public ResponseEntity<String> selectStudent(Long etudiantId, KafkaTemplate<String, Object> kafkaTemplate, Admin admin) {
        try {
            // Récupère les informations de l'étudiant depuis le micro-service User via Kafka
            // Vous devrez implémenter la logique pour consommer le message Kafka ici

            // Exemple fictif
            String etudiantNom = "Nom de l'étudiant";  // Remplacez cela par la logique de consommation Kafka
            String etudiantPrenom = "Prénom de l'étudiant";  // Remplacez cela par la logique de consommation Kafka

            // Génère le matricule unique
            String matricule = generateMatricule(etudiantNom, etudiantPrenom, "INFO"); // Remplacez "INFO" par la filière

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
            // En cas d'erreur, retourne une réponse d'erreur avec le message d'erreur
            return new ResponseEntity<>("Une exception s'est produite : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // Méthode pour générer le matricule unique
    private String generateMatricule(String nom, String prenom, String filiere) {
        // Récupère les deux premières lettres du nom
        String deuxPremieresLettresNom = nom.substring(0, Math.min(nom.length(), 2)).toUpperCase();

        // Récupère la première lettre du prénom
        String premiereLettrePrenom = prenom.substring(0, 1).toUpperCase();

        // Récupère les deux derniers chiffres de l'année actuelle
        String annee = String.valueOf(Calendar.getInstance().get(Calendar.YEAR)).substring(2);

        // Combine les éléments pour former le matricule
        return annee + deuxPremieresLettresNom + premiereLettrePrenom + filiere.toUpperCase();
    }

}

