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

    public Niveau addNiveau(String name, List<UE> ues) {
        Niveau niveau = new Niveau();
        niveau.setName(name);

        for (UE ue : ues) {
            ue = ueRepository.save(ue);
            niveau.getEu().add(ue);
        }

        return niveauRepository.save(niveau);
    }

    public List<UE> getUEsByNiveauName(String name) {
        Niveau niveau = niveauRepository.findByNameIgnoreCase(name);
        if (niveau != null) {
            return niveau.getEu();
        } else {
            return new ArrayList<>();
        }
    }
}
