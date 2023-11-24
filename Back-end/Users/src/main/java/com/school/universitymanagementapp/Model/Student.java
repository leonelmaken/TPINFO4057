package com.school.universitymanagementapp.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
public class Student extends User{
    // << photos scannees à uploader
    private String photocni;
    private String relevebac;
    private String releveproba;
    private String actenaiss;
    private String recu;
    // >>
    
    private String premierchoix;
    private String deuxiemechoix;
    private String troisiemechoix;
    
    private String specialite;
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
    private String nomtuteur;
    private String emailtuteur;
    private String professtuteur;
    private String nomurgent;
    private Double numerourgent;
    private String villeurgent;
<<<<<<< HEAD
    private int etat;
    private Double numerotransaction;
    private Double codepreins;
    private boolean sport;
    private boolean art;
    
	public String getNomtuteur() {
		return nomtuteur;
	}
	public void setNomtuteur(String nomtuteur) {
		this.nomtuteur = nomtuteur;
	}
	public String getEmailtuteur() {
		return emailtuteur;
	}
	public void setEmailtuteur(String emailtuteur) {
		this.emailtuteur = emailtuteur;
	}
	public String getProfesstuteur() {
		return professtuteur;
	}
	public void setProfesstuteur(String professtuteur) {
		this.professtuteur = professtuteur;
	}
	public Double getNumerotransaction() {
		return numerotransaction;
	}
	public void setNumerotransaction(Double numerotransaction) {
		this.numerotransaction = numerotransaction;
	}
	public Double getCodepreins() {
		return codepreins;
	}
	public void setCodepreins(Double codepreins) {
		this.codepreins = codepreins;
	}
	public boolean isSport() {
		return sport;
	}
	public void setSport(boolean sport) {
		this.sport = sport;
	}
	public boolean isArt() {
		return art;
	}
	public void setArt(boolean art) {
		this.art = art;
	}
	public int getEtat() {
		return etat;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	public String getPhotocni() {
		return photocni;
	}
	public void setPhotocni(String photocni) {
		this.photocni = photocni;
	}
	public String getRelevebac() {
		return relevebac;
	}
	public void setRelevebac(String relevebac) {
		this.relevebac = relevebac;
	}
	public String getReleveproba() {
		return releveproba;
	}
	public void setReleveproba(String releveproba) {
		this.releveproba = releveproba;
	}
	public String getActenaiss() {
		return actenaiss;
	}
	public void setActenaiss(String actenaiss) {
		this.actenaiss = actenaiss;
	}
	public String getRecu() {
		return recu;
	}
	public void setRecu(String recu) {
		this.recu = recu;
	}

	public String getSpecialite() {
		return specialite;
	}
	public void setSpecialite(String specialite) {
		this.specialite = specialite;
	}
	public Niveau getNiveau() {
		return niveau;
	}
	public void setNiveau(Niveau niveau) {
		this.niveau = niveau;
	}
	public String getDernierdiplom() {
		return dernierdiplom;
	}
	public void setDernierdiplom(String dernierdiplom) {
		this.dernierdiplom = dernierdiplom;
	}
	public String getAnneeObtent() {
		return anneeObtent;
	}
	public void setAnneeObtent(String anneeObtent) {
		this.anneeObtent = anneeObtent;
	}
	public Double getMoyenne() {
		return moyenne;
	}
	public void setMoyenne(Double moyenne) {
		this.moyenne = moyenne;
	}
	public String getInfojury() {
		return infojury;
	}
	public void setInfojury(String infojury) {
		this.infojury = infojury;
	}
	public String getMatriculediplo() {
		return matriculediplo;
	}
	public void setMatriculediplo(String matriculediplo) {
		this.matriculediplo = matriculediplo;
	}
	public String getDelivrepar() {
		return delivrepar;
	}
	public void setDelivrepar(String delivrepar) {
		this.delivrepar = delivrepar;
	}
	public Date getDatedeliv() {
		return Datedeliv;
	}
	public void setDatedeliv(Date datedeliv) {
		Datedeliv = datedeliv;
	}
	public String getNompere() {
		return nompere;
	}
	public void setNompere(String nompere) {
		this.nompere = nompere;
	}
	public String getProfesspere() {
		return professpere;
	}
	public void setProfesspere(String professpere) {
		this.professpere = professpere;
	}
	public String getNommere() {
		return nommere;
	}
	public void setNommere(String nommere) {
		this.nommere = nommere;
	}
	public String getProfessmere() {
		return professmere;
	}
	public void setProfessmere(String professmere) {
		this.professmere = professmere;
	}
	public String getNomurgent() {
		return nomurgent;
	}
	public void setNomurgent(String nomurgent) {
		this.nomurgent = nomurgent;
	}
	public Double getNumerourgent() {
		return numerourgent;
	}
	public void setNumerourgent(Double numerourgent) {
		this.numerourgent = numerourgent;
	}
	public String getVilleurgent() {
		return villeurgent;
	}
	public void setVilleurgent(String villeurgent) {
		this.villeurgent = villeurgent;
	}
	public String getPremierchoix() {
		return premierchoix;
	}
	public void setPremierchoix(String premierchoix) {
		this.premierchoix = premierchoix;
	}
	public String getDeuxiemechoix() {
		return deuxiemechoix;
	}
	public void setDeuxiemechoix(String deuxiemechoix) {
		this.deuxiemechoix = deuxiemechoix;
	}
	public String getTroisiemechoix() {
		return troisiemechoix;
	}
	public void setTroisiemechoix(String troisiemechoix) {
		this.troisiemechoix = troisiemechoix;
	}


=======
>>>>>>> branch 'main' of https://github.com/leonelmaken/TPINFO4057.git
}
