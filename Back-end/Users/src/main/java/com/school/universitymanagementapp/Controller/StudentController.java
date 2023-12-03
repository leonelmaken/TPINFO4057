package com.school.universitymanagementapp.Controller;

import com.school.universitymanagementapp.Model.Niveau;
import com.school.universitymanagementapp.Model.Specialite;
import com.school.universitymanagementapp.Model.Student;
import com.school.universitymanagementapp.Repository.NiveauRepository;
import com.school.universitymanagementapp.Repository.SpecialiteRepository;
import com.school.universitymanagementapp.Services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

@RestController
public class StudentController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private SpecialiteRepository spacialrepo;

    @Autowired
    private NiveauRepository niveaurepo;

    @RequestMapping(method = RequestMethod.POST, value = "/preinscription")
    public ResponseEntity<?> preinscription( @RequestParam String name,
                                             @RequestParam String surname,
                                             @RequestParam Date dateNaiss,
                                             @RequestParam String lieuNaiss,

                                             @RequestParam String numerocni,
                                             @RequestParam MultipartFile photouser,

                                             @RequestParam String adresse,
                                             @RequestParam String sexe,
                                             @RequestParam String email,
                                             @RequestParam String statusMarital,
                                             @RequestParam String langue,
                                             @RequestParam String statusprofess,
                                             @RequestParam Double numerotel,
                                             @RequestParam String nationalite,
                                             @RequestParam String region,
                                             @RequestParam String departmt,
                                             //photo scannee à uploader
                                             @RequestParam MultipartFile photocni,
                                             @RequestParam MultipartFile relevebac,
                                             @RequestParam MultipartFile releveproba,
                                             @RequestParam MultipartFile actenaiss,
                                             @RequestParam MultipartFile recu,
                                             // >>
                                  
                                             @RequestParam String premierchoix,
                                             @RequestParam String deuxiemechoix,
                                             @RequestParam String troisiemechoix,
                                             @RequestParam String specialite,
                                             @RequestParam int niveau,
                                             //photo scannee à uploader
                                             @RequestParam MultipartFile dernierdiplom,

                                             @RequestParam String anneeObtent,
                                             @RequestParam Double moyenne,
                                             @RequestParam String infojury,
                                             @RequestParam String matriculediplo,
                                             @RequestParam String delivrepar,
                                             @RequestParam Date Datedeliv,
                                             @RequestParam String nompere,
                                             @RequestParam String professpere,
                                             @RequestParam String nommere,
                                             @RequestParam String professmere,
                                             @RequestParam String nomurgent,
                                             @RequestParam Double numerourgent,
                                             @RequestParam String villeurgent,
                                             @RequestParam String nomtuteur,
                                             @RequestParam String professtuteur,
                                             @RequestParam Double numerotransaction,
                                             @RequestParam Double codepreins,
                                             @RequestParam boolean sport,
                                             @RequestParam  boolean art
    		) throws IOException {

        if((!photouser.getContentType().equals("image/jpeg") && !photouser.getContentType().equals("image/png") && !photouser.getContentType().equals("image/jpg")) && !photouser.getContentType().equals("application/pdf") && (!photocni.getContentType().equals("image/jpeg") && !photocni.getContentType().equals("image/png") && !photocni.getContentType().equals("image/jpg")) && !photocni.getContentType().equals("application/pdf") && (!actenaiss.getContentType().equals("image/jpeg") && !actenaiss.getContentType().equals("image/png") && !actenaiss.getContentType().equals("image/jpg")) && !actenaiss.getContentType().equals("application/pdf") && (!relevebac.getContentType().equals("image/jpeg") && !relevebac.getContentType().equals("image/png") && !relevebac.getContentType().equals("image/jpg")) && !relevebac.getContentType().equals("application/pdf") && (!releveproba.getContentType().equals("image/jpeg") && !releveproba.getContentType().equals("image/png") && !releveproba.getContentType().equals("image/jpg")) && !releveproba.getContentType().equals("application/pdf") && (!recu.getContentType().equals("image/jpeg") && !recu.getContentType().equals("image/png") && !recu.getContentType().equals("image/jpg")) && !recu.getContentType().equals("application/pdf") && (!dernierdiplom.getContentType().equals("image/jpeg") && !dernierdiplom.getContentType().equals("image/png") && !dernierdiplom.getContentType().equals("image/jpg")) && !dernierdiplom.getContentType().equals("application/pdf")) {
            return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("Seulement les images jpeg,png,jpg, ou les fichiers pdf sont acceptees");

        }
        if(studentService.findByEmail(email).isPresent()){
            return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("l'utilisateur existe dejà");

            // verifie la présence de l'email ou du télephone pour empêcher les doublons
        }
         
        Niveau niveau1 = niveaurepo.findById(niveau).orElseThrow(() -> new RuntimeException("type of this annonce is not found"));

        Student etudiant = studentService.preinscription(name, surname, dateNaiss, lieuNaiss, numerocni, photouser, adresse, sexe, email, statusMarital, langue, statusprofess, numerotel, nationalite, region, departmt, photocni, relevebac, releveproba, actenaiss, recu, premierchoix, deuxiemechoix, troisiemechoix, specialite, niveau1, dernierdiplom, anneeObtent, moyenne, infojury, matriculediplo, delivrepar, Datedeliv, nompere, professpere, nommere, professmere, nomurgent, numerourgent, villeurgent, nomtuteur,professtuteur, numerotransaction, codepreins, sport, art);
        
        return ResponseEntity.ok(etudiant);
    }



}
