package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

//@Data
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
    
    
    
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String name, String surname, Date dateNaiss, String lieuNaiss, String numerocni, String photouser,
			String adresse, String sexe, String matricule, String email, String password, String statusMarital,
			String langue, String statusprofess, Double numerotel, String nationalite, String region, String departmt) {
		super();
		this.name = name;
		this.surname = surname;
		this.dateNaiss = dateNaiss;
		this.lieuNaiss = lieuNaiss;
		this.numerocni = numerocni;
		this.photouser = photouser;
		this.adresse = adresse;
		this.sexe = sexe;
		this.matricule = matricule;
		this.email = email;
		this.password = password;
		this.statusMarital = statusMarital;
		this.langue = langue;
		this.statusprofess = statusprofess;
		this.numerotel = numerotel;
		this.nationalite = nationalite;
		this.region = region;
		this.departmt = departmt;
	}
	
	@Override
	public String toString() {
		return "User [idUser=" + idUser + ", name=" + name + ", surname=" + surname + ", dateNaiss=" + dateNaiss
				+ ", lieuNaiss=" + lieuNaiss + ", numerocni=" + numerocni + ", photouser=" + photouser + ", adresse="
				+ adresse + ", sexe=" + sexe + ", matricule=" + matricule + ", email=" + email + ", password="
				+ password + ", statusMarital=" + statusMarital + ", langue=" + langue + ", statusprofess="
				+ statusprofess + ", numerotel=" + numerotel + ", nationalite=" + nationalite + ", region=" + region
				+ ", departmt=" + departmt + "]";
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public Date getDateNaiss() {
		return dateNaiss;
	}
	public void setDateNaiss(Date dateNaiss) {
		this.dateNaiss = dateNaiss;
	}
	public String getLieuNaiss() {
		return lieuNaiss;
	}
	public void setLieuNaiss(String lieuNaiss) {
		this.lieuNaiss = lieuNaiss;
	}
	public String getNumerocni() {
		return numerocni;
	}
	public void setNumerocni(String numerocni) {
		this.numerocni = numerocni;
	}
	public String getPhotouser() {
		return photouser;
	}
	public void setPhotouser(String photouser) {
		this.photouser = photouser;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getSexe() {
		return sexe;
	}
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatusMarital() {
		return statusMarital;
	}
	public void setStatusMarital(String statusMarital) {
		this.statusMarital = statusMarital;
	}
	public String getLangue() {
		return langue;
	}
	public void setLangue(String langue) {
		this.langue = langue;
	}
	public String getStatusprofess() {
		return statusprofess;
	}
	public void setStatusprofess(String statusprofess) {
		this.statusprofess = statusprofess;
	}
	public Double getNumerotel() {
		return numerotel;
	}
	public void setNumerotel(Double numerotel) {
		this.numerotel = numerotel;
	}
	public String getNationalite() {
		return nationalite;
	}
	public void setNationalite(String nationalite) {
		this.nationalite = nationalite;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getDepartmt() {
		return departmt;
	}
	public void setDepartmt(String departmt) {
		this.departmt = departmt;
	}









}
