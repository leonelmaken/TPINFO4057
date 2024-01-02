package com.example.demo.models;



import jakarta.persistence.*;



@Entity
public class UEBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idue;
    private String intitule;
    private String code;
 
	public UEBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UEBean(String intitule, String code) {
		super();
		this.intitule = intitule;
		this.code = code;
	}
	public int getIdue() {
		return idue;
	}
	public void setIdue(int idue) {
		this.idue = idue;
	}
	public String getIntitule() {
		return intitule;
	}
	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "UE [idue=" + idue + ", intitule=" + intitule + ", code=" + code + "]";
	}
}