package com.example.demo.service;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.models.StudentBean;



public interface FeignInterface {

	@GetMapping("/getStudentInfoById/{id}") // Mise à jour du chemin et de la variable de chemin
	static
    StudentBean getStudentInfoById(@PathVariable("id") long id) {
		// TODO Auto-generated method stub
		return null;
	}
}
