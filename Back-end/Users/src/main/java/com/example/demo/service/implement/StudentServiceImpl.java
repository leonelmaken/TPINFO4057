package com.example.demo.service.implement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.demo.models.Niveau;
import com.example.demo.models.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.StudentService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Optional;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentrepo;

    @Override
    public Student preinscription(
            String name,
            String surname,
            Date dateNaiss,
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
            Niveau niveau,
            //photo scannee à uploader
            MultipartFile dernierdiplom,

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
        String folder1 = null;
		try {
			folder1 = new ClassPathResource("static/photouser/").getFile().getAbsolutePath();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        final String route1 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/photouser/").path(photouser.getOriginalFilename()).toUriString();
        byte[] bytes1 = null;
		try {
			bytes1 = photouser.getBytes();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Path path1 = Paths.get(folder1 + File.separator + photouser.getOriginalFilename());
        try {
			Files.write(path1, bytes1);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        System.out.println(route1);

        String folder2 = null;
		try {
			folder2 = new ClassPathResource("static/photocni/").getFile().getAbsolutePath();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        final String route2 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/photocni/").path(photocni.getOriginalFilename()).toUriString();
        byte[] bytes2 = null;
		try {
			bytes2 = photocni.getBytes();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Path path2 = Paths.get(folder2 + File.separator + photocni.getOriginalFilename());
        try {
			Files.write(path2, bytes2);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        System.out.println(route2);

        String folder3 = null;
		try {
			folder3 = new ClassPathResource("static/actenaiss/").getFile().getAbsolutePath();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        final String route3 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/actenaiss/").path(actenaiss.getOriginalFilename()).toUriString();
        byte[] bytes3 = null;
		try {
			bytes3 = actenaiss.getBytes();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Path path3 = Paths.get(folder3 + File.separator + actenaiss.getOriginalFilename());
        try {
			Files.write(path3, bytes3);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println(route3);

        String folder4 = null;
		try {
			folder4 = new ClassPathResource("static/recu/").getFile().getAbsolutePath();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        final String route4 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/recu/").path(recu.getOriginalFilename()).toUriString();
        byte[] bytes4 = null;
		try {
			bytes4 = recu.getBytes();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Path path4 = Paths.get(folder4 + File.separator + recu.getOriginalFilename());
        try {
			Files.write(path4, bytes4);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println(route4);

        String folder5 = null;
		try {
			folder5 = new ClassPathResource("static/relevebac/").getFile().getAbsolutePath();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        final String route5 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/relevebac/").path(relevebac.getOriginalFilename()).toUriString();
        byte[] bytes5 = null;
		try {
			bytes5 = relevebac.getBytes();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Path path5 = Paths.get(folder5 + File.separator + relevebac.getOriginalFilename());
        try {
			Files.write(path5, bytes5);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println(route5);

        String folder6 = null;
		try {
			folder6 = new ClassPathResource("static/releveproba/").getFile().getAbsolutePath();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        final String route6 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/releveproba/").path(releveproba.getOriginalFilename()).toUriString();
        byte[] bytes6 = null;
		try {
			bytes6 = releveproba.getBytes();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Path path6 = Paths.get(folder6 + File.separator + releveproba.getOriginalFilename());
        try {
			Files.write(path6, bytes6);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println(route6);

        String folder7 = null;
		try {
			folder7 = new ClassPathResource("static/dernierdiplom/").getFile().getAbsolutePath();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        final String route7 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/dernierdiplom/").path(dernierdiplom.getOriginalFilename()).toUriString();
        byte[] bytes7 = null;
		try {
			bytes7 = dernierdiplom.getBytes();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Path path7 = Paths.get(folder7 + File.separator + dernierdiplom.getOriginalFilename());
        try {
			Files.write(path7, bytes7);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println(route7);

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

        etudiant.setInfojury(infojury);
        etudiant.setMatriculediplo(matriculediplo);
        etudiant.setMoyenne(moyenne);
        etudiant.setSpecialite(specialite);
        etudiant.setNiveau(niveau);
        etudiant.setDernierdiplom("/dernierdiplom/" + dernierdiplom.getOriginalFilename());
        etudiant.setRelevebac("/relevebac/" + relevebac.getOriginalFilename());
        etudiant.setReleveproba("/relevaproba/" + releveproba.getOriginalFilename());
        etudiant.setRecu("/recu/" + recu.getOriginalFilename());
        etudiant.setPhotocni("/photocni/" + photocni.getOriginalFilename());
        etudiant.setActenaiss("/actenaiss/" + actenaiss.getOriginalFilename());
        etudiant.setPhotouser("/photouser/" + photouser.getOriginalFilename());
        etudiant.setNompere(nompere);
        etudiant.setProfesspere(professpere);
        etudiant.setNommere(nommere);
        etudiant.setProfessmere(professmere);
        etudiant.setNomurgent(nomurgent);
        etudiant.setNumerourgent(numerourgent);
        etudiant.setVilleurgent(villeurgent);
        etudiant.setEtat(1);
        etudiant.setNomtuteur(nomtuteur);
        etudiant.setProfesspere(professtuteur);
        etudiant.setNumerotransaction(numerotransaction);
        etudiant.setCodepreins(codepreins);
        etudiant.setSport(sport);
        etudiant.setArt(art);
        etudiant.setType("student");
        studentrepo.save(etudiant);
        return etudiant;
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
        studentrepo.deleteById(studentId);
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