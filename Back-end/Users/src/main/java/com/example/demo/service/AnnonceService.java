package com.example.demo.service;


import com.example.demo.models.Annonce;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface AnnonceService {
	Annonce createAnnonce(Annonce annonce, MultipartFile imageFile) throws IOException;
    List<Annonce> getAllAnnonces();
    Annonce getAnnonceById(Long id);
}
