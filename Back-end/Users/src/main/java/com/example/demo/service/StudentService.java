package com.example.demo.service;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.models.MessageBean;
import com.example.demo.models.Student;

import java.io.IOException;
import java.util.Date;
import java.util.List;
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
	            String specialite,
	            com.example.demo.models.Niveau niveau,
	            //photo scannee à uploader
	            String dernierdiplom,

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
	            

	    ) throws IOException;

    Optional<Student> findByEmail(String email);

    ResponseEntity<Object> findByNom(String nom);

    ResponseEntity<Object> deleteStudent(int studentId);

    MessageBean sendMessageToUser(MessageBean message);
    ResponseEntity<Object> getAllStudents();
    public List<MessageBean> getReceivedMessages(int receiverId);
}
