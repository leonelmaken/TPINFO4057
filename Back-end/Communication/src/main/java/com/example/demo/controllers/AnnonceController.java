package com.example.demo.controllers;

import com.example.demo.models.Annonce;
import com.example.demo.service.AnnonceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/annonces")
public class AnnonceController {

    private final AnnonceService annonceService;

    @Autowired
    public AnnonceController(AnnonceService annonceService) {
        this.annonceService = annonceService;
    }

    @PostMapping(path = "/create")
    public Annonce createAnnonce(@RequestPart("annonce") Annonce annonce, @RequestPart(value = "image", required = false) MultipartFile imageFile) {
        return annonceService.createAnnonce(annonce, imageFile);
    }

    @GetMapping(path = "/read")
    public List<Annonce> getAllAnnonces() {
        return annonceService.getAllAnnonces();
    }

    @GetMapping("/{id}")
    public Annonce getAnnonceById(@PathVariable Long id) {
        return annonceService.getAnnonceById(id);
    }}