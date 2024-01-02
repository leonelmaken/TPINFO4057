package com.example.demo.service.implement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import com.example.demo.models.Specialite;
import com.example.demo.repository.SpecialiteRepository;
import com.example.demo.service.SpecialiteService;

import java.util.List;
import java.util.Optional;

@Service
public class SpecialiteServiceImpl implements SpecialiteService {

    @Autowired
    private SpecialiteRepository specialiteRepository;

    @Override
    public List<Specialite> getAllSpecialites() {
        // Récupérer toutes les spécialités depuis la base de données
        return specialiteRepository.findAll();
    }

    @Override
    public Specialite getSpecialiteById(int id) {
        // Récupérer une spécialité par son ID
        Optional<Specialite> optionalSpecialite = specialiteRepository.findById(id);
        return optionalSpecialite.orElse(null);
    }

    @Override
    public Specialite createSpecialite(Specialite specialite) {
        // Logique de création d'une spécialité
        // Par exemple, vous pouvez ajouter des validations avant d'enregistrer dans la base de données
        return specialiteRepository.save(specialite);
    }

    @Override
    public ResponseEntity<String> updateSpecialite(Specialite updatedSpecialite, int id) {
        try {
            Optional<Specialite> specialiteOptional = specialiteRepository.findById(id);

            if (specialiteOptional.isEmpty()) {
                return new ResponseEntity<>("Spécialité non trouvée", HttpStatus.NOT_FOUND);
            }

            Specialite foundSpecialite = specialiteOptional.get();

            // Mettre à jour les champs selon ce qui est fourni
            if (updatedSpecialite.getName() != null && !foundSpecialite.getName().equals(updatedSpecialite.getName()))
                foundSpecialite.setName(updatedSpecialite.getName());

            if (updatedSpecialite.getDescription() != null && !foundSpecialite.getDescription().equals(updatedSpecialite.getDescription()))
                foundSpecialite.setDescription(updatedSpecialite.getDescription());

            // Enregistrez les modifications dans la base de données
            specialiteRepository.save(foundSpecialite);

            return new ResponseEntity<>("Modification réussie", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public void deleteSpecialite(int id) {
        // Supprimer une spécialité par son ID
        specialiteRepository.deleteById(id);
    }
}
