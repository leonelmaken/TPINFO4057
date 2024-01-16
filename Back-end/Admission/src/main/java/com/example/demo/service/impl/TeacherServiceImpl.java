package com.example.demo.service.impl;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.models.Admin;
import com.example.demo.models.AnnonceBean;
import com.example.demo.models.Teacher;
import com.example.demo.models.TeacherEvent;
import com.example.demo.models.TeacherNotFoundException;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.TeacherRepository;
import com.example.demo.service.MicroserviceCommunication;
import com.example.demo.service.TeacherService;

import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

@Service
public class TeacherServiceImpl implements TeacherService {

	private final TeacherRepository teacherRepository;
    private final ApplicationEventPublisher eventPublisher;
    private final AdminRepository adminRepository;
    private final MicroserviceCommunication microserviceCommunication;

    @Autowired
    public TeacherServiceImpl(TeacherRepository teacherRepository, ApplicationEventPublisher eventPublisher,
                              AdminRepository adminRepository, MicroserviceCommunication microserviceCommunication) {
        this.teacherRepository = teacherRepository;
        this.eventPublisher = eventPublisher;
        this.adminRepository = adminRepository;
        this.microserviceCommunication = microserviceCommunication;
    }

    @Override
    public ResponseEntity<String> createTeacher(Long adminId,Teacher teacher) {
    	try {
            // Vérifier si l'e-mail de l'enseignant existe déjà
            Optional<Teacher> existingTeacher = teacherRepository.findByEmail(teacher.getEmail());

            if (existingTeacher.isPresent()) {
                return new ResponseEntity<>("L'adresse e-mail est déjà utilisée par un autre enseignant.", HttpStatus.BAD_REQUEST);
            }
    	        //fier si l'e-mail de l'enseignant existe déjà
          

            // Récupérer l'admin à partir de l'ID
         // Récupérer l'admin à partir de l'ID
            Optional<Admin> adminOptional = adminRepository.findById(adminId);

            if (adminOptional.isEmpty()) {
                return new ResponseEntity<>("L'administrateur avec l'ID spécifié n'existe pas.", HttpStatus.BAD_REQUEST);
            }

            Admin admin = adminOptional.get();

            if (!adminRepository.existsById(adminId)) {
                // Si non, sauvegarder l'admin pour le rattacher au contexte de persistance
                admin = adminRepository.save(admin);
            }
            // Associer l'admin à l'enseignant
            teacher.setIdAdmin(admin);

            // Assurez-vous que l'admin est dans le contexte de persistance
            
            // Vérifier si le matricule est présent
            if (teacher.getMatricule() == null || teacher.getMatricule().isEmpty()) {
                return new ResponseEntity<>("Le matricule de l'enseignant est obligatoire.", HttpStatus.BAD_REQUEST);
            }
            if (teacher.getName() == null)
                return new ResponseEntity<>("Vous devez entrer Votre nom", HttpStatus.INTERNAL_SERVER_ERROR);

            if (teacher.getEmail() == null)
                return new ResponseEntity<>("Vous devez entrer Votre mail", HttpStatus.INTERNAL_SERVER_ERROR);

            if (teacher.getPassword() == null)
                return new ResponseEntity<>("Vous devez entrer un mot de passe", HttpStatus.INTERNAL_SERVER_ERROR);
            if (teacher.getNationalite() == null)
                return new ResponseEntity<>("Vous devez spécifier votre nationalité", HttpStatus.INTERNAL_SERVER_ERROR);

            if (teacher.getNumerotel() == null)
                return new ResponseEntity<>("Vous devez entrer votre numéro de téléphone", HttpStatus.INTERNAL_SERVER_ERROR);

            if (teacher.getStatut() == null)
                return new ResponseEntity<>("Le statut est obligatoire", HttpStatus.INTERNAL_SERVER_ERROR);

            // Les champs dateCreation et dateDerniereConnexion seront automatiquement définis
            // grâce aux annotations @PrePersist
            teacherRepository.save(teacher);

            // Publication de l'événement après la création de l'enseignant
            try {
                // Publication de l'événement après la création de l'enseignant
                TeacherEvent event = new TeacherEvent(this, teacher);
                eventPublisher.publishEvent(event);
                System.out.println("Event published: " + event.getTeacher().toString());
            } catch (Exception e) {
                // Loguez l'exception
                e.printStackTrace();
            }
            
            return new ResponseEntity<>("Vous avez été enregistré avec succès " + teacher.toString(), HttpStatus.OK);

        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite: " + e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<Teacher> getTeacherById(Long id) {
        Optional<Teacher> adminOptional = teacherRepository.findById(id);
        if (adminOptional.isPresent()) {
            return new ResponseEntity<>(adminOptional.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @Override
    public ResponseEntity<List<Teacher>> getAllTeacher() {
        try {
            List<Teacher> teachers = teacherRepository.findAll();
            if (teachers.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(teachers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<String> updateTeacher(Teacher teacher, Long id) {
        try {
            Optional<Teacher> teacherOptional = teacherRepository.findById(id);

            if (teacherOptional.isEmpty()) {
                return new ResponseEntity<>("Enseignant non trouvé", HttpStatus.NOT_FOUND);
            }

            Teacher foundTeacher = teacherOptional.get();

            // Mettre à jour les champs selon ce qui est fourni
            if (teacher.getName() != null && !foundTeacher.getName().equals(teacher.getName()))
                foundTeacher.setName(teacher.getName());

            if (teacher.getSurname() != null && !foundTeacher.getSurname().equals(teacher.getSurname()))
                foundTeacher.setSurname(teacher.getSurname());

            if (teacher.getEmail() != null && !foundTeacher.getEmail().equals(teacher.getEmail()))
                foundTeacher.setEmail(teacher.getEmail());

            if (teacher.getPassword() != null && !foundTeacher.getPassword().equals(teacher.getPassword()))
                foundTeacher.setPassword(teacher.getPassword());

            if (teacher.getPhotouser() != null && !foundTeacher.getPhotouser().equals(teacher.getPhotouser()))
                foundTeacher.setPhotouser(teacher.getPhotouser());

            if (teacher.getNumerotel() != null && !foundTeacher.getNumerotel().equals(teacher.getNumerotel()))
                foundTeacher.setNumerotel(teacher.getNumerotel());
            if (teacher.getMatricule() != null && !foundTeacher.getMatricule().equals(teacher.getMatricule()))
                foundTeacher.setMatricule(teacher.getMatricule());

            if (teacher.getStatut() != null && !foundTeacher.getStatut().equals(teacher.getStatut()))
                foundTeacher.setStatut(teacher.getStatut());

            // Mettre à jour la date de dernière connexion automatiquement

            teacherRepository.save(foundTeacher);

            return new ResponseEntity<>("Modification réussie", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite : " + e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<String> deleteTeacher(Long id) {
        try {
            if (!teacherRepository.existsById(id)) {
                return new ResponseEntity<>("Enseignant non trouvé", HttpStatus.NOT_FOUND);
            }

            teacherRepository.deleteById(id);
            return new ResponseEntity<>("Enseignant supprimé avec succès", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la suppression : " + e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<String> findByMatricule(String matricule) {
        try {
            Optional<Teacher> teacherOptional = teacherRepository.findByNameCaseSensitivematriculeprof(matricule);

            if (teacherOptional.isPresent()) {
                Teacher teacher = teacherOptional.get();
                return new ResponseEntity<>(teacher.toString(), HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Enseignant non trouvé avec le matricule : " + matricule,
                        HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la recherche : " + e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public ResponseEntity<String> findByName(String name) {
        try {
            Optional<Teacher> teacherOptional = teacherRepository.findByNameCaseSensitive(name);

            if (teacherOptional.isPresent()) {
                Teacher teacher = teacherOptional.get();
                return new ResponseEntity<>(teacher.toString(), HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Enseignant non trouvé avec le nom: " + name, HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la recherche : " + e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public AnnonceBean createAnnonceForTeacherWithFeign(Long teacherId, AnnonceBean annonce, MultipartFile imageFile) {
        // Vérifier si l'ID du teacher existe dans la table Teacher
        getTeacherById(teacherId);

        // Appeler le microservice pour créer une annonce
        return microserviceCommunication.createAnnonce(annonce, imageFile);
    }

    private Teacher getTeacherById1(Long teacherId) {
        // Rechercher le teacher par ID dans la table Teacher
        Optional<Teacher> teacherOptional = teacherRepository.findById(teacherId);

        if (teacherOptional.isPresent()) {
            // Si le teacher existe, retournez-le
            return teacherOptional.get();
        } else {
            // Si le teacher n'existe pas, lancez une exception
            throw new RuntimeException("Teacher with ID " + teacherId + " not found");
        }
    }

}

