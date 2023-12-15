package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.models.Niveau;
import com.example.demo.service.NiveauService;

@RestController
public class NiveauController {
    @Autowired
    private NiveauService niveauService;

    @PostMapping("/niveau")
    public Niveau addNiveau(@RequestParam String name, @RequestParam String ue) {
        return niveauService.addNiveau(name, ue);
    }
}
