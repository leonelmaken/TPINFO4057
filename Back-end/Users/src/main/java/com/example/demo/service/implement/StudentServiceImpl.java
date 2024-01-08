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
import java.util.List;
import java.util.Optional;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentrepo;

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


    ) throws IOException {
        Student etudiant = new Student();
        etudiant.setName(name);
        etudiant.setSurname(surname);
        etudiant.setDateNaiss(dateNaiss);
        etudiant.setLieuNaiss(lieuNaiss);

        etudiant.setNumerocni(numerocni);
        final String folder1 = new ClassPathResource("static/photouser/").getFile().getAbsolutePath();
        final String route1 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/photouser/").path(photouser.getOriginalFilename()).toUriString();
        byte[] bytes1 = photouser.getBytes();
        Path path1 = Paths.get(folder1 + File.separator + photouser.getOriginalFilename());
        Files.write(path1, bytes1);
        System.out.println(route1);

        final String folder2 = new ClassPathResource("static/photocni/").getFile().getAbsolutePath();
        final String route2 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/photocni/").path(photocni.getOriginalFilename()).toUriString();
        byte[] bytes2 = photocni.getBytes();
        Path path2 = Paths.get(folder2 + File.separator + photocni.getOriginalFilename());
        Files.write(path2, bytes2);
        System.out.println(route2);

        final String folder3 = new ClassPathResource("static/actenaiss/").getFile().getAbsolutePath();
        final String route3 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/actenaiss/").path(actenaiss.getOriginalFilename()).toUriString();
        byte[] bytes3 = actenaiss.getBytes();
        Path path3 = Paths.get(folder3 + File.separator + actenaiss.getOriginalFilename());
        Files.write(path3, bytes3);
        System.out.println(route3);

        final String folder4 = new ClassPathResource("static/recu/").getFile().getAbsolutePath();
        final String route4 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/recu/").path(recu.getOriginalFilename()).toUriString();
        byte[] bytes4 = recu.getBytes();
        Path path4 = Paths.get(folder4 + File.separator + recu.getOriginalFilename());
        Files.write(path4, bytes4);
        System.out.println(route4);

        final String folder5 = new ClassPathResource("static/relevebac/").getFile().getAbsolutePath();
        final String route5 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/relevebac/").path(relevebac.getOriginalFilename()).toUriString();
        byte[] bytes5 = relevebac.getBytes();
        Path path5 = Paths.get(folder5 + File.separator + relevebac.getOriginalFilename());
        Files.write(path5, bytes5);
        System.out.println(route5);

        final String folder6 = new ClassPathResource("static/releveproba/").getFile().getAbsolutePath();
        final String route6 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/releveproba/").path(releveproba.getOriginalFilename()).toUriString();
        byte[] bytes6 = releveproba.getBytes();
        Path path6 = Paths.get(folder6 + File.separator + releveproba.getOriginalFilename());
        Files.write(path6, bytes6);
        System.out.println(route6);

        final String folder7 = new ClassPathResource("static/dernierdiplom/").getFile().getAbsolutePath();
        final String route7 = ServletUriComponentsBuilder.fromCurrentContextPath().path("/dernierdiplom/").path(dernierdiplom.getOriginalFilename()).toUriString();
        byte[] bytes7 = dernierdiplom.getBytes();
        Path path7 = Paths.get(folder7 + File.separator + dernierdiplom.getOriginalFilename());
        Files.write(path7, bytes7);
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
        studentrepo.deleteStudentByUserId(studentId);
        return ResponseEntity.ok("Student deleted successfully!");
    }

    //afficher la liste de tous les students
    @Override
    public ResponseEntity<Object> getAllStudents() {
         List<Student> students = studentrepo.findAll();
        return ResponseEntity.ok(students);
    }

    //rechercher les etudiants par id
    public Student getStudentById(int id) {
        Optional<Student> student = studentrepo.findById(id);
        if (student.isPresent()) {
            return student.get();
        } else {
            throw new RuntimeException("Student not found for id : " + id);
        }
    }
}