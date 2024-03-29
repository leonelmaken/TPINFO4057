package com.example.demo.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.models.InscriptionStudent;
import com.example.demo.models.Student;
import com.example.demo.repository.InscriptionStudentRepository;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.InscriptionStudentService;

@RestController
@RequestMapping("/api/")
public class InscriptionStudentController {

    @Autowired
    private InscriptionStudentRepository inscriptrepo;
    @Autowired
    private StudentRepository stuRepo;
     @Autowired
     private InscriptionStudentService inscriptService;

    @PostMapping(path = "/inscriptionStudent", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> inscriptionStudent(
            @RequestParam String matricule,
            @RequestPart(value = "firsttranche", required = false) MultipartFile firsttranche,
            @RequestPart(value = "secondtranche", required = false) MultipartFile secondtranche,
            @RequestPart(value = "totalitetranche", required = false) MultipartFile  totalitetranche,
            @RequestParam(required = false) Double numtranche1,
            @RequestParam(required = false) Double numtranche2,
            @RequestParam(required = false) Double numTotalite
    ) throws IOException {

        if((firsttranche != null && (!firsttranche.getContentType().equals("image/jpeg") && !firsttranche.getContentType().equals("image/png") && !firsttranche.getContentType().equals("image/jpg")) && !firsttranche.getContentType().equals("application/pdf")) ||
                (secondtranche != null && (!secondtranche.getContentType().equals("image/jpeg") && !secondtranche.getContentType().equals("image/png") && !secondtranche.getContentType().equals("image/jpg")) && !secondtranche.getContentType().equals("application/pdf")) ||
                (totalitetranche != null && (!totalitetranche.getContentType().equals("image/jpeg") && !totalitetranche.getContentType().equals("image/png") && !totalitetranche.getContentType().equals("image/jpg")) && !totalitetranche.getContentType().equals("application/pdf"))) {
            return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("Seulement les images jpeg,png,jpg, ou les fichiers pdf sont acceptees");
        }
        Student etudiant= stuRepo.findByMatricule(matricule).orElseThrow(() -> new RuntimeException("student is not found"));
        InscriptionStudent inscription= inscriptService.inscriptionEtudiant(etudiant,firsttranche,secondtranche,totalitetranche,numtranche1,numtranche2,numTotalite);
        return ResponseEntity.ok(inscription);
    }

}