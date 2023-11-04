package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Data
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int idUser;

    private String name;
    private String surname;
    private Date dateNaiss;
    private String lieuNaiss;

    private String numerocni;
    private String photouser;

    private String adresse;
    private String sexe;
    private String matricule;
    private String email;
    private String password;
    private String statusMarital;
    private String langue;
    private String statusprofess;
    private Double numerotel;
    private String nationalite;
    private String region;
    private String departmt;









}
