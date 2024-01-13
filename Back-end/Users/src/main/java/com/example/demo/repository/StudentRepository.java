package com.example.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.models.Admin;
import com.example.demo.models.Student;

import feign.Param;

@Repository
public interface StudentRepository extends JpaRepository<Student,Integer>{

	Optional<Student> findByEmail(String email);
    Optional<Student> findByMatricule(String matricule);
    @Query("SELECT s FROM Student s WHERE s.name LIKE %?1%")
    Optional<Student> findByNom(String name);
    @Modifying
    @Query("DELETE FROM Student s WHERE s.idUser = :userId")
    void deleteStudentByUserId(@Param("userId") int userId);
}
