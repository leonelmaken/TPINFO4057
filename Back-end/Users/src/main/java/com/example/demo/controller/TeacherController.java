package com.example.demo.controller;

import com.example.demo.models.Teacher;
import com.example.demo.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

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

}
