package com.school.universitymanagementapp.Controller;

import com.school.universitymanagementapp.Model.Student;
import com.school.universitymanagementapp.Model.inscriptionStudent;
import com.school.universitymanagementapp.Repository.StudentRepository;
import com.school.universitymanagementapp.Repository.inscriptionStudentRepository;
import com.school.universitymanagementapp.Services.inscriptionStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
public class inscriptionStudentController {

    @Autowired
    private inscriptionStudentRepository inscriptrepo;
    @Autowired
    private StudentRepository stuRepo;
     @Autowired
     private inscriptionStudentService inscriptService;

    @RequestMapping(method = RequestMethod.POST, value = "/inscriptionStudent")
    public ResponseEntity<?> inscriptionStudent(
            @RequestParam String matricule,
            @RequestParam MultipartFile firsttranche,
            @RequestParam MultipartFile secondtranche,
            @RequestParam MultipartFile  totalitetranche
            )throws IOException {

        if((!firsttranche.getContentType().equals("image/jpeg") && !firsttranche.getContentType().equals("image/png") && !firsttranche.getContentType().equals("image/jpg")) && !firsttranche.getContentType().equals("application/pdf") && (!secondtranche.getContentType().equals("image/jpeg") && !secondtranche.getContentType().equals("image/png") && !secondtranche.getContentType().equals("image/jpg")) && !secondtranche.getContentType().equals("application/pdf") && (!totalitetranche.getContentType().equals("image/jpeg") && !totalitetranche.getContentType().equals("image/png") && !totalitetranche.getContentType().equals("image/jpg")) && !totalitetranche.getContentType().equals("application/pdf")) {
            return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("Seulement les images jpeg,png,jpg, ou les fichiers pdf sont acceptees");

        }
        Student etudiant= stuRepo.findByMatricule(matricule).orElseThrow(() -> new RuntimeException("Country not found"));

        inscriptionStudent inscription= inscriptService.inscriptionEtudiant(etudiant,firsttranche,secondtranche,totalitetranche);
        return ResponseEntity.ok(inscription);
    }
}