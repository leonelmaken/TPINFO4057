package com.example.demo.models;

public class SelectionEvent {
    private Long adminId;
    private Long etudiantId;
    private String matricule;  // Ajout du matricule

    public SelectionEvent() {
        // Constructeur par défaut
    }

    public SelectionEvent(Long adminId, Long etudiantId, String matricule) {
        this.adminId = adminId;
        this.etudiantId = etudiantId;
        this.matricule = matricule;
    }

    public Long getAdminId() {
        return adminId;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public Long getEtudiantId() {
        return etudiantId;
    }

    public void setEtudiantId(Long etudiantId) {
        this.etudiantId = etudiantId;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    // Ajoutez d'autres constructeurs, getters et setters si nécessaire
}
