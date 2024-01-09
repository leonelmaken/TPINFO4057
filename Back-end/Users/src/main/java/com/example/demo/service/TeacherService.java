package com.example.demo.service;

import com.example.demo.models.Teacher;
import com.example.demo.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
