package com.example.demo.repository;

import com.example.demo.models.Teacher;
import com.example.demo.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Integer> {

    User findByEmail(String email);
    List<User> findByTypeIgnoreCase(String type);
}
