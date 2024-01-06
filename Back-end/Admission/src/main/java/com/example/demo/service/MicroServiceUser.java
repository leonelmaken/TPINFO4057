package com.example.demo.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "microservice-users", url = "http://localhost:8083")
public interface MicroServiceUser {

    @GetMapping("/Users/{userId}")
    Long getUserIdById(@PathVariable("userId") Long userId);
}
