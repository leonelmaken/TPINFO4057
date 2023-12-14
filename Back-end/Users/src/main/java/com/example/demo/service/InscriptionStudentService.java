package com.example.demo.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.models.Student;
import com.example.demo.models.inscriptionStudent;
import com.example.demo.repository.InscriptionStudentRepository;

@Service
public class InscriptionStudentService {

    @Autowired
    private InscriptionStudentRepository inscripRepo;

    //fonction permettant de faire son inscription a l'université
    public inscriptionStudent inscriptionEtudiant(
            Student etudiant,
            MultipartFile firsttranche,
            MultipartFile secondtranche,
            MultipartFile totalitetranche

    ) throws IOException {
        inscriptionStudent student = new inscriptionStudent();
        student.setStudent(etudiant);
        final String folder1 = new ClassPathResource("static/firsttranche/").getFile().getAbsolutePath();
        final String route1 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/firsttranche/").path(firsttranche.getOriginalFilename()).toUriString();
        byte[] bytes1 = firsttranche.getBytes();
        Path path1 = Paths.get(folder1 + File.separator + firsttranche.getOriginalFilename());
        Files.write(path1, bytes1);
        System.out.println(route1);

        final String folder2 = new ClassPathResource("static/secondtranche/").getFile().getAbsolutePath();
        final String route2 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/secondtranche/").path(secondtranche.getOriginalFilename()).toUriString();
        byte[] bytes2 = secondtranche.getBytes();
        Path path2 = Paths.get(folder2 + File.separator + secondtranche.getOriginalFilename());
        Files.write(path2, bytes2);
        System.out.println(route2);

        final String folder3 = new ClassPathResource("static/totalitetranche/").getFile().getAbsolutePath();
        final String route3 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/totalitetranche/").path(totalitetranche.getOriginalFilename()).toUriString();
        byte[] bytes3 = totalitetranche.getBytes();
        Path path3 = Paths.get(folder3 + File.separator + totalitetranche.getOriginalFilename());
        Files.write(path3, bytes3);
        System.out.println(route3);
        student.setFirsttranche("/firsttranche/"+firsttranche.getOriginalFilename());
        student.setSecondtranche("/secondtranche/"+secondtranche.getOriginalFilename());
        student.setTotalitetranche("/totalitetranche/"+totalitetranche.getOriginalFilename());

        inscripRepo.save(student);
        return student;
    }
}
