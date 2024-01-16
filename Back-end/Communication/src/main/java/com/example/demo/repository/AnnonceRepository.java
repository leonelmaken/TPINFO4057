package com.example.demo.repository;

import com.example.demo.models.Annonce;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AnnonceRepository extends JpaRepository<Annonce, Long> {

	
}