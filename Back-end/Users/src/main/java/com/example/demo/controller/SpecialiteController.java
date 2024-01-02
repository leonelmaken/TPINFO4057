package com.example.demo.controller;

import com.example.demo.models.Specialite;
import com.example.demo.service.SpecialiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/specialites")
public class SpecialiteController {

    @Autowired
    private SpecialiteService specialiteService;

    @GetMapping
    public List<Specialite> getAllSpecialites() {
        return specialiteService.getAllSpecialites();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Specialite> getSpecialiteById(@PathVariable int id) {
        Specialite specialite = specialiteService.getSpecialiteById(id);
        if (specialite != null) {
            return new ResponseEntity<>(specialite, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping(path = "/create")
    public ResponseEntity<Specialite> createSpecialite(@RequestBody Specialite specialite) {
        Specialite createdSpecialite = specialiteService.createSpecialite(specialite);
        return new ResponseEntity<>(createdSpecialite, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<String> updateSpecialite(@RequestBody Specialite updatedSpecialite, @PathVariable int id) {
        return specialiteService.updateSpecialite(updatedSpecialite, id);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteSpecialite(@PathVariable int id) {
        specialiteService.deleteSpecialite(id);
        return new ResponseEntity<>("Suppression réussie", HttpStatus.OK);
    }
}
