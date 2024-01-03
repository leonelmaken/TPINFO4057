package com.example.demo.models;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class PV {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idpv;
    private String title;
    private String annee;
    private int numsemestre;

    private int num;
    @OneToMany
    private List<Student> etudiant = new ArrayList<>();
    //numero d'anonimat sn
     private Double ano_cc;
     private Double ccsur20;
     private Double ccsur30;
     //numero d'anonimat sn
     private Double ano_ee;
     private Double ccsur70;
    private Double totalsur100;
    //decision(cant ou el ou ca ou nc)
    private String decision;
    //mention(A,B,C,D,F)
    private String mention;
    @OneToOne
    private UE ue;
    private int effetifs;
    private int nbreCA;
    private Double pourcentageCA;
    private int nbreCANT;
    private Double pourcentageCANT;
    private int nbreNC;
    private Double pourcentageNC;
    private int nbreEL;
    private Double pourcentageEL;
	public PV() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PV( String title, String annee, int numsemestre, int num, List<Student> etudiant, Double ano_cc,
			Double ccsur20, Double ccsur30, Double ano_ee, Double ccsur70, Double totalsur100, String decision,
			String mention, UE ue, int effetifs, int nbreCA, Double pourcentageCA, int nbreCANT, Double pourcentageCANT,
			int nbreNC, Double pourcentageNC, int nbreEL, Double pourcentageEL) {
		super();
		this.title = title;
		this.annee = annee;
		this.numsemestre = numsemestre;
		this.num = num;
		this.etudiant = etudiant;
		this.ano_cc = ano_cc;
		this.ccsur20 = ccsur20;
		this.ccsur30 = ccsur30;
		this.ano_ee = ano_ee;
		this.ccsur70 = ccsur70;
		this.totalsur100 = totalsur100;
		this.decision = decision;
		this.mention = mention;
		this.ue = ue;
		this.effetifs = effetifs;
		this.nbreCA = nbreCA;
		this.pourcentageCA = pourcentageCA;
		this.nbreCANT = nbreCANT;
		this.pourcentageCANT = pourcentageCANT;
		this.nbreNC = nbreNC;
		this.pourcentageNC = pourcentageNC;
		this.nbreEL = nbreEL;
		this.pourcentageEL = pourcentageEL;
	}
	public int getIdpv() {
		return idpv;
	}
	public void setIdpv(int idpv) {
		this.idpv = idpv;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnnee() {
		return annee;
	}
	public void setAnnee(String annee) {
		this.annee = annee;
	}
	public int getNumsemestre() {
		return numsemestre;
	}
	public void setNumsemestre(int numsemestre) {
		this.numsemestre = numsemestre;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public List<Student> getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(List<Student> etudiant) {
		this.etudiant = etudiant;
	}
	public Double getAno_cc() {
		return ano_cc;
	}
	public void setAno_cc(Double ano_cc) {
		this.ano_cc = ano_cc;
	}
	public Double getCcsur20() {
		return ccsur20;
	}
	public void setCcsur20(Double ccsur20) {
		this.ccsur20 = ccsur20;
	}
	public Double getCcsur30() {
		return ccsur30;
	}
	public void setCcsur30(Double ccsur30) {
		this.ccsur30 = ccsur30;
	}
	public Double getAno_ee() {
		return ano_ee;
	}
	public void setAno_ee(Double ano_ee) {
		this.ano_ee = ano_ee;
	}
	public Double getCcsur70() {
		return ccsur70;
	}
	public void setCcsur70(Double ccsur70) {
		this.ccsur70 = ccsur70;
	}
	public Double getTotalsur100() {
		return totalsur100;
	}
	public void setTotalsur100(Double totalsur100) {
		this.totalsur100 = totalsur100;
	}
	public String getDecision() {
		return decision;
	}
	public void setDecision(String decision) {
		this.decision = decision;
	}
	public String getMention() {
		return mention;
	}
	public void setMention(String mention) {
		this.mention = mention;
	}
	public UE getUe() {
		return ue;
	}
	public void setUe(UE ue) {
		this.ue = ue;
	}
	public int getEffetifs() {
		return effetifs;
	}
	public void setEffetifs(int effetifs) {
		this.effetifs = effetifs;
	}
	public int getNbreCA() {
		return nbreCA;
	}
	public void setNbreCA(int nbreCA) {
		this.nbreCA = nbreCA;
	}
	public Double getPourcentageCA() {
		return pourcentageCA;
	}
	public void setPourcentageCA(Double pourcentageCA) {
		this.pourcentageCA = pourcentageCA;
	}
	public int getNbreCANT() {
		return nbreCANT;
	}
	public void setNbreCANT(int nbreCANT) {
		this.nbreCANT = nbreCANT;
	}
	public Double getPourcentageCANT() {
		return pourcentageCANT;
	}
	public void setPourcentageCANT(Double pourcentageCANT) {
		this.pourcentageCANT = pourcentageCANT;
	}
	public int getNbreNC() {
		return nbreNC;
	}
	public void setNbreNC(int nbreNC) {
		this.nbreNC = nbreNC;
	}
	public Double getPourcentageNC() {
		return pourcentageNC;
	}
	public void setPourcentageNC(Double pourcentageNC) {
		this.pourcentageNC = pourcentageNC;
	}
	public int getNbreEL() {
		return nbreEL;
	}
	public void setNbreEL(int nbreEL) {
		this.nbreEL = nbreEL;
	}
	public Double getPourcentageEL() {
		return pourcentageEL;
	}
	public void setPourcentageEL(Double pourcentageEL) {
		this.pourcentageEL = pourcentageEL;
	}
	@Override
	public String toString() {
		return "PV [idpv=" + idpv + ", title=" + title + ", annee=" + annee + ", numsemestre=" + numsemestre + ", num="
				+ num + ", etudiant=" + etudiant + ", ano_cc=" + ano_cc + ", ccsur20=" + ccsur20 + ", ccsur30="
				+ ccsur30 + ", ano_ee=" + ano_ee + ", ccsur70=" + ccsur70 + ", totalsur100=" + totalsur100
				+ ", decision=" + decision + ", mention=" + mention + ", ue=" + ue + ", effetifs=" + effetifs
				+ ", nbreCA=" + nbreCA + ", pourcentageCA=" + pourcentageCA + ", nbreCANT=" + nbreCANT
				+ ", pourcentageCANT=" + pourcentageCANT + ", nbreNC=" + nbreNC + ", pourcentageNC=" + pourcentageNC
				+ ", nbreEL=" + nbreEL + ", pourcentageEL=" + pourcentageEL + "]";
	}
}
