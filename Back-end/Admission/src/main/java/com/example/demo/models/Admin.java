package com.example.demo.models;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "admins")
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "admin_id")
    private Long adminId;

    @Column(name = "nom")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    @Column(name = "email")
    private String email;

    @Column(name = "mot_de_passe")
    private String motDePasse;

    @Column(name = "photo")
    private String photo;

    @Column(name = "telephone")
    private String telephone;

    @Enumerated(EnumType.STRING)
    @Column(name = "statut")
    private Statut statut;

    @Column(name = "date_derniere_connexion")
    private Date dateDerniereConnexion;

    @Column(name = "date_creation")
    private Date dateCreation;
    
    @Column(name = "role")
    private Role role;

    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "admin")
    private List<Selectionne> selectionnes;

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Admin(String nom, String prenom, String email, String motDePasse, String photo, String telephone,
			Statut statut, Date dateDerniereConnexion, Date dateCreation, Role role) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.motDePasse = motDePasse;
		this.photo = photo;
		this.telephone = telephone;
		this.statut = statut;
		this.dateDerniereConnexion = dateDerniereConnexion;
		this.dateCreation = dateCreation;
		this.role = role;
	}



	@PrePersist
	public void prePersist() {
	    this.dateCreation = new Date();
	    this.dateDerniereConnexion = new Date();
	}
	@PreUpdate
	public void preUpdate() {
	    this.dateDerniereConnexion = new Date();
	}

	public Long getAdminId() {
		return adminId;
	}

	public void setAdminId(Long adminId) {
		this.adminId = adminId;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMotDePasse() {
		return motDePasse;
	}

	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Statut getStatut() {
		return statut;
	}

	public void setStatut(Statut statut) {
		this.statut = statut;
	}

	public Date getDateDerniereConnexion() {
		return dateDerniereConnexion;
	}

	public void setDateDerniereConnexion(Date dateDerniereConnexion) {
		this.dateDerniereConnexion = dateDerniereConnexion;
	}

	public Date getDateCreation() {
		return dateCreation;
	}

	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}

	public List<Selectionne> getSelectionnes() {
		return selectionnes;
	}

	public void setSelectionnes(List<Selectionne> selectionnes) {
		this.selectionnes = selectionnes;
	}
    
	
	
	public Role getRole() {
		return role;
	}



	public void setRole(Role role) {
		this.role = role;
	}



	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", nom=" + nom + ", prenom=" + prenom + ", email=" + email
				+ ", motDePasse=" + motDePasse + ", photo=" + photo + ", telephone=" + telephone + ", statut=" + statut
				+ ", dateDerniereConnexion=" + dateDerniereConnexion + ", dateCreation=" + dateCreation + ", role="
				+ role + ", selectionnes=" + selectionnes + "]";
	}

    // ... (constructeurs, getters, setters, et autres méthodes)
    
}
