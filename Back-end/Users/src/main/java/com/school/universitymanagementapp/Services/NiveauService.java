package com.school.universitymanagementapp.Services;

import com.school.universitymanagementapp.Model.Niveau;
import com.school.universitymanagementapp.Model.UE;
import com.school.universitymanagementapp.Repository.NiveauRepository;
import com.school.universitymanagementapp.Repository.UERepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NiveauService {
    @Autowired
    private NiveauRepository niveauRepository;

    @Autowired
    private UERepository ueRepository;

    public Niveau addNiveau(String name, String ue) {
        Niveau niveau = new Niveau();
        niveau.setName(name);


        String[] codeArray = ue.split(",");
        for (int i = 0; i < codeArray.length; i++) {
            UE ues = new UE();
            //ues.setIntitule(ueArray[i]);
            ues.setCode(codeArray[i]);
            ues = ueRepository.save(ues); // save UE to database
            niveau.getEu().add(ues);
        }

        return niveauRepository.save(niveau); // save Niveau to database
    }
}
