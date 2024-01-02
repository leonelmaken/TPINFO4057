package com.example.demo.controller;

import com.example.demo.models.UE;
import com.example.demo.service.UEService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ue")
public class UEController {

    @Autowired
    private UEService ueService;

    @GetMapping("/liste")
    public ResponseEntity<List<UE>> getAllUEs() {
        List<UE> ues = ueService.getAllUEs();
        return ResponseEntity.ok(ues);
    }

    @GetMapping("/{id}")
    public ResponseEntity<UE> getUEById(@PathVariable int id) {
        UE ue = ueService.getUEById(id);
        if (ue != null) {
            return ResponseEntity.ok(ue);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping(path = "/create")
    public ResponseEntity<UE> createUE(@RequestBody UE ue) {
        UE createdUE = ueService.createUE(ue);
        return ResponseEntity.ok(createdUE);
    }

    @PutMapping("/{id}")
    public ResponseEntity<UE> updateUE(@PathVariable int id, @RequestBody UE ue) {
        UE updatedUE = ueService.updateUE(id, ue);
        if (updatedUE != null) {
            return ResponseEntity.ok(updatedUE);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUE(@PathVariable int id) {
        ueService.deleteUE(id);
        return ResponseEntity.noContent().build();
    }
}
