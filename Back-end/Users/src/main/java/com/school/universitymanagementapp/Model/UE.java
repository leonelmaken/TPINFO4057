package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class UE {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idue;
    private String intitule;
    private String code;
    @ManyToOne
    private Teacher teacher;
}
