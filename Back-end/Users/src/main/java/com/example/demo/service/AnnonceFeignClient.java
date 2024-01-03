package com.example.demo.service;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import com.example.demo.models.AnnonceBean;

import java.util.List;

@FeignClient(name = "microservice-communication")
public interface AnnonceFeignClient {

    @PostMapping("/api/annonces/create")
    AnnonceBean createAnnonce(@RequestBody AnnonceBean annonce);

    @GetMapping("/api/annonces/read")
    List<AnnonceBean> getAllAnnonces();

    @GetMapping("/api/annonces/{id}")
    AnnonceBean getAnnonceById(@PathVariable Long id);
}
