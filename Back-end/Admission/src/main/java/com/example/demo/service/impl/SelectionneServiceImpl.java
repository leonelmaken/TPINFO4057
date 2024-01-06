package com.example.demo.service.impl;

import com.example.demo.service.AdminService;
import com.example.demo.service.MicroServiceUser;
import com.example.demo.models.Admin;
import com.example.demo.models.Selectionne;
import com.example.demo.repository.SelectionneRepository;
import com.example.demo.service.SelecionneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.List;
import java.util.Optional;

@Service
public class SelectionneServiceImpl implements SelecionneService {

    private final SelectionneRepository selectionneRepository;
    private final KafkaTemplate<String, Object> kafkaTemplate;
    private final MicroServiceUser microServiceUser;
    private final AdminService adminService;

    @Autowired
    public SelectionneServiceImpl(SelectionneRepository selectionneRepository,
                                  KafkaTemplate<String, Object> kafkaTemplate,
                                  MicroServiceUser microServiceUser,
                                  AdminService adminService) {
        this.selectionneRepository = selectionneRepository;
        this.kafkaTemplate = kafkaTemplate;
        this.microServiceUser = microServiceUser;
        this.adminService = adminService;
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
    public ResponseEntity<String> selectStudentByAdmin(Long adminId, Long etudiantId) {
        // Créez un objet Selectionne en utilisant l'ID de l'étudiant et de l'admin
        Admin selectingAdmin = adminService.getAdminById(adminId).getBody();
        Selectionne selectionne = new Selectionne(etudiantId, selectingAdmin);

        // Enregistrez la sélection dans la base de données (utilisez la logique appropriée)
        selectionneRepository.save(selectionne);

        return ResponseEntity.ok("Étudiant sélectionné avec succès par l'admin.");
    }
}

