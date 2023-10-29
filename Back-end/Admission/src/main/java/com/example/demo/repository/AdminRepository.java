package com.example.demo.repository;

import com.example.demo.models.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface AdminRepository extends JpaRepository<Admin, Long> {

    @Query("SELECT a FROM Admin a WHERE  a.nom like %?1%")
    Optional<Admin> findByNameCaseSensitive(String nom);
}

