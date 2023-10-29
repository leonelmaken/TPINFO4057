package com.example.demo.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "selectionnes")
public class Selectionne {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "etudiant_id", nullable = false)
    private Long etudiantId;

    @Column(name = "nom", nullable = false)
    private String nom;

    @Column(name = "prenom", nullable = false)
    private String prenom;

    @Column(name = "matricule")
    private String matricule;

    @Column(name = "niveau")
    private String niveau;

    @ManyToOne
    private Admin admin;

    public Selectionne() {
        // constructeur par défaut
    }

	public Selectionne(Long etudiantId, String nom, String prenom, String matricule, String niveau, Admin admin) {
		super();
		this.etudiantId = etudiantId;
		this.nom = nom;
		this.prenom = prenom;
		this.matricule = matricule;
		this.niveau = niveau;
		this.admin = admin;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getEtudiantId() {
		return etudiantId;
	}

	public void setEtudiantId(Long etudiantId) {
		this.etudiantId = etudiantId;
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

	public String getMatricule() {
		return matricule;
	}

	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}

	public String getNiveau() {
		return niveau;
	}

	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "Selectionne [id=" + id + ", etudiantId=" + etudiantId + ", nom=" + nom + ", prenom=" + prenom
				+ ", matricule=" + matricule + ", niveau=" + niveau + ", admin=" + admin + "]";
	}

    // Constructeurs, getters, setters, et autres méthodes ...
    

}
