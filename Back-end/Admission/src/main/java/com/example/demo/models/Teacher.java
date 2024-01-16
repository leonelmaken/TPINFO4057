package com.example.demo.models;

import java.util.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "teachers")
public class Teacher {

	   @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id_teacher")
	    private Long idTeacher; 

	   
	   @ManyToOne(cascade = CascadeType.PERSIST)
	   @JoinColumn(name = "admin_id")
	   private Admin idAdmin;

	    @Column(name = "name", nullable = false)
	    private String name;

	    @Column(name = "surname", nullable = false)
	    private String surname;

	    @Column(name = "date_naiss")
	    private Date dateNaiss;

	    @Column(name = "lieu_naiss")
	    private String lieuNaiss;

	    @Column(name = "numerocni")
	    private String numerocni;

	    @Column(name = "photouser")
	    private String photouser;

	    @Column(name = "adresse")
	    private String adresse;

	    @Column(name = "sexe")
	    private String sexe;

	    @Column(name = "matricule")
	    private String matricule;

	    @Column(name = "email", nullable = false, unique = true)
	    private String email;

	    @Column(name = "password", nullable = false)
	    private String password;

	    @Column(name = "status_marital")
	    private String statusMarital;

	    @Column(name = "langue")
	    private String langue;
	    @Column(name = "numerotel")
	    private Double numerotel;

	    @Column(name = "nationalite")
	    private String nationalite;

	    @Column(name = "region")
	    private String region;

	    @Column(name = "departmt")
	    private String departmt;

	    @Column(name = "statut")
	    private Statut statut;
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Teacher(Admin idAdmin, String name, String surname, Date dateNaiss, String lieuNaiss,
			String numerocni, String photouser, String adresse, String sexe, String matricule, String email,
			String password, String statusMarital, String langue, String statusprofess, Double numerotel,
			String nationalite, String region, String departmt, Statut statut) {
		super();
		this.idAdmin = idAdmin;
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
		this.numerotel = numerotel;
		this.nationalite = nationalite;
		this.region = region;
		this.departmt = departmt;
		this.statut = statut;
	}


	public Admin getIdAdmin() {
		return idAdmin;
	}


	public void setIdAdmin(Admin idAdmin) {
		this.idAdmin = idAdmin;
	}


	public Long getIdTeacher() {
		return idTeacher;
	}
	public void setIdTeacher(Long idTeacher) {
		this.idTeacher = idTeacher;
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
	public Statut getStatut() {
		return statut;
	}
	public void setStatut(Statut statut) {
		this.statut = statut;
	}


	@Override
	public String toString() {
		return "Teacher [idTeacher=" + idTeacher + ", idAdmin=" + idAdmin + ", name=" + name + ", surname=" + surname
				+ ", dateNaiss=" + dateNaiss + ", lieuNaiss=" + lieuNaiss + ", numerocni=" + numerocni + ", photouser="
				+ photouser + ", adresse=" + adresse + ", sexe=" + sexe + ", matricule=" + matricule + ", email="
				+ email + ", password=" + password + ", statusMarital=" + statusMarital + ", langue=" + langue
				+ ", numerotel=" + numerotel + ", nationalite=" + nationalite + ", region=" + region + ", departmt="
				+ departmt + ", statut=" + statut + "]";
	}

}
