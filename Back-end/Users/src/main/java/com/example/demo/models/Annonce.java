package com.example.demo.models;

import jakarta.persistence.*;

import java.time.LocalDateTime;


@Entity
public class Annonce {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int idUser;
    private String title;
    private String content;
    private String timestamp;
    private String imageFile;
    private int Likes;
    private int commentaire;

    // Constructeurs, getters et setters

    public Annonce() {
        // Constructeur par défaut
    }

    public Annonce(String title, String content) {
        this.title = title;
        this.content = content;
    }

    // Getters et Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTimestamp() {
        return timestamp;
    }



    public String getImageFile() {
        return imageFile;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public void setLikes(int likes) {
        this.Likes = likes;
    }

    public int getLikes() {
        return Likes;
    }

    public void setCommentaire(int commentaire) {
        this.commentaire = commentaire;
    }

    public int getCommentaire() {
        return commentaire;
    }

    public void setImageFile(String fileName) {
        this.imageFile = fileName;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "Annonce [id=" + id + ", title=" + title + ", content=" + content + ", timestamp=" + timestamp
                + ", image=" + imageFile + "]";
    }

}