package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
public class Niveau {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idNiveau;
    private String name;
    @OneToMany(cascade = CascadeType.ALL)
    private List<UE> eu= new ArrayList<>();
}
