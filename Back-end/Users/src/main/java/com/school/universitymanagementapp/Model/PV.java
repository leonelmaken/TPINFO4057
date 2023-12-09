package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
public class PV {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idpv;
    private String title;
    private String annee;
    private int numsemestre;

    private int num;
    @OneToMany
    private List<Student> etudiant = new ArrayList<>();
    //numero d'anonimat sn
     private Double ano_cc;
     private Double ccsur20;
     private Double ccsur30;
     //numero d'anonimat sn
     private Double ano_ee;
     private Double ccsur70;
    private Double totalsur100;
    //decision(cant ou el ou ca ou nc)
    private String decision;
    //mention(A,B,C,D,F)
    private String mention;
    @OneToOne
    private UE ue;
    private int effetifs;
    private int nbreCA;
    private Double pourcentageCA;
    private int nbreCANT;
    private Double pourcentageCANT;
    private int nbreNC;
    private Double pourcentageNC;
    private int nbreEL;
    private Double pourcentageEL;



}
