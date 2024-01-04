package com.example.demo.models;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "niveau")
public class NiveauBean {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idNiveau;
    private String name;
    @OneToMany(cascade = CascadeType.ALL)
    private List<UEBean> eu= new ArrayList<>();
	public NiveauBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NiveauBean(String name, List<UEBean> eu) {
		super();
		this.name = name;
		this.eu = eu;
	}
	public int getIdNiveau() {
		return idNiveau;
	}
	public void setIdNiveau(int idNiveau) {
		this.idNiveau = idNiveau;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<UEBean> getEu() {
		return eu;
	}
	public void setEu(List<UEBean> eu) {
		this.eu = eu;
	}
	@Override
	public String toString() {
		return "Niveau [idNiveau=" + idNiveau + ", name=" + name + ", eu=" + eu + "]";
	}
}
