package com.example.demo.controller;

import com.example.demo.models.Selectionne;
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
    public SelectionneController(SelecionneService selecionneService, KafkaTemplate<String, Object> kafkaTemplate) {
        this.selecionneService = selecionneService;
        this.kafkaTemplate = kafkaTemplate;
    }

    @PostMapping("/select/{etudiantId}")
    public ResponseEntity<String> selectStudent(@PathVariable Long etudiantId) {
        return selecionneService.selectStudent(etudiantId, kafkaTemplate);
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
