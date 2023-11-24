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
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String photocni, String relevebac, String releveproba, String actenaiss, String recu, String faculte,
			String filiere, Specialite specialite, Niveau niveau, String dernierdiplom, String anneeObtent,
			Double moyenne, String infojury, String matriculediplo, String delivrepar, Date datedeliv, String nompere,
			String professpere, String nommere, String professmere, String nomurgent, Double numerourgent,
			String villeurgent) {
		super();
		this.photocni = photocni;
		this.relevebac = relevebac;
		this.releveproba = releveproba;
		this.actenaiss = actenaiss;
		this.recu = recu;
		this.faculte = faculte;
		this.filiere = filiere;
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
		this.nomurgent = nomurgent;
		this.numerourgent = numerourgent;
		this.villeurgent = villeurgent;
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
	public String getFaculte() {
		return faculte;
	}
	public void setFaculte(String faculte) {
		this.faculte = faculte;
	}
	public String getFiliere() {
		return filiere;
	}
	public void setFiliere(String filiere) {
		this.filiere = filiere;
	}
	public Specialite getSpecialite() {
		return specialite;
	}
	public void setSpecialite(Specialite specialite) {
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
	@Override
	public String toString() {
		return "Student [photocni=" + photocni + ", relevebac=" + relevebac + ", releveproba=" + releveproba
				+ ", actenaiss=" + actenaiss + ", recu=" + recu + ", faculte=" + faculte + ", filiere=" + filiere
				+ ", specialite=" + specialite + ", niveau=" + niveau + ", dernierdiplom=" + dernierdiplom
				+ ", anneeObtent=" + anneeObtent + ", moyenne=" + moyenne + ", infojury=" + infojury
				+ ", matriculediplo=" + matriculediplo + ", delivrepar=" + delivrepar + ", Datedeliv=" + Datedeliv
				+ ", nompere=" + nompere + ", professpere=" + professpere + ", nommere=" + nommere + ", professmere="
				+ professmere + ", nomurgent=" + nomurgent + ", numerourgent=" + numerourgent + ", villeurgent="
				+ villeurgent + "]";
	}
    
}
