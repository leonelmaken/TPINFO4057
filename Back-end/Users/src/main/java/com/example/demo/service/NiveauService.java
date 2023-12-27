package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.models.Niveau;
import com.example.demo.models.UE;
import com.example.demo.repository.NiveauRepository;
import com.example.demo.repository.UERepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class NiveauService {
    @Autowired
    private NiveauRepository niveauRepository;

    @Autowired
    private UERepository ueRepository;

    //enregistrer un niveau avec toutes ces UE
    public Niveau addNiveau(String name, String ue, String intitule) {
        Niveau niveau = new Niveau();
        niveau.setName(name);


        String[] codeArray = ue.split(",");
        String[] ueArray = intitule.split(",");
        for (int i = 0; i < codeArray.length; i++) {
            UE ues = new UE();
            ues.setIntitule(ueArray[i]);
            ues.setCode(codeArray[i]);
            ues = ueRepository.save(ues); // save UE to database
            niveau.getEu().add(ues);
        }

        return niveauRepository.save(niveau); // save Niveau to database
    }

    //Afficher toutes les UE d'un niveau precis
    public List<UE> getUEsByNiveauName(String name) {
        Niveau niveau = niveauRepository.findByNameIgnoreCase(name);
        if (niveau != null) {
            return niveau.getEu();
        } else {
            return new ArrayList<>();
        }
    }
}