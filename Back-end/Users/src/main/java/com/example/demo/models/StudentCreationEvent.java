package com.example.demo.models;


import java.util.Date;

public class StudentCreationEvent {

    private Long studentId;
    private String photocni;
    private String relevebac;
    private String releveproba;
    private String actenaiss;
    private String recu;
    private String premierchoix;
    private String deuxiemechoix;
    private String troisiemechoix;
    private String specialite;
    private String dernierdiplom;
    private String anneeObtent;
    private Double moyenne;
    private String infojury;
    private String matriculediplo;
    private String delivrepar;
    private Date Datedeliv;
    private String nompere;
    private String professpere;
    private String nommere;
    private String professmere;
    private String nomtuteur;
    private String emailtuteur;
    private String professtuteur;
    private String nomurgent;
    private Double numerourgent;
    private String villeurgent;
    private int etat;
    private Double numerotransaction;
    private Double codepreins;
    private boolean sport;
    private boolean art;

    public StudentCreationEvent() {
        // Constructeur par défaut nécessaire pour la désérialisation
    }

    public StudentCreationEvent(Student student) {
       // this.studentId = student.getIdUser();
        this.photocni = student.getPhotocni();
        this.relevebac = student.getRelevebac();
        this.releveproba = student.getReleveproba();
        // ... (ajoutez les autres propriétés de Student)
    }

    // Ajoutez les getters et setters nécessaires

    @Override
    public String toString() {
        return "StudentCreationEvent{" +
                "studentId=" + studentId +
                ", photocni='" + photocni + '\'' +
                ", relevebac='" + relevebac + '\'' +
                // ... (ajoutez les autres propriétés de Student)
                '}';
    }
}
