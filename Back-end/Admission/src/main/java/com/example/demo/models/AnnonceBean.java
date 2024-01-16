package com.example.demo.models;

import java.time.LocalDateTime;

import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

public class AnnonceBean {

	private Long id;

    private String title;
    private String content;
    private LocalDateTime timestamp;
    private String imageFile;
    private Long IdTeacher;


    // Constructeurs, getters et setters

    public AnnonceBean() {
        // Constructeur par défaut
    }

    

    public AnnonceBean(String title, String content, Long idTeacher) {
		super();
		this.title = title;
		this.content = content;
		IdTeacher = idTeacher;
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

	public Long getIdTeacher() {
		return IdTeacher;
	}



	public void setIdTeacher(Long idTeacher) {
		IdTeacher = idTeacher;
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
		return "AnnonceBean [id=" + id + ", title=" + title + ", content=" + content + ", timestamp=" + timestamp
				+ ", imageFile=" + imageFile + ", IdTeacher=" + IdTeacher + "]";
	}

}
