package com.example.demo.repository;

import com.example.demo.models.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher,Integer> {

    Teacher findByUsernameAndPasswordAndMatricule(String username,String password,String matricule);
    Teacher findByUsername(String username);
    List<Teacher> findByTypeIgnoreCase(String type);
}
