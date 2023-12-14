package com.example.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.models.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer>{

	Student findByEmail(String email);
    Optional<Student> findByMatricule(String matricule);
}
