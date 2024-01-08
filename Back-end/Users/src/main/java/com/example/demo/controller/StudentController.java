package com.example.demo.controller;

import com.example.demo.service.implement.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.models.MessageBean;
import com.example.demo.models.Niveau;
import com.example.demo.models.Student;
import com.example.demo.repository.NiveauRepository;
import com.example.demo.repository.SpecialiteRepository;
import com.example.demo.service.CommunicationFeignClient;
import com.example.demo.service.StudentService;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@RestController
public class StudentController {
    @Autowired
    private StudentServiceImpl studentService;

    @Autowired
    private SpecialiteRepository specialiteRepository;
    
    @Autowired
    private CommunicationFeignClient communicationFeignClient;

    @Autowired
    private NiveauRepository niveaurepo;

    @RequestMapping(method = RequestMethod.POST, value = "/preinscription")
    public ResponseEntity<?> preinscription(
            @RequestParam String name,
            @RequestParam String surname,
            @RequestParam String dateNaiss,
            @RequestParam String lieuNaiss,
            @RequestParam String numerocni,
            @RequestPart(value = "photouser", required = false) MultipartFile photouser,
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
            @RequestPart(value = "photocni", required = false) MultipartFile photocni,
            @RequestPart(value = "relevebac", required = false) MultipartFile relevebac,
            @RequestPart(value = "releveproba", required = false) MultipartFile releveproba,
            @RequestPart(value = "actenaiss", required = false) MultipartFile actenaiss,
            @RequestPart(value = "recu", required = false) MultipartFile recu,
            @RequestParam String premierchoix,
            @RequestParam String deuxiemechoix,
            @RequestParam String troisiemechoix,
            @RequestParam String specialite,
            @RequestParam int niveau,
            @RequestPart(value = "dernierdiplom", required = false) MultipartFile dernierdiplom,
            @RequestParam String anneeObtent,
            @RequestParam Double moyenne,
            @RequestParam String infojury,
            @RequestParam String matriculediplo,
            @RequestParam String delivrepar,
            @RequestParam String Datedeliv,
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
            @RequestParam boolean art) throws IOException {

        if (!Arrays.stream(new MultipartFile[]{photouser, photocni, relevebac, releveproba, actenaiss, recu, dernierdiplom})
                .filter(Objects::nonNull)
                .allMatch(file -> Arrays.asList("image/jpeg", "image/png", "image/jpg", "application/pdf").contains(file.getContentType()))) {
        return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("Seulement les images jpeg,png,jpg, ou les fichiers pdf sont acceptees");

        }
        // verifie la présence de l'email ou du télephone pour empêcher les doublons
        if (studentService.findByEmail(email).isPresent()) {
            return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("l'utilisateur existe dejà");


        }

        Niveau niveau1 = niveaurepo.findById(niveau).orElseThrow(() -> new RuntimeException("type of this annonce is not found"));

        Student etudiant = studentService.preinscription(name, surname, dateNaiss, lieuNaiss, numerocni, photouser, adresse, sexe, email, statusMarital, langue, statusprofess, numerotel, nationalite, region, departmt, photocni, relevebac, releveproba, actenaiss, recu, premierchoix, deuxiemechoix, troisiemechoix, specialite, niveau1, dernierdiplom, anneeObtent, moyenne, infojury, matriculediplo, delivrepar, Datedeliv, nompere, professpere, nommere, professmere, nomurgent, numerourgent, villeurgent, nomtuteur, professtuteur, numerotransaction, codepreins, sport, art);

        return ResponseEntity.ok(etudiant);
    }

    // Méthode pour vérifier le type de fichier
    private boolean isValidFileType(MultipartFile... files) {
        for (MultipartFile file : files) {
            if (file != null && (!file.getContentType().startsWith("image/") && !file.getContentType().equals("application/pdf"))) {
                return false;
            }
        }
        return true;
    }

    //afficher la liste des students
    @GetMapping("/liststudents")
    public ResponseEntity<Object> getAllStudents() {
        return studentService.getAllStudents();
    }

    //rechercher un etudiant en fonction de son id
    @GetMapping("/searchbyid")
    public ResponseEntity<Student> getStudentById(@RequestParam int id) {
        return ResponseEntity.ok(studentService.getStudentById(id));
    }
    @GetMapping("/getStudentInfoById/{id}") // Mise à jour du chemin et de la variable de chemin
    public Student getStudentInfoById(@PathVariable("id") int id) {
        try {
            // Récupère l'étudiant par ID
            return studentService.getStudentById(id);
        } catch (Exception e) {
            // En cas d'erreur, vous pouvez gérer l'erreur ici, par exemple, en journalisant l'erreur.
            return null; // ou jeter une exception
        }
    }
    @PostMapping("/send-message")
    public MessageBean sendMessageToUser(@RequestBody MessageBean message) {
        return studentService.sendMessageToUser(message);
    }
    @GetMapping("/received-messages/{userId}")
    public ResponseEntity<List<MessageBean>> getReceivedMessages(@PathVariable("userId") int userId) {
        List<MessageBean> receivedMessages = studentService.getReceivedMessages(userId);
        return ResponseEntity.ok(receivedMessages);
    }


}
