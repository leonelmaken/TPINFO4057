package com.example.demo.models;

import jakarta.persistence.*;



@Entity
public class Annonces {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idannonce;
    private String title;
    private String description;
    private String fileannonce;
    private String imageannonce;

    @ManyToOne
    private Dean doyen;
    
}
