package com.example.demo.service.impl;

import com.example.demo.models.Admin;
import com.example.demo.repository.AdminRepository;
import com.example.demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AdminServiceImpl implements AdminService {

    private final AdminRepository adminRepository;

    @Autowired
    public AdminServiceImpl(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public ResponseEntity<String> createAdmin(Admin admin) {
        try {
            // Vérification des champs obligatoires
            if (admin.getNom() == null) 
                return new ResponseEntity<>("Vous devez entrer Votre nom", HttpStatus.INTERNAL_SERVER_ERROR);

            if (admin.getEmail() == null) 
                return new ResponseEntity<>("Vous devez entrer Votre mail", HttpStatus.INTERNAL_SERVER_ERROR);

            if (admin.getMotDePasse() == null) 
                return new ResponseEntity<>("Vous devez entrer un mot de passe", HttpStatus.INTERNAL_SERVER_ERROR);
            if (admin.getRole() == null) 
                return new ResponseEntity<>("Vous devez spécifier un rôle pour l'admin", HttpStatus.INTERNAL_SERVER_ERROR);

            if (admin.getTelephone() == null) 
                return new ResponseEntity<>("Vous devez entrer votre numéro de téléphone", HttpStatus.INTERNAL_SERVER_ERROR);

            if (admin.getStatut() == null) 
                return new ResponseEntity<>("Le statut est obligatoire", HttpStatus.INTERNAL_SERVER_ERROR);

            // Les champs dateCreation et dateDerniereConnexion seront automatiquement définis grâce aux annotations @PrePersist
            adminRepository.save(admin);

            return new ResponseEntity<>("Vous avez été enregistré avec succès " + admin.toString(), HttpStatus.OK);

        } catch(Exception e) {
            return new ResponseEntity<>("Une exception s'est produite: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Admin> getAdminById(Long id) {
        Optional<Admin> adminOptional = adminRepository.findById(id);
        if(adminOptional.isPresent()){
            return new ResponseEntity<>(adminOptional.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @Override
    public ResponseEntity<List<Admin>> getAllAdmins() {
        try {
            List<Admin> admins = adminRepository.findAll();
            if (admins.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(admins, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @Override
    public ResponseEntity<String> updateAdmin(Admin admin, Long id) {
        try {
            Optional<Admin> adminOptional = adminRepository.findById(id);
            
            if (adminOptional.isEmpty()) {
                return new ResponseEntity<>("Admin non trouvé", HttpStatus.NOT_FOUND);
            }
            
            Admin foundAdmin = adminOptional.get();
            
            // Mettre à jour les champs selon ce qui est fourni
            if (admin.getNom() != null && !foundAdmin.getNom().equals(admin.getNom())) 
                foundAdmin.setNom(admin.getNom());
            
            if (admin.getPrenom() != null && !foundAdmin.getPrenom().equals(admin.getPrenom()))
                foundAdmin.setPrenom(admin.getPrenom());

            if (admin.getEmail() != null && !foundAdmin.getEmail().equals(admin.getEmail())) 
                foundAdmin.setEmail(admin.getEmail());

            if (admin.getMotDePasse() != null && !foundAdmin.getMotDePasse().equals(admin.getMotDePasse())) 
                foundAdmin.setMotDePasse(admin.getMotDePasse());

            if (admin.getPhoto() != null && !foundAdmin.getPhoto().equals(admin.getPhoto())) 
                foundAdmin.setPhoto(admin.getPhoto());

            if (admin.getTelephone() != null && !foundAdmin.getTelephone().equals(admin.getTelephone())) 
                foundAdmin.setTelephone(admin.getTelephone());
            if (admin.getRole() != null && !foundAdmin.getRole().equals(admin.getRole())) 
                foundAdmin.setRole(admin.getRole());

            if (admin.getStatut() != null && !foundAdmin.getStatut().equals(admin.getStatut())) 
                foundAdmin.setStatut(admin.getStatut());

            // Mettre à jour la date de dernière connexion automatiquement
            foundAdmin.setDateDerniereConnexion(new Date());
            
            adminRepository.save(foundAdmin);
            
            return new ResponseEntity<>("Modification réussie", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<String> deleteAdmin(Long id) {
        try {
            if (!adminRepository.existsById(id)) {
                return new ResponseEntity<>("Admin non trouvé", HttpStatus.NOT_FOUND);
            }
            
            adminRepository.deleteById(id);
            return new ResponseEntity<>("Admin supprimé avec succès", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la suppression : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @Override
    public ResponseEntity<String> findByName(String nom) {
        try {
            Optional<Admin> adminOptional = adminRepository.findByNameCaseSensitive(nom);
            
            if (adminOptional.isPresent()) {
                Admin admin = adminOptional.get();
                return new ResponseEntity<>(admin.toString(), HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Admin non trouvé avec le nom: " + nom, HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la recherche : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}

