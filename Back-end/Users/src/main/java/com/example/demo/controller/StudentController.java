package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.models.Niveau;
import com.example.demo.models.Specialite;
import com.example.demo.models.Student;
import com.example.demo.repository.NiveauRepository;
import com.example.demo.repository.SpecialiteRepository;
import com.example.demo.service.StudentService;

import java.io.IOException;
import java.util.Date;
import java.util.Optional;

@RestController
@RequestMapping("/api/students")
public class StudentController {

    @Autowired
    private StudentService studentService;
    
    @Autowired
    private SpecialiteRepository specialiteRepository;

    private NiveauRepository niveauRepository;


    @RequestMapping(method = RequestMethod.POST, value = "/preinscription")
    public ResponseEntity<?> preinscription(
            @RequestParam String name,
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
            @RequestParam MultipartFile photocni,
            @RequestParam MultipartFile relevebac,
            @RequestParam MultipartFile releveproba,
            @RequestParam MultipartFile actenaiss,
            @RequestParam MultipartFile recu,
            @RequestParam String premierchoix,
            @RequestParam String deuxiemechoix,
            @RequestParam String troisiemechoix,
            @RequestParam Specialite specialite,
            @RequestParam int niveau,
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
            // Vérifier le type de fichier pour chaque champ MultipartFile
            if (!isValidFileType(photouser, photocni, actenaiss, relevebac, releveproba, recu, dernierdiplom)) {
                return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
                        .body("Seulement les images jpeg, @PostMapping(\"/sendMessage\")\n"
                        		+ "    public ResponseEntity<Object> sendMessage(\n"
                        		+ "            @RequestParam Long senderId,\n"
                        		+ "            @RequestParam Long receiverId,\n"
                        		+ "            @RequestParam String content) {\n"
                        		+ "        try {\n"
                        		+ "            // Appeler le service pour envoyer le message\n"
                        		+ "            studentService.sendMessage(senderId, receiverId, content);\n"
                        		+ "            return ResponseEntity.ok(\"Message sent successfully!\");\n"
                        		+ "        } catch (Exception e) {\n"
                        		+ "            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)\n"
                        		+ "                    .body(\"Une exception s'est produite lors de l'envoi du message : \" + e.getMessage());\n"
                        		+ "        } png, jpg, ou les fichiers pdf sont acceptés");
            }

            // Vérifier si l'email existe déjà
            if (studentService.findByEmail(email).isPresent()) {
                return ResponseEntity.status(HttpStatus.CONFLICT).body("L'utilisateur existe déjà");
            }

            // Récupérer le niveau
            Niveau niveauObj = niveauRepository.findById(niveau)
                    .orElseThrow(() -> new RuntimeException("Le niveau spécifié n'a pas été trouvé"));

            // Appeler le service pour créer l'étudiant
            Student etudiant = studentService.preinscription(
                    name, surname, dateNaiss, lieuNaiss, numerocni, photouser, adresse, sexe, email, statusMarital,
                    langue, statusprofess, numerotel, nationalite, region, departmt, photocni, relevebac, releveproba,
                    actenaiss, recu, premierchoix, deuxiemechoix, troisiemechoix, specialite, niveauObj, dernierdiplom,
                    anneeObtent, moyenne, infojury, matriculediplo, delivrepar, Datedeliv, nompere, professpere, nommere,
                    professmere, nomurgent, numerourgent, villeurgent, nomtuteur, professtuteur, numerotransaction, codepreins, sport, art);

            return ResponseEntity.ok(etudiant);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Une exception s'est produite lors de la préinscription : " + e.getMessage());
        }
    }

    // Méthode pour vérifier le type de fichier
    private boolean isValidFileType(MultipartFile... files) {
        for (MultipartFile file : files) {
            if (!file.getContentType().startsWith("image/") && !file.getContentType().equals("application/pdf")) {
                return false;
            }
        }
        return true;
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
    
    @PostMapping("/sendMessage")
    public ResponseEntity<Object> sendMessage1(
            @RequestParam Long senderId,
            @RequestParam Long receiverId,
            @RequestParam String content) {
        try {
            // Appeler le service pour envoyer le message
            studentService.sendMessage(senderId, receiverId, content);
            return ResponseEntity.ok("Message sent successfully!");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Une exception s'est produite lors de l'envoi du message : " + e.getMessage());
        }
}
}

    