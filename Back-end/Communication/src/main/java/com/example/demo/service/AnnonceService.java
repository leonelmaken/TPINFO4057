package com.example.demo.service;


import com.example.demo.models.Annonce;

import java.util.List;

public interface AnnonceService {
    Annonce createAnnonce(Annonce annonce);
    List<Annonce> getAllAnnonces();
    Annonce getAnnonceById(Long id);
}
