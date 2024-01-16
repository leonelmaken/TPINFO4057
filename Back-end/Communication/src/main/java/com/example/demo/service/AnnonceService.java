package com.example.demo.service;


import com.example.demo.models.Annonce;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface AnnonceService {
	Annonce createAnnonce(Annonce annonce, MultipartFile imageFile);
    List<Annonce> getAllAnnonces();
    Annonce getAnnonceById(Long id);
    List<Annonce> getAnnoncesByTeacher(Long teacherId);
	Annonce createAnnonceForTeacher(Long teacherId, Annonce annonce, MultipartFile imageFile);
}
