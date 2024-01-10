package com.example.demo.controller;

import com.example.demo.models.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;

@RestController
public class UserController {

    @Autowired
    UserServices userServices;
    UserRepository userRepository;

    //creation des comptes utilisateurs
    @RequestMapping(value = "/createAccount", method = RequestMethod.POST)
    public ResponseEntity<?> createAccount(
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

        User utilisateur = userServices.createUser(password, numerotel, username, email, matricule, photouser);

        return ResponseEntity.ok(utilisateur);
    }

    //connexion de l'utilisateur
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity<?> loginUser(
            @RequestParam String password,
            @RequestParam String email
    ) {

        User user = userServices.loginUser(email, password);
        if (user != null) {
            // Retourne l'utilisateur s'il est trouvé
            return ResponseEntity.ok(user);
        } else {
            // Retourne une réponse d'erreur si les informations d'identification sont incorrectes
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Informations d'identification incorrectes.");
        }
    }

}


