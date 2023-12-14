package com.example.demo.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;

import com.example.demo.models.Admin;
import com.example.demo.models.Selectionne;

public interface SelecionneService {

    void addSelectionne(Selectionne selectionne);

    ResponseEntity<String> selectStudent(Long etudiantId, KafkaTemplate<String, Object> kafkaTemplate, Admin admin);

    List<Selectionne> getSelectionnes();

    ResponseEntity<String> deleteSelectionne(Long id);
}
