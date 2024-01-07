package com.example.demo.service;

import com.example.demo.models.Selectionne;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface SelecionneService {

    void addSelectionne(Selectionne selectionne);

    ResponseEntity<String> selectStudentByAdmin(Long adminId, int etudiantId);

    List<Selectionne> getSelectionnes();

    ResponseEntity<String> deleteSelectionne(Long id);
}


