package com.example.demo.controller;

import com.example.demo.models.Selectionne;
import com.example.demo.models.StudentBean;
import com.example.demo.service.MicroServiceUser;
import com.example.demo.service.SelecionneService;
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
    @Autowired
    private final MicroServiceUser microServiceUser;

    @Autowired
    public SelectionneController(SelecionneService selecionneService,
                                 KafkaTemplate<String, Object> kafkaTemplate,
                                 MicroServiceUser microServiceUser) {
        this.selecionneService = selecionneService;
        this.kafkaTemplate = kafkaTemplate;
        this.microServiceUser = microServiceUser;
    }

    @PostMapping("/select/{etudiantId}/{adminId}")
    public StudentBean selectStudent(@PathVariable ("etudiantId") Long etudiantId, @PathVariable ("adminId") Long adminId) {
        // Utilisez le service Feign pour obtenir les informations sur l'étudiant
        StudentBean studentBean = microServiceUser.getStudentInfoById(etudiantId);

        // Vérifiez si l'objet StudentBean est valide
       // if (studentBean != null && studentBean.isValid()) {
            // Appelez la méthode du service pour la sélection en utilisant les informations de l'étudiant
            return selecionneService.selectStudentByAdmin(adminId, studentBean.getIdUser());
        
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

