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

    // enregistrer un niveau avec ses UE
    @PostMapping("/niveau")
    public Niveau addNiveau(@RequestBody Niveau niveau) {
        return niveauService.addNiveau(niveau.getName(), niveau.getEu());
    }

    // afficher toutes les UE d'un niveau precis
    @RequestMapping(value = "/searchby/ue", method = RequestMethod.GET)
    public List<UE> getUEsByNiveauName(@RequestParam String name) {
        return niveauService.getUEsByNiveauName(name);
    }
}
