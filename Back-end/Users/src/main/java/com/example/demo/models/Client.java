package com.example.demo.models;


import jakarta.persistence.Entity;

import jakarta.persistence.Id;

@Entity
public class Client {
    @Id
    private String idclient;
    private String nom;
    private String age;

    public void setIdclient(String idclient) {
        this.idclient = idclient;
    }

    public String getIdclient() {
        return idclient;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAge() {
        return age;
    }
}
