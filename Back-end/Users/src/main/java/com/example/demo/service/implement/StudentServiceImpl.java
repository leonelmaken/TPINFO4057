package com.example.demo.service.implement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import java.util.Date;
import java.util.Optional;

import com.example.demo.models.MessageBean;
import com.example.demo.models.Niveau;
import com.example.demo.models.Specialite;
import com.example.demo.models.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.CommunicationFeignClient;
import com.example.demo.service.StudentService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentrepo;
    
    @Autowired
    private CommunicationFeignClient communicationFeignClient;

    @Override
    public Student preinscription(
    		String name,
            String surname,
            Date dateNaiss,
            String lieuNaiss,
            String numerocni, String photouser,

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
            byte[] photocni,
            byte[] relevebac,
            byte[] releveproba,
            byte[] actenaiss,
            byte[] recu,

            String premierchoix,
            String deuxiemechoix,
            String troisiemechoix,
            Specialite specialite,
            Niveau niveau,
            String dernierdiplom,
            String anneeObtent, Double moyenne,
            String infojury,
            String matriculediplo,
            String delivrepar,
            Date Datedeliv,
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

    ) {
        Student etudiant = new Student();
        etudiant.setName(name);
        etudiant.setSurname(surname);
        etudiant.setDateNaiss(dateNaiss);
        etudiant.setLieuNaiss(lieuNaiss);

        etudiant.setNumerocni(numerocni);
        etudiant.setAdresse(adresse);
        etudiant.setEmail(email);
        etudiant.setStatusMarital(statusMarital);
        etudiant.setSexe(sexe);
        etudiant.setLangue(langue);
        etudiant.setStatusprofess(statusprofess);
        etudiant.setNumerotel(numerotel);
        etudiant.setRegion(region);
        etudiant.setNationalite(nationalite);
        etudiant.setDepartmt(departmt);
        etudiant.setPremierchoix(premierchoix);
        etudiant.setDeuxiemechoix(deuxiemechoix);
        etudiant.setTroisiemechoix(troisiemechoix);
        etudiant.setAnneeObtent(anneeObtent);
        etudiant.setDelivrepar(delivrepar);
        etudiant.setDatedeliv(Datedeliv);
        etudiant.setPhotocniFile(photocni);
		 etudiant.setRelevebacFile(relevebac);
		 etudiant.setReleveprobaFile(releveproba);
		 etudiant.setActenaissFile(actenaiss);
		 etudiant.setRecuFile(recu);
        etudiant.setInfojury(infojury);
        etudiant.setMatriculediplo(matriculediplo);
        etudiant.setMoyenne(moyenne);
        etudiant.setSpecialite(specialite);
        etudiant.setNiveau(niveau);
        etudiant.setPhotouser(photouser);
        etudiant.setNompere(nompere);
        etudiant.setProfesspere(professpere);
        etudiant.setNommere(nommere);
        etudiant.setProfessmere(professmere);
        etudiant.setNomurgent(nomurgent);
        etudiant.setNumerourgent(numerourgent);
        etudiant.setVilleurgent(villeurgent);
        etudiant.setEtat(1);
        etudiant.setProfesstuteur(professtuteur);
        etudiant.setNomtuteur(nomtuteur);
        etudiant.setProfesspere(professtuteur);
        etudiant.setNumerotransaction(numerotransaction);
        etudiant.setCodepreins(codepreins);
        etudiant.setSport(sport);
        etudiant.setArt(art);
        studentrepo.save(etudiant);
        String content = null;
		sendMessage(etudiant.getIdUser(),etudiant.getIdUser(),content);
        return etudiant;
    }

    @Override
    public void sendMessage(Long senderId, Long receiverId, String content) {
        // Utilisation du Feign Client pour envoyer le message
        MessageBean message = new MessageBean();
        message.setSenderId(senderId);
        message.setReceiverId(receiverId);
        message.setContent(content);

        communicationFeignClient.saveMessage(message);
    }

    // Autres méthodes du service...
    @Override
    public Optional<Student> findByEmail(String email) {
        return studentrepo.findByEmail(email);
    }

    @Override
    public ResponseEntity<Object> findByNom(String name) {
        // Logique pour rechercher par nom avec studentService.findByNom
        // ...
    	studentrepo.findByNom(name);
        return ResponseEntity.ok("Search by name logic goes here");
    }

    @Override
    public ResponseEntity<Object> deleteStudent(Long studentId) {
        // Logique pour supprimer un étudiant avec studentService.deleteStudent
        // ...
        studentrepo.deleteStudentByUserId(studentId);
        return ResponseEntity.ok("Student deleted successfully!");
    }

    @Override
    public ResponseEntity<Object> getAllStudents() {
        // Logique pour obtenir tous les étudiants avec studentService.getAllStudents
        // ...
        studentrepo.findAll();
        return ResponseEntity.ok("List of students goes here");
    }
}