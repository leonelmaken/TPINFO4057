package com.example.demo.controller;

import com.example.demo.models.Teacher;
import com.example.demo.models.User;
import com.example.demo.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@RestController
public class TeacherController {

    @Autowired
    TeacherService teacherService;

    // requete permettant à l'utilisateur de se connecter
    @RequestMapping(method = RequestMethod.POST, value = "/connexionteacher")
    public ResponseEntity<Teacher> login(@RequestBody Map<String, String> loginForm) {
        String username = loginForm.get("username");
        String password = loginForm.get("password");
        String matricule = loginForm.get("matricule");
        Teacher teacher = teacherService.login(username, password, matricule);
        if (teacher != null) {
            return ResponseEntity.ok(teacher);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }

    //afficher la liste des teachers
    @RequestMapping(method = RequestMethod.GET, value = "/listTeacher")
    public ResponseEntity<Object> getAllteacher() {
        return teacherService.getAllteacher();
    }

    //rechercher les utilisateurs dont le type est teacher
    @RequestMapping(method = RequestMethod.GET, value = "/listTeacher/{type}")
    public List<Teacher> getTeacher(@PathVariable String type){
        return teacherService.findByType(type);
    }

    //create account teacher
    @RequestMapping(value = "/createAccount/teacher", method = RequestMethod.POST)
    public ResponseEntity<?> createAccount(
            @RequestParam String name,
            @RequestParam String surname,
            @RequestParam String password,
            @RequestParam Double numerotel,
            @RequestParam String username,
            @RequestParam String email,
            @RequestParam String matricule,
            @RequestParam MultipartFile photouser
    ) throws IOException {
        if (!Arrays.stream(new MultipartFile[]{photouser})
                .filter(Objects::nonNull)
                .allMatch(file -> Arrays.asList("image/jpeg", "image/png", "image/jpg", "application/pdf").contains(file.getContentType()))) {
            return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("Seulement les images jpeg,png,jpg, ou les fichiers pdf sont acceptees");

        }
        /* verifie la présence de l'email existe deja dans la base de donnée
        if (userServices.findByEmail(email).isPresent()) {
            return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE).body("l'utilisateur existe dejà");
        }*/

        Teacher utilisateur = teacherService.createTeacher(name,surname,password, numerotel, username, email, matricule, photouser);

        return ResponseEntity.ok(utilisateur);
    }

}
