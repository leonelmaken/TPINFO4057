package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.models.Admin;
import com.example.demo.models.Teacher;
import com.example.demo.models.TeacherEvent;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.TeacherRepository;
import com.example.demo.service.TeacherService;

import jakarta.transaction.Transactional;

@Service
public class TeacherServiceImpl implements TeacherService {

    private final TeacherRepository teacherRepository;
    private final ApplicationEventPublisher eventPublisher;
    private final AdminRepository adminRepository;

    @Autowired
    public TeacherServiceImpl(TeacherRepository teacherRepository, ApplicationEventPublisher eventPublisher,
            AdminRepository adminRepository) {
        this.teacherRepository = teacherRepository;
        this.eventPublisher = eventPublisher;
        this.adminRepository = adminRepository;
    }

    @Transactional
    @Override
    public ResponseEntity<String> createTeacher(Teacher teacher) {
        try {
        	 if (teacher.getCreatedByAdmin() != null) {
                 // Vérifiez si l'ID de l'admin est présent
                 if (teacher.getCreatedByAdmin().getAdminId() != null) {
                     // Chargez l'administrateur depuis la base de données
                     Optional<Admin> adminOptional = adminRepository.findById(teacher.getCreatedByAdmin().getAdminId());

                     // Vérifiez si l'administrateur existe
                     if (adminOptional.isPresent()) {
                         // Affectez l'administrateur à l'enseignant
                         teacher.setCreatedByAdmin(adminOptional.get());
                     } else {
                         return new ResponseEntity<>("L'administrateur avec l'ID spécifié n'existe pas.",
                                 HttpStatus.BAD_REQUEST);
                     }
                 } else {
                     // L'ID de l'administrateur est manquant
                     return new ResponseEntity<>("ID de l'administrateur manquant.",
                             HttpStatus.BAD_REQUEST);
                 }
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

}

