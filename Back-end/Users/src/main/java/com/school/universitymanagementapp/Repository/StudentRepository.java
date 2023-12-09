package com.school.universitymanagementapp.Repository;

import com.school.universitymanagementapp.Model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer> {
	Student findByEmail(String email);
    Optional<Student> findByMatricule(String matricule);
}