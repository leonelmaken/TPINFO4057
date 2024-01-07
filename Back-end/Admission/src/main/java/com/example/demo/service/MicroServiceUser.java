package com.example.demo.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.config.FeignConfig;
import com.example.demo.models.StudentBean;

@FeignClient(name = "microservice-users", configuration = FeignConfig.class, url = "http://localhost:8083")
public interface MicroServiceUser {

    @GetMapping("/getStudentInfoById")
    StudentBean getStudentInfoById(@PathVariable long etudiantId);
}
