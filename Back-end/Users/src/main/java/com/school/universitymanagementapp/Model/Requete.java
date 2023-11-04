package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
public class Requete {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRequete;
    private String filerequete;
    @ManyToMany
    private List<Student> etudiant=new ArrayList<>();
}
