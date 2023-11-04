package com.school.universitymanagementapp.Controller;

import com.school.universitymanagementapp.Model.Niveau;
import com.school.universitymanagementapp.Services.NiveauService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NiveauController {
    @Autowired
    private NiveauService niveauService;

    @PostMapping("/niveau")
    public Niveau addNiveau(@RequestParam String name, @RequestParam String ue) {
        return niveauService.addNiveau(name, ue);
    }
}
