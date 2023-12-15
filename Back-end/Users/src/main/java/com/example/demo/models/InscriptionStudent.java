package com.example.demo.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;


@Entity
//@Data
public class InscriptionStudent {

    @Id
    private int idins;
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @ManyToOne
    private Student student;

    private  String firsttranche;
    private  String secondtranche;
    private  String totalitetranche;
    

    public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getFirsttranche() {
		return firsttranche;
	}
	public void setFirsttranche(String firsttranche) {
		this.firsttranche = firsttranche;
	}
	public String getSecondtranche() {
		return secondtranche;
	}
	public void setSecondtranche(String secondtranche) {
		this.secondtranche = secondtranche;
	}
	public String getTotalitetranche() {
		return totalitetranche;
	}
	public void setTotalitetranche(String totalitetranche) {
		this.totalitetranche = totalitetranche;
	}

}