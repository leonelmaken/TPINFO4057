package com.example.demo.service;

import com.example.demo.models.Admin;
import com.example.demo.models.Selectionne;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;

import java.util.List;

public interface SelecionneService {

    void addSelectionne(Selectionne selectionne);

    ResponseEntity<String> selectStudentByAdmin(Long adminId, Long etudiantId);

    List<Selectionne> getSelectionnes();

    ResponseEntity<String> deleteSelectionne(Long id);
}
