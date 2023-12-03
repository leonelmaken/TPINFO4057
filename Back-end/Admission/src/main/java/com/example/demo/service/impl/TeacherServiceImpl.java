package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.example.demo.models.Teacher;
import com.example.demo.repository.TeacherRepository;
import com.example.demo.service.TeacherService;

public class TeacherServiceImpl implements TeacherService{

	
	private final TeacherRepository teacherRepository;
	
	 @Autowired
	    public TeacherServiceImpl(TeacherRepository teacherRepository) {
	        this.teacherRepository = teacherRepository;
	    }
	
	@Override
	public ResponseEntity<String> createTeacher(Teacher teacher) {
		 try {
	            // Vérification des champs obligatoires
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

	            // Les champs dateCreation et dateDerniereConnexion seront automatiquement définis grâce aux annotations @PrePersist
	            teacherRepository.save(teacher);

	            return new ResponseEntity<>("Vous avez été enregistré avec succès " + teacher.toString(), HttpStatus.OK);

	        } catch(Exception e) {
	            return new ResponseEntity<>("Une exception s'est produite: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	}

	@Override
	public ResponseEntity<String> findByName(String name) {
		try {
            Optional<Teacher> adminOptional = teacherRepository.findByNameCaseSensitive(name);
            
            if (adminOptional.isPresent()) {
                Teacher teacher = adminOptional.get();
                return new ResponseEntity<>(teacher.toString(), HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Enseignant non trouvé avec le nom: " + name, HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la recherche : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}

	@Override
	public ResponseEntity<Teacher> getTeacherById(Long id) {
		Optional<Teacher> adminOptional = teacherRepository.findById(id);
        if(adminOptional.isPresent()){
            return new ResponseEntity<>(adminOptional.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
	}

	@Override
	public ResponseEntity<List<Teacher>> getAllTeacher() {
		try {
            List<Teacher> admins = teacherRepository.findAll();
            if (admins.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(admins, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}

	@Override
	public ResponseEntity<String> updateTeacher(Teacher teacher, Long id) {
		try {
            Optional<Teacher> adminOptional = teacherRepository.findById(id);
            
            if (adminOptional.isEmpty()) {
                return new ResponseEntity<>("Enseignant non trouvé", HttpStatus.NOT_FOUND);
            }
            
            Teacher foundAdmin = adminOptional.get();
            
            // Mettre à jour les champs selon ce qui est fourni
            if (teacher.getName() != null && !foundAdmin.getName().equals(teacher.getName())) 
                foundAdmin.setName(teacher.getName());
            
            if (teacher.getSurname() != null && !foundAdmin.getSurname().equals(teacher.getSurname()))
                foundAdmin.setSurname(teacher.getSurname());

            if (teacher.getEmail() != null && !foundAdmin.getEmail().equals(teacher.getEmail())) 
                foundAdmin.setEmail(teacher.getEmail());

            if (teacher.getPassword() != null && !foundAdmin.getPassword().equals(teacher.getPassword())) 
                foundAdmin.setPassword(teacher.getPassword());

            if (teacher.getPhotouser() != null && !foundAdmin.getPhotouser().equals(teacher.getPhotouser())) 
                foundAdmin.setPhotouser(teacher.getPhotouser());

            if (teacher.getNumerotel() != null && !foundAdmin.getNumerotel().equals(teacher.getNumerotel())) 
                foundAdmin.setNumerotel(teacher.getNumerotel());
            if (teacher.getMatricule() != null && !foundAdmin.getMatricule().equals(teacher.getMatricule())) 
                foundAdmin.setMatricule(teacher.getMatricule());

            if (teacher.getStatut() != null && !foundAdmin.getStatut().equals(teacher.getStatut())) 
                foundAdmin.setStatut(teacher.getStatut());

            // Mettre à jour la date de dernière connexion automatiquement
            
            teacherRepository.save(foundAdmin);
            
            return new ResponseEntity<>("Modification réussie", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
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
            return new ResponseEntity<>("Une exception s'est produite lors de la suppression : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}

	@Override
	public ResponseEntity<String> findByMatricule(String matricule) {
		try {
            Optional<Teacher> adminOptional = teacherRepository.findByNameCaseSensitivematriculeprof(matricule);
            
            if (adminOptional.isPresent()) {
                Teacher teacher = adminOptional.get();
                return new ResponseEntity<>(teacher.toString(), HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Enseignant non trouvé avec le matricule : " + matricule, HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la recherche : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}

}
