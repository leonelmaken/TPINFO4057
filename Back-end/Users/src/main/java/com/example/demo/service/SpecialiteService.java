package com.example.demo.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.example.demo.models.Specialite;

public interface SpecialiteService {
    List<Specialite> getAllSpecialites();
    Specialite getSpecialiteById(int id);
    Specialite createSpecialite(Specialite specialite);
    void deleteSpecialite(int id);
	ResponseEntity<String> updateSpecialite(Specialite updatedSpecialite, int id);
}
