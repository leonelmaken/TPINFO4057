package com.example.demo.service;

import com.example.demo.models.AnnonceBean;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@FeignClient(name = "microservice-communication", url = "http://localhost:8085")
public interface MicroserviceCommunication {

	 @PostMapping(path = "/create", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	    public AnnonceBean createAnnonce(@ModelAttribute AnnonceBean annonce,
	                                 @RequestParam(value = "image", required = false) MultipartFile imageFile);
}

