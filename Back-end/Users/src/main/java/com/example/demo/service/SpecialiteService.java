package com.example.demo.service;

import com.example.demo.models.Specialite;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface SpecialiteService {
    
    List<Specialite> getAllSpecialites();

    Specialite getSpecialiteById(int id);

    Specialite createSpecialite(Specialite specialite);

    ResponseEntity<String> updateSpecialite(Specialite updatedSpecialite, int id);

    void deleteSpecialite(int id);
}
