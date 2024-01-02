package com.example.demo.models;


import java.util.Arrays;
import java.util.Date;

public class StudentCreationEvent {

    private Long studentId;
    private byte[] photocni;
    private byte[] relevebac;
    private byte[] releveproba;
    private byte[] actenaiss;
    private byte[] recu;
    private String premierchoix;
    private String deuxiemechoix;
    private String troisiemechoix;
    private String specialite;
    private String dernierdiplom;
    private String anneeObtent;
    private Double moyenne;
    private String infojury;
    private String matriculediplo;
    private String delivrepar;
    private Date Datedeliv;
    private String nompere;
    private String professpere;
    private String nommere;
    private String professmere;
    private String nomtuteur;
    private String emailtuteur;
    private String professtuteur;
    private String nomurgent;
    private Double numerourgent;
    private String villeurgent;
    private int etat;
    private Double numerotransaction;
    private Double codepreins;
    private boolean sport;
    private boolean art;

    public StudentCreationEvent() {
        // Constructeur par défaut nécessaire pour la désérialisation
    }

    

    public StudentCreationEvent(Long studentId, byte[] photocni, byte[] relevebac, byte[] releveproba, byte[] actenaiss,
			byte[] recu, String premierchoix, String deuxiemechoix, String troisiemechoix, String specialite,
			String dernierdiplom, String anneeObtent, Double moyenne, String infojury, String matriculediplo,
			String delivrepar, Date datedeliv, String nompere, String professpere, String nommere, String professmere,
			String nomtuteur, String emailtuteur, String professtuteur, String nomurgent, Double numerourgent,
			String villeurgent, int etat, Double numerotransaction, Double codepreins, boolean sport, boolean art) {
		super();
		this.studentId = studentId;
		this.photocni = photocni;
		this.relevebac = relevebac;
		this.releveproba = releveproba;
		this.actenaiss = actenaiss;
		this.recu = recu;
		this.premierchoix = premierchoix;
		this.deuxiemechoix = deuxiemechoix;
		this.troisiemechoix = troisiemechoix;
		this.specialite = specialite;
		this.dernierdiplom = dernierdiplom;
		this.anneeObtent = anneeObtent;
		this.moyenne = moyenne;
		this.infojury = infojury;
		this.matriculediplo = matriculediplo;
		this.delivrepar = delivrepar;
		Datedeliv = datedeliv;
		this.nompere = nompere;
		this.professpere = professpere;
		this.nommere = nommere;
		this.professmere = professmere;
		this.nomtuteur = nomtuteur;
		this.emailtuteur = emailtuteur;
		this.professtuteur = professtuteur;
		this.nomurgent = nomurgent;
		this.numerourgent = numerourgent;
		this.villeurgent = villeurgent;
		this.etat = etat;
		this.numerotransaction = numerotransaction;
		this.codepreins = codepreins;
		this.sport = sport;
		this.art = art;
	}



	// Ajoutez les getters et setters nécessaires

    public Long getStudentId() {
		return studentId;
	}



	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}



	public byte[] getPhotocni() {
		return photocni;
	}



	public void setPhotocni(byte[] photocni) {
		this.photocni = photocni;
	}



	public byte[] getRelevebac() {
		return relevebac;
	}



	public void setRelevebac(byte[] relevebac) {
		this.relevebac = relevebac;
	}



	public byte[] getReleveproba() {
		return releveproba;
	}



	public void setReleveproba(byte[] releveproba) {
		this.releveproba = releveproba;
	}



	public byte[] getActenaiss() {
		return actenaiss;
	}



	public void setActenaiss(byte[] actenaiss) {
		this.actenaiss = actenaiss;
	}



	public byte[] getRecu() {
		return recu;
	}



	public void setRecu(byte[] recu) {
		this.recu = recu;
	}



	public String getPremierchoix() {
		return premierchoix;
	}



	public void setPremierchoix(String premierchoix) {
		this.premierchoix = premierchoix;
	}



	public String getDeuxiemechoix() {
		return deuxiemechoix;
	}



	public void setDeuxiemechoix(String deuxiemechoix) {
		this.deuxiemechoix = deuxiemechoix;
	}



	public String getTroisiemechoix() {
		return troisiemechoix;
	}



	public void setTroisiemechoix(String troisiemechoix) {
		this.troisiemechoix = troisiemechoix;
	}



	public String getSpecialite() {
		return specialite;
	}



	public void setSpecialite(String specialite) {
		this.specialite = specialite;
	}



	public String getDernierdiplom() {
		return dernierdiplom;
	}



	public void setDernierdiplom(String dernierdiplom) {
		this.dernierdiplom = dernierdiplom;
	}



	public String getAnneeObtent() {
		return anneeObtent;
	}



	public void setAnneeObtent(String anneeObtent) {
		this.anneeObtent = anneeObtent;
	}



	public Double getMoyenne() {
		return moyenne;
	}



	public void setMoyenne(Double moyenne) {
		this.moyenne = moyenne;
	}



	public String getInfojury() {
		return infojury;
	}



	public void setInfojury(String infojury) {
		this.infojury = infojury;
	}



	public String getMatriculediplo() {
		return matriculediplo;
	}



	public void setMatriculediplo(String matriculediplo) {
		this.matriculediplo = matriculediplo;
	}



	public String getDelivrepar() {
		return delivrepar;
	}



	public void setDelivrepar(String delivrepar) {
		this.delivrepar = delivrepar;
	}



	public Date getDatedeliv() {
		return Datedeliv;
	}



	public void setDatedeliv(Date datedeliv) {
		Datedeliv = datedeliv;
	}



	public String getNompere() {
		return nompere;
	}



	public void setNompere(String nompere) {
		this.nompere = nompere;
	}



	public String getProfesspere() {
		return professpere;
	}



	public void setProfesspere(String professpere) {
		this.professpere = professpere;
	}



	public String getNommere() {
		return nommere;
	}



	public void setNommere(String nommere) {
		this.nommere = nommere;
	}



	public String getProfessmere() {
		return professmere;
	}



	public void setProfessmere(String professmere) {
		this.professmere = professmere;
	}



	public String getNomtuteur() {
		return nomtuteur;
	}



	public void setNomtuteur(String nomtuteur) {
		this.nomtuteur = nomtuteur;
	}



	public String getEmailtuteur() {
		return emailtuteur;
	}



	public void setEmailtuteur(String emailtuteur) {
		this.emailtuteur = emailtuteur;
	}



	public String getProfesstuteur() {
		return professtuteur;
	}



	public void setProfesstuteur(String professtuteur) {
		this.professtuteur = professtuteur;
	}



	public String getNomurgent() {
		return nomurgent;
	}



	public void setNomurgent(String nomurgent) {
		this.nomurgent = nomurgent;
	}



	public Double getNumerourgent() {
		return numerourgent;
	}



	public void setNumerourgent(Double numerourgent) {
		this.numerourgent = numerourgent;
	}



	public String getVilleurgent() {
		return villeurgent;
	}



	public void setVilleurgent(String villeurgent) {
		this.villeurgent = villeurgent;
	}



	public int getEtat() {
		return etat;
	}



	public void setEtat(int etat) {
		this.etat = etat;
	}



	public Double getNumerotransaction() {
		return numerotransaction;
	}



	public void setNumerotransaction(Double numerotransaction) {
		this.numerotransaction = numerotransaction;
	}



	public Double getCodepreins() {
		return codepreins;
	}



	public void setCodepreins(Double codepreins) {
		this.codepreins = codepreins;
	}



	public boolean isSport() {
		return sport;
	}



	public void setSport(boolean sport) {
		this.sport = sport;
	}



	public boolean isArt() {
		return art;
	}



	public void setArt(boolean art) {
		this.art = art;
	}



	@Override
	public String toString() {
		return "StudentCreationEvent [studentId=" + studentId + ", photocni=" + Arrays.toString(photocni)
				+ ", relevebac=" + Arrays.toString(relevebac) + ", releveproba=" + Arrays.toString(releveproba)
				+ ", actenaiss=" + Arrays.toString(actenaiss) + ", recu=" + Arrays.toString(recu) + ", premierchoix="
				+ premierchoix + ", deuxiemechoix=" + deuxiemechoix + ", troisiemechoix=" + troisiemechoix
				+ ", specialite=" + specialite + ", dernierdiplom=" + dernierdiplom + ", anneeObtent=" + anneeObtent
				+ ", moyenne=" + moyenne + ", infojury=" + infojury + ", matriculediplo=" + matriculediplo
				+ ", delivrepar=" + delivrepar + ", Datedeliv=" + Datedeliv + ", nompere=" + nompere + ", professpere="
				+ professpere + ", nommere=" + nommere + ", professmere=" + professmere + ", nomtuteur=" + nomtuteur
				+ ", emailtuteur=" + emailtuteur + ", professtuteur=" + professtuteur + ", nomurgent=" + nomurgent
				+ ", numerourgent=" + numerourgent + ", villeurgent=" + villeurgent + ", etat=" + etat
				+ ", numerotransaction=" + numerotransaction + ", codepreins=" + codepreins + ", sport=" + sport
				+ ", art=" + art + "]";
	}
}
