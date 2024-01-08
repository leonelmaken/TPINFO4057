package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.models.Niveau;

import java.util.Optional;

@Repository
public interface NiveauRepository extends JpaRepository<Niveau,Integer> {




    Optional<Niveau> findByNameIgnoreCase(String name);
}

