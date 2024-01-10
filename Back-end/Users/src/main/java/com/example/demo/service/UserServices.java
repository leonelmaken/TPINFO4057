package com.example.demo.service;

import com.example.demo.models.Student;
import com.example.demo.models.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

@Service
public class UserServices {

    @Autowired
    UserRepository userRepo;

    //creation d'un compte utilisateur

    public User createUser(
                           String password,
                           Double numerotel,
                           String username,
                           String email,
                           String matricule,
                           MultipartFile photouser
    ) throws IOException {

        User utilisateur=new User();
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
        utilisateur.setPhotouser("/photouser/"+photouser.getOriginalFilename());
        userRepo.save(utilisateur);
        return utilisateur;

    }

    //connexion d'un utilisateur
    public User loginUser(String email,String password){
        User utilisateur= userRepo.findByEmail(email);
        if (utilisateur!= null && utilisateur.getEmail().equals(email) && utilisateur.getPassword().equals(password)){
            return utilisateur;
        }
        else {
            return null;
        }
    }

    //rechercher un utilisateur en fonction de son adresse email

    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
}
