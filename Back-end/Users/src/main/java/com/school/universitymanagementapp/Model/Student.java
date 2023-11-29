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
	private int etat;
    private Double numerotransaction;
    private Double codepreins;
    private boolean sport;
    private boolean art;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
	public Student(String photocni, String relevebac, String releveproba, String actenaiss, String recu,
			String premierchoix, String deuxiemechoix, String troisiemechoix, String specialite, Niveau niveau,
			String dernierdiplom, String anneeObtent, Double moyenne, String infojury, String matriculediplo,
			String delivrepar, Date datedeliv, String nompere, String professpere, String nommere, String professmere,
			String nomtuteur, String emailtuteur, String professtuteur, String nomurgent, Double numerourgent,
			String villeurgent, int etat, Double numerotransaction, Double codepreins, boolean sport, boolean art) {
		super();
		this.photocni = photocni;
		this.relevebac = relevebac;
		this.releveproba = releveproba;
		this.actenaiss = actenaiss;
		this.recu = recu;
		this.premierchoix = premierchoix;
		this.deuxiemechoix = deuxiemechoix;
		this.troisiemechoix = troisiemechoix;
		this.specialite = specialite;
		this.niveau = niveau;
		this.dernierdiplom = dernierdiplom;
		this.anneeObtent = anneeObtent;
		this.moyenne = moyenne;
		this.infojury = infojury;
		this.matriculediplo = matriculediplo;
		this.delivrepar = delivrepar;
		Datedeliv = datedeliv;
		this.nompere = nompere;
		this.professpere = professpere;
		this.nommere = nommere;
		this.professmere = professmere;
		this.nomtuteur = nomtuteur;
		this.emailtuteur = emailtuteur;
		this.professtuteur = professtuteur;
		this.nomurgent = nomurgent;
		this.numerourgent = numerourgent;
		this.villeurgent = villeurgent;
		this.etat = etat;
		this.numerotransaction = numerotransaction;
		this.codepreins = codepreins;
		this.sport = sport;
		this.art = art;
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


	public int getEtat() {
		return etat;
	}


	public void setEtat(int etat) {
		this.etat = etat;
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


	@Override
	public String toString() {
		return "Student [photocni=" + photocni + ", relevebac=" + relevebac + ", releveproba=" + releveproba
				+ ", actenaiss=" + actenaiss + ", recu=" + recu + ", premierchoix=" + premierchoix + ", deuxiemechoix="
				+ deuxiemechoix + ", troisiemechoix=" + troisiemechoix + ", specialite=" + specialite + ", niveau="
				+ niveau + ", dernierdiplom=" + dernierdiplom + ", anneeObtent=" + anneeObtent + ", moyenne=" + moyenne
				+ ", infojury=" + infojury + ", matriculediplo=" + matriculediplo + ", delivrepar=" + delivrepar
				+ ", Datedeliv=" + Datedeliv + ", nompere=" + nompere + ", professpere=" + professpere + ", nommere="
				+ nommere + ", professmere=" + professmere + ", nomtuteur=" + nomtuteur + ", emailtuteur=" + emailtuteur
				+ ", professtuteur=" + professtuteur + ", nomurgent=" + nomurgent + ", numerourgent=" + numerourgent
				+ ", villeurgent=" + villeurgent + ", etat=" + etat + ", numerotransaction=" + numerotransaction
				+ ", codepreins=" + codepreins + ", sport=" + sport + ", art=" + art + "]";
	}

}
