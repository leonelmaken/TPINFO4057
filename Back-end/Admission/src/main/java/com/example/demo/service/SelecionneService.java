package com.example.demo.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;

import com.example.demo.models.Admin;
import com.example.demo.models.Selectionne;

public interface SelecionneService {

	public void addSelectionne(Selectionne selectionne);
	public ResponseEntity<String> selectStudent(Long etudiantId, KafkaTemplate<String, Object> kafkaTemplate,Admin admin);
	public List<Selectionne> getSelectionnes();
	public ResponseEntity<String> deleteSelectionne(Long id);
}
