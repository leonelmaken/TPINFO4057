package com.example.demo.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.example.demo.models.Admin;

public interface AdminService {
    ResponseEntity<String> createAdmin(Admin admin);
    ResponseEntity<String> findByName(String nom);
    ResponseEntity<Admin> getAdminById(Long id);
    ResponseEntity<List<Admin>> getAllAdmins();
    ResponseEntity<String> updateAdmin(Admin admin,Long id);
    ResponseEntity<String> deleteAdmin(Long id);
}
