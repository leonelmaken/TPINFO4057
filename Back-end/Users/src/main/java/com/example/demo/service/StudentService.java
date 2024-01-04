package com.example.demo.service;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.models.Niveau;
import com.example.demo.models.Specialite;
import com.example.demo.models.Student;

import java.util.Date;
import java.util.Optional;

public interface StudentService{

	 public Student preinscription(
	            String name,
	            String surname,
	            String dateNaiss,
	            String lieuNaiss,
	            String numerocni, MultipartFile photouser,

	            String adresse,
	            String sexe,
	            String email,
	            String statusMarital,
	            String langue,
	            String statusprofess,
	            Double numerotel,
	            String nationalite,
	            String region,
	            String departmt,
	            //photo scannee à uploader
	            MultipartFile photocni,
	            MultipartFile relevebac,
	            MultipartFile releveproba,
	            MultipartFile actenaiss,
	            MultipartFile recu,
	            // >>
	            
	            String premierchoix,
	            String deuxiemechoix,
	            String troisiemechoix,
	            Specialite specialite,
	            Niveau niveau,
	            //photo scannee à uploader
	            MultipartFile dernierdiplom,

	            String anneeObtent, Double moyenne,
	            String infojury,
	            String matriculediplo,
	            String delivrepar,
	            String Datedeliv,
	            String nompere,
	            String professpere,
	            String nommere,
	            String professmere,
	            String nomurgent,
	            Double numerourgent,
	            String villeurgent,
	            String nomtuteur,
	            String professtuteur,
	            Double numerotransaction,
	            Double codepreins,
	            boolean sport,
	            boolean art
	            

	    );

    Optional<Student> findByEmail(String email);

    ResponseEntity<Object> findByNom(String nom);

    ResponseEntity<Object> deleteStudent(Long studentId);

    ResponseEntity<Object> getAllStudents();
    void sendMessage(Long senderId, Long receiverId, String content);
}

