package com.example.demo.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.models.AnnonceBean;
import com.example.demo.models.Teacher;

public interface TeacherService {
	
    ResponseEntity<String> createTeacher(Long adminId,Teacher teacher);

    ResponseEntity<String> findByName(String name);

    ResponseEntity<String> findByMatricule(String matricule);

    ResponseEntity<Teacher> getTeacherById(Long id);

    ResponseEntity<List<Teacher>> getAllTeacher();

    ResponseEntity<String> updateTeacher(Teacher teacher, Long id);

    ResponseEntity<String> deleteTeacher(Long id);

    AnnonceBean createAnnonceForTeacherWithFeign(Long teacherId, AnnonceBean annonce, MultipartFile imageFile);
}
