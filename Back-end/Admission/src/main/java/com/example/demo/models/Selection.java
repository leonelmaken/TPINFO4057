package com.example.demo.models;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "selection")
public class Selection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "selection_id")
    private Long selectionId;

    @Column(name = "etudiant_nom")
    private String etudiantNom;

    @Column(name = "etudiant_prenom")
    private String etudiantPrenom;

    @Column(name = "etudiant_id")
    private Long etudiantid;
    
    @Column(name = "photocopie_bac")
    private String photocopie_bac;
    
    @Column(name = "photocopie_cni")
    private String photocopie_cni;
    
    @Column(name = "photocopie_probatoire")
    private String photocopie_probatoire;
    
    @Column(name = "photocopie_licence")
    private String photocopie_licence;
    
    @Column(name = "photocopie_acte")
    private String photocopie_acte;
    // ... autres attributs représentant les détails de la candidature

    @ManyToOne
    @JoinColumn(name="admin_id")
    private Admin admin; // l'admin qui a évalué cette candidature

    
    
    public Selection() {}

    public Selection(String etudiantNom, String etudiantPrenom, Admin admin) {
        this.etudiantNom = etudiantNom;
        this.etudiantPrenom = etudiantPrenom;
        this.admin = admin;
    }

    // ... autres getters et setters

    public Long getSelectionId() {
        return selectionId;
    }

    public void setSelectionId(Long selectionId) {
        this.selectionId = selectionId;
    }

    public String getEtudiantNom() {
        return etudiantNom;
    }

    public void setEtudiantNom(String etudiantNom) {
        this.etudiantNom = etudiantNom;
    }

    public String getEtudiantPrenom() {
        return etudiantPrenom;
    }

    public void setEtudiantPrenom(String etudiantPrenom) {
        this.etudiantPrenom = etudiantPrenom;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
    
	public Long getEtudiantid() {
		return etudiantid;
	}

	public void setEtudiantid(Long etudiantid) {
		this.etudiantid = etudiantid;
	}

	public String getPhotocopie_bac() {
		return photocopie_bac;
	}

	public void setPhotocopie_bac(String photocopie_bac) {
		this.photocopie_bac = photocopie_bac;
	}

	public String getPhotocopie_cni() {
		return photocopie_cni;
	}

	public void setPhotocopie_cni(String photocopie_cni) {
		this.photocopie_cni = photocopie_cni;
	}

	public String getPhotocopie_probatoire() {
		return photocopie_probatoire;
	}

	public void setPhotocopie_probatoire(String photocopie_probatoire) {
		this.photocopie_probatoire = photocopie_probatoire;
	}

	public String getPhotocopie_licence() {
		return photocopie_licence;
	}

	public void setPhotocopie_licence(String photocopie_licence) {
		this.photocopie_licence = photocopie_licence;
	}

	public String getPhotocopie_acte() {
		return photocopie_acte;
	}

	public void setPhotocopie_acte(String photocopie_acte) {
		this.photocopie_acte = photocopie_acte;
	}

	@Override
	public String toString() {
		return "Selection [selectionId=" + selectionId + ", etudiantNom=" + etudiantNom + ", etudiantPrenom="
				+ etudiantPrenom + ", etudiantid=" + etudiantid + ", photocopie_bac=" + photocopie_bac
				+ ", photocopie_cni=" + photocopie_cni + ", photocopie_probatoire=" + photocopie_probatoire
				+ ", photocopie_licence=" + photocopie_licence + ", photocopie_acte=" + photocopie_acte + ", admin="
				+ admin + "]";
	}
    // ... autres méthodes

}
