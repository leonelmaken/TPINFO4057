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
	@GeneratedValue(strategy = GenerationType.SEQUENCE)

	@ManyToOne
	private Student student;

	private  String firsttranche;
	private  String secondtranche;
	private  String totalitetranche;
	private  Double numtranche1;
	private  Double numtranche2;
	private  Double numTotalite;


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



	/**
	 * @return int return the idins
	 */
	public int getIdins() {
		return idins;
	}

	/**
	 * @param idins the idins to set
	 */
	public void setIdins(int idins) {
		this.idins = idins;
	}

	/**
	 * @return Double return the numtranche1
	 */
	public Double getNumtranche1() {
		return numtranche1;
	}

	/**
	 * @param numtranche1 the numtranche1 to set
	 */
	public void setNumtranche1(Double numtranche1) {
		this.numtranche1 = numtranche1;
	}

	/**
	 * @return Double return the numtranche2
	 */
	public Double getNumtranche2() {
		return numtranche2;
	}

	/**
	 * @param numtranche2 the numtranche2 to set
	 */
	public void setNumtranche2(Double numtranche2) {
		this.numtranche2 = numtranche2;
	}

	/**
	 * @return Double return the numTotalite
	 */
	public Double getNumTotalite() {
		return numTotalite;
	}

	/**
	 * @param numTotalite the numTotalite to set
	 */
	public void setNumTotalite(Double numTotalite) {
		this.numTotalite = numTotalite;
	}

}