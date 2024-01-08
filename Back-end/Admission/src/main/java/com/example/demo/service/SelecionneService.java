package com.example.demo.service;

import com.example.demo.models.Selectionne;
import com.example.demo.models.StudentBean;

import org.springframework.http.ResponseEntity;

import java.util.List;

public interface SelecionneService {

    void addSelectionne(Selectionne selectionne);

    StudentBean  selectStudentByAdmin(Long adminId, int etudiantId);

    List<Selectionne> getSelectionnes();

    ResponseEntity<String> deleteSelectionne(Long id);
}


