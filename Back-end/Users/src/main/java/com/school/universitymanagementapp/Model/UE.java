package com.school.universitymanagementapp.Model;

import jakarta.persistence.*;
import lombok.Data;


@Entity
public class UE {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idue;
    private String intitule;
    private String code;
    @ManyToOne
    private Teacher teacher;
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
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
}
