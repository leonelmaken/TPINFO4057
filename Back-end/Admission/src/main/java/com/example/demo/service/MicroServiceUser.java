package com.example.demo.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable; // Ajout de cette importation

//import com.example.demo.config.FeignConfig;
import com.example.demo.models.StudentBean;

@FeignClient(name = "microservice-users", url = "http://localhost:8083")
public interface MicroServiceUser {

    @GetMapping("/getStudentInfoById/{id}") // Mise à jour du chemin et de la variable de chemin
    StudentBean getStudentInfoById(@PathVariable("id") long id);
}

