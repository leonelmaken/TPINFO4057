package com.school.universitymanagementapp.Repository;

import com.school.universitymanagementapp.Model.Student;
import com.school.universitymanagementapp.Model.inscriptionStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface inscriptionStudentRepository extends JpaRepository<inscriptionStudent,Integer> {
    //Optional<Student> findByMatricule(String matricule);
}
