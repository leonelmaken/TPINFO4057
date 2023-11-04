package com.school.universitymanagementapp.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Entity
public class Student extends User{
    // << photos scannees à uploader
    private String photocni;
    private String relevebac;
    private String releveproba;
    private String actenaiss;
    private String recu;
    // >>
    private String faculte;
    private String filiere;
    @ManyToOne
    private Specialite specialite;
    @ManyToOne
    private Niveau niveau;
    //photo scannee à uploader
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
    private String nomurgent;
    private Double numerourgent;
    private String villeurgent;


}
