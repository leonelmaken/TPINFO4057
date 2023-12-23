package com.example.demo.controller;

import com.example.demo.models.Selectionne;
import com.example.demo.models.UserBean;
import com.example.demo.service.SelecionneService;
import com.example.demo.service.MicroServiceUser;  // Importez la classe du client Feign
import com.example.demo.models.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/selectionnes")
public class SelectionneController {

    private final SelecionneService selecionneService;
    private final KafkaTemplate<String, Object> kafkaTemplate;
    private final MicroServiceUser microServiceUser;  // Ajoutez le client Feign comme une dépendance

    @Autowired
    public SelectionneController(SelecionneService selecionneService,
                                 KafkaTemplate<String, Object> kafkaTemplate,
                                 MicroServiceUser microServiceUser) {  // Injectez le client Feign dans le contrôleur
        this.selecionneService = selecionneService;
        this.kafkaTemplate = kafkaTemplate;
        this.microServiceUser = microServiceUser;
    }

    @PostMapping("/select/{etudiantId}")
    public ResponseEntity<String> selectStudent(@PathVariable Long etudiantId) {
        // Appelez le service Feign pour obtenir les informations de l'étudiant
        UserBean student = microServiceUser.getUserById(etudiantId);

        // Appelez la méthode du service pour la sélection en utilisant les informations de l'étudiant
        Admin admin = new Admin();  // Vous devez définir l'objet Admin avec les bonnes valeurs
        return selecionneService.selectStudent(etudiantId, kafkaTemplate, admin);
    }

    @GetMapping("/list")
    public List<Selectionne> getSelectionnes() {
        return selecionneService.getSelectionnes();
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteSelectionne(@PathVariable Long id) {
        return selecionneService.deleteSelectionne(id);
    }
}
