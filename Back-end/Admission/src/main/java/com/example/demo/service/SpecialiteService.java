package com.example.demo.service;

import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(name = "microservice-users", url = "http://localhost:8083") 
public interface SpecialiteService {

}
