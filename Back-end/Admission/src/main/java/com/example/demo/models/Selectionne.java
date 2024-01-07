package com.example.demo.models;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "selectionnes")
public class Selectionne {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "idUser", nullable = false)
    private Long idUser;

    @ManyToOne
    @JoinColumn(name = "admin_id", nullable = false)
    private Admin admin;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;
    
    @Column(name = "matricule")
    private String matricule;

    @Temporal(TemporalType.DATE)
    @Column(name = "date_naissance")
    private Date dateNaiss;

    @Temporal(TemporalType.DATE)
    @Column(name = "date_selection")
    private Date dateSelection;

    public Selectionne() {
        // Constructeur par défaut nécessaire pour JPA
    }

   
    public Selectionne(Long idUser, Admin admin, String name, String surname, String matricule, Date dateNaiss,
			Date dateSelection) {
		super();
		this.idUser = idUser;
		this.admin = admin;
		this.name = name;
		this.surname = surname;
		this.matricule = matricule;
		this.dateNaiss = dateNaiss;
		this.dateSelection = dateSelection;
	}


	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
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

    public String getMatricule() {
		return matricule;
	}

	public void setMatricule(String matricule) {
		this.matricule = matricule;
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

    public Date getDateSelection() {
        return dateSelection;
    }

    public void setDateSelection(Date dateSelection) {
        this.dateSelection = dateSelection;
    }
}



