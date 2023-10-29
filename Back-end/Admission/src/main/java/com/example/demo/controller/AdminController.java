package com.example.demo.controller;

import com.example.demo.models.Admin;
import com.example.demo.service.AdminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/admins")
public class AdminController {

    private final AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping(path = "/read")
    public ResponseEntity<List<Admin>> getAllAdmins() {
        return adminService.getAllAdmins();
    }

    @GetMapping(path = "/admin/{id}")
    public ResponseEntity<Admin> getAdminById(@PathVariable Long id) {
        return adminService.getAdminById(id);
    }

    @PostMapping(path = "/create")
    public ResponseEntity<String> createAdmin(@RequestBody Admin admin) {
        return adminService.createAdmin(admin);
    }

    @PutMapping(path = "/update/{id}")
    public ResponseEntity<String> updateAdmin(@PathVariable Long id, @RequestBody Admin admin) {
        return adminService.updateAdmin(admin, id);
    }

    @DeleteMapping(path = "/delete/{id}")
    public ResponseEntity<String> deleteAdmin(@PathVariable Long id) {
        return adminService.deleteAdmin(id);
    }

    @GetMapping("/read/name/{name}")
    public ResponseEntity<String> getAdminByName(@RequestParam String nom) {
        return adminService.findByName(nom);
    }
}

