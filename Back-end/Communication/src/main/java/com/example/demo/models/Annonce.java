package com.example.demo.models;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;
@Entity
public class Annonce {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String content;
    private LocalDateTime timestamp;
    private String imageFile;


    // Constructeurs, getters et setters

    public Annonce() {
        // Constructeur par défaut
    }

    public Annonce(String title, String content) {
        this.title = title;
        this.content = content;
    }

    // Getters et Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public LocalDateTime getTimestamp() {
        return timestamp;
    }
    


	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String fileName) {
		this.imageFile = fileName;
	}

	public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }
    @PrePersist
    @PreUpdate
    public void prePersist() {
        timestamp = LocalDateTime.now();
    }

	@Override
	public String toString() {
		return "Annonce [id=" + id + ", title=" + title + ", content=" + content + ", timestamp=" + timestamp
				+ ", image=" + imageFile + "]";
	}
    
}
