package com.example.demo.models;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Requete {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRequete;
    private String filerequete;
    @ManyToMany
    private List<Student> etudiant=new ArrayList<>();
	public Requete() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Requete(int idRequete, String filerequete, List<Student> etudiant) {
		super();
		this.idRequete = idRequete;
		this.filerequete = filerequete;
		this.etudiant = etudiant;
	}
	public int getIdRequete() {
		return idRequete;
	}
	public void setIdRequete(int idRequete) {
		this.idRequete = idRequete;
	}
	public String getFilerequete() {
		return filerequete;
	}
	public void setFilerequete(String filerequete) {
		this.filerequete = filerequete;
	}
	public List<Student> getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(List<Student> etudiant) {
		this.etudiant = etudiant;
	}
	@Override
	public String toString() {
		return "Requete [idRequete=" + idRequete + ", filerequete=" + filerequete + ", etudiant=" + etudiant + "]";
	}
}