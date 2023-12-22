package com.example.demo.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.models.UserBean;  // Assure-toi que le package est correct

@FeignClient(name = "microservice-users", url = "http://localhost:8083")  // Correction de l'URL
public interface MicroServiceUser {

    @GetMapping("/Users/{userId}")  // Spécifie l'endpoint pour récupérer un utilisateur par ID
    UserBean getUserById(@PathVariable("userId") Long userId);  // Assure-toi que le type d'ID est correct
}

