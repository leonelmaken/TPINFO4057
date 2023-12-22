package com.example.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.models.Admin;
import com.example.demo.models.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer>{

	Optional<Student> findByEmail(String email);
    Optional<Student> findByMatricule(String matricule);
    @Query("SELECT u FROM Users u WHERE  u.name like %?1%")
    Optional<Student> findByNom(String name);
	void deleteById(Long studentId);
}
