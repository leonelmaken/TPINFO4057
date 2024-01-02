package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.models.Niveau;
import com.example.demo.models.Specialite;
import com.example.demo.models.Student;
import com.example.demo.service.StudentService;

import java.io.IOException;
import java.util.Date;
import java.util.Optional;

@RestController
@RequestMapping("/api/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @PostMapping("/preinscription")
    public ResponseEntity<Object> preinscription(
            @RequestParam String name,
            @RequestParam String surname,
            @RequestParam String dateNaiss,
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
            @RequestParam MultipartFile photocni,
            @RequestParam MultipartFile relevebac,
            @RequestParam MultipartFile releveproba,
            @RequestParam MultipartFile actenaiss,
            @RequestParam MultipartFile recu,
            @RequestParam String premierchoix,
            @RequestParam String deuxiemechoix,
            @RequestParam String troisiemechoix,
            @RequestParam Specialite specialite,
            @RequestParam Niveau niveau,
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
            @RequestParam boolean art) {

        try {
            // Assuming your MultipartFile fields are now part of the Student object
            // Set the file paths or perform any other necessary processing
            String photouserPath = "/photouser/" + photouser.getOriginalFilename();
            String photocniPath = "/photocni/" + photocni.getOriginalFilename();
            // Add similar processing for other files

            // Calling studentService.preinscription method with the modified Student object
            studentService.preinscription(
                    name, surname, new Date(), lieuNaiss,
                    numerocni, photouserPath, adresse, sexe,
                    email, statusMarital, langue, statusprofess,
                    numerotel, nationalite, region, departmt,
                    photocni.getBytes(), relevebac.getBytes(), releveproba.getBytes(), actenaiss.getBytes(),
                    recu.getBytes(), premierchoix, deuxiemechoix, troisiemechoix,
                    specialite, niveau, dernierdiplom.getOriginalFilename(), anneeObtent,
                    moyenne, infojury, matriculediplo, delivrepar,
                    Datedeliv, nompere, professpere, nommere,
                    professmere, nomurgent, numerourgent, villeurgent,
                    nomtuteur, professtuteur, numerotransaction, codepreins,
                    sport, art);

            // Returning a success response
            return ResponseEntity.ok("Preinscription successful");
        } catch (IOException e) {
            e.printStackTrace(); // Handle the exception according to your logic
            // Return an error response if needed
            return ResponseEntity.status(500).body("Error processing files");
        }
    }

    @PostMapping("/envoyerMessage")
    public ResponseEntity<Object> envoyerMessage(
            @RequestParam Long senderId,
            @RequestParam Long receiverId,
            @RequestParam String content) {
        // Call the appropriate method in the service to send the message
        studentService.sendMessage(senderId, receiverId, content);
        // Returning a success response
        return ResponseEntity.ok("Message sent successfully");
    }



    @GetMapping("/byEmail")
    public ResponseEntity<Optional<Student>> getByEmail(@RequestParam String email) {
        return ResponseEntity.ok(studentService.findByEmail(email));
    }

    @GetMapping("/byNom")
    public ResponseEntity<Object> getByNom(@RequestParam String name) {
        return studentService.findByNom(name);
    }

    @DeleteMapping("/delete/{studentId}")
    public ResponseEntity<Object> deleteStudent(@PathVariable Long studentId) {
        return studentService.deleteStudent(studentId);
    }

    @GetMapping("/all")
    public ResponseEntity<Object> getAllStudents() {
        return studentService.getAllStudents();
    }
}

    