package com.example.demo.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class SpecialiteBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idspecialite;
    private String name;
    private String description;
	public SpecialiteBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SpecialiteBean(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}
	public int getIdspecialite() {
		return idspecialite;
	}
	public void setIdspecialite(int idspecialite) {
		this.idspecialite = idspecialite;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Specialite [idspecialite=" + idspecialite + ", name=" + name + ", description=" + description + "]";
	}
    
}