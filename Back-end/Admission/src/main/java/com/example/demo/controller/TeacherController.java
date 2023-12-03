package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.models.Teacher;
import com.example.demo.service.TeacherService;

@RestController
@RequestMapping("/api/teacher")
public class TeacherController {

	private final TeacherService teacherService;
	
	  @Autowired
	    public TeacherController(TeacherService teacherService) {
	        this.teacherService = teacherService;
	    }
	  
	   @GetMapping(path = "/read")
	    public ResponseEntity<List<Teacher>> getAllTeachers() {
	        return teacherService.getAllTeacher();
	    }

	   @GetMapping(path = "/teacher/{id}")
	    public ResponseEntity<Teacher> getTeacherById(@PathVariable Long id) {
	        return teacherService.getTeacherById(id);
	    }
	   @PostMapping(path = "/create")
	    public ResponseEntity<String> createTeacher(@RequestBody Teacher teacher) {
	        return teacherService.createTeacher(teacher);
	    }
	   @PutMapping(path = "/update/{id}")
	    public ResponseEntity<String> updateTeacher(@PathVariable Long id, @RequestBody Teacher teacher) {
	        return teacherService.updateTeacher(teacher, id);
	    }
	   @DeleteMapping(path = "/delete/{id}")
	    public ResponseEntity<String> deleteTeacher(@PathVariable Long id) {
	        return teacherService.deleteTeacher(id);
	    }
	   @GetMapping("/read/name/{name}")
	    public ResponseEntity<String> getTeacherByName(@RequestParam String nom) {
	        return teacherService.findByName(nom);
	    }
	   @GetMapping("/read/matricule/{name}")
	    public ResponseEntity<String> getTeacherByMatricule(@RequestParam String matricule) {
	        return teacherService.findByMatricule(matricule);
	    }
}
