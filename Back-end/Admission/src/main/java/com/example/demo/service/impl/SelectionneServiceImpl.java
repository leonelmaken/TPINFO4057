package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import com.example.demo.models.SelectionEvent;
import com.example.demo.models.Selectionne;
import com.example.demo.repository.SelectionneRepository;
import com.example.demo.service.SelecionneService;

@Service
public class SelectionneServiceImpl implements SelecionneService{

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
	    public ResponseEntity<String> selectStudent(Long etudiantId, KafkaTemplate<String, Object> kafkaTemplate) {
	        try {
	            // Logique de sélection de l'étudiant

	            // Crée un objet Selectionne avec les informations nécessaires
	            Selectionne selectionne = new Selectionne();
	            selectionne.setEtudiantId(etudiantId);
	            // Ajoutez d'autres champs selon vos besoins

	            // Enregistre le Selectionne dans la base de données
	            addSelectionne(selectionne);

	            // Publie un événement Kafka pour informer d'une nouvelle sélection
	            SelectionEvent selectionEvent = new SelectionEvent(/* Ajoutez les informations nécessaires pour l'événement */);
	            kafkaTemplate.send("Gestion", selectionEvent);

	            // Retourne une réponse indiquant que l'étudiant a été sélectionné avec succès
	            return new ResponseEntity<>("Étudiant sélectionné avec succès", HttpStatus.OK);
	        } catch (Exception e) {
	            // En cas d'erreur, retourne une réponse d'erreur avec le message d'erreur
	            return new ResponseEntity<>("Une exception s'est produite : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }

}
