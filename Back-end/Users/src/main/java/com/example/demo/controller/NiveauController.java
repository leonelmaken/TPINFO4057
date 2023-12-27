package com.example.demo.controller;


import com.example.demo.models.UE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.demo.models.Niveau;
import com.example.demo.service.NiveauService;

import java.util.List;

@RestController
public class NiveauController {
    @Autowired
    private NiveauService niveauService;

    //enregistrer un niveau avec ses UE
    @PostMapping("/niveau")
    public Niveau addNiveau(@RequestParam String name, @RequestParam String ue,@RequestParam String intitule) {
        return niveauService.addNiveau(name, ue ,intitule);
    }

    //afficher toutes les UE d'un niveau precis
    @RequestMapping(value = "/searchby/ue", method = RequestMethod.GET)
    public List<UE> getUEsByNiveauName(@RequestParam String name) {
        return niveauService.getUEsByNiveauName(name);
    }
}
