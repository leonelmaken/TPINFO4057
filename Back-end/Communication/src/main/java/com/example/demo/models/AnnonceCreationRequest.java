package com.example.demo.models;

import org.springframework.web.multipart.MultipartFile;

public class AnnonceCreationRequest {
	 private Annonce annonce;
	 private MultipartFile imageFile;
	public Annonce getAnnonce() {
		return annonce;
	}
	public void setAnnonce(Annonce annonce) {
		this.annonce = annonce;
	}
	public MultipartFile getImageFile() {
		return imageFile;
	}
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	public AnnonceCreationRequest(Annonce annonce) {
		super();
		this.annonce = annonce;
	}
	public AnnonceCreationRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "AnnonceCreationRequest [annonce=" + annonce + ", imageFile=" + imageFile + "]";
	}

}
