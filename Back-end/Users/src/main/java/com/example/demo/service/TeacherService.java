package com.example.demo.service;

import com.example.demo.models.Student;
import com.example.demo.models.Teacher;
import com.example.demo.models.User;
import com.example.demo.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Service
public class TeacherService {

    @Autowired
    TeacherRepository teacherrepo;

    //connexion du teacher
    public Teacher login(String username, String password, String matricule) {
        Teacher teacher = teacherrepo.findByUsername(username);
        if (teacher != null && teacher.getPassword().equals(password) && teacher.getMatricule().equals(matricule)) {
            return teacher;
        }
        return null;
    }


    //recherche par matricule,password and username
    public Teacher findByUsernameAndPasswordAndMatricule(String username,String password,String matricule){
        return teacherrepo.findByUsernameAndPasswordAndMatricule(username,password,matricule);
    }

    //la liste des enseignants
    public ResponseEntity<Object> getAllteacher() {
        List<Teacher> teacher = teacherrepo.findAll();
        return ResponseEntity.ok(teacher);
    }

    // rechercher les utilisateurs par type
    public List<Teacher> findByType(String type){
        return teacherrepo.findByTypeIgnoreCase(type);
    }

    //create teacher
    public Teacher createTeacher(
            String name,
            String Surname,
            String password,
            Double numerotel,
            String username,
            String email,
            String matricule,
            MultipartFile photouser
    ) throws IOException {

        Teacher utilisateur=new Teacher();
        final String folder1 = new ClassPathResource("static/photouser/").getFile().getAbsolutePath();
        final String route1 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/photouser/").path(photouser.getOriginalFilename()).toUriString();
        byte[] bytes1 = photouser.getBytes();
        Path path1 = Paths.get(folder1 + File.separator + photouser.getOriginalFilename());
        Files.write(path1, bytes1);
        System.out.println(route1);
        utilisateur.setPassword(password);
        utilisateur.setNumerotel(numerotel);
        utilisateur.setUsername(username);
        utilisateur.setEmail(email);
        utilisateur.setMatricule(matricule);
        utilisateur.setType("teacher");
        utilisateur.setName(name);
        utilisateur.setSurname(Surname);
        utilisateur.setPhotouser("/photouser/"+photouser.getOriginalFilename());
        teacherrepo.save(utilisateur);
        return utilisateur;

    }

}
