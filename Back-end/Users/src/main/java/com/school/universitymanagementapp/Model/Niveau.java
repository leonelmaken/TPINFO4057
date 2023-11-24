package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
public class Niveau {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idNiveau;
    private String name;
    @OneToMany(cascade = CascadeType.ALL)
    private List<UE> eu= new ArrayList<>();
	public Niveau() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Niveau(String name, List<UE> eu) {
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
	public List<UE> getEu() {
		return eu;
	}
	public void setEu(List<UE> eu) {
		this.eu = eu;
	}
	@Override
	public String toString() {
		return "Niveau [idNiveau=" + idNiveau + ", name=" + name + ", eu=" + eu + "]";
	}
}
