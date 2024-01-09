package com.example.demo.service.impl;

import com.example.demo.models.Admin;
import com.example.demo.models.Selectionne;
import com.example.demo.models.StudentBean;
import com.example.demo.repository.SelectionneRepository;
import com.example.demo.service.AdminService;
import com.example.demo.service.MicroServiceUser;
import com.example.demo.service.SelecionneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class SelectionneServiceImpl implements SelecionneService {

    private final SelectionneRepository selectionneRepository;
    private final MicroServiceUser microServiceUser;
    private final AdminService adminService;

    @Autowired
    public SelectionneServiceImpl(SelectionneRepository selectionneRepository,
                                  MicroServiceUser microServiceUser,
                                  AdminService adminService) {
        this.selectionneRepository = selectionneRepository;
        this.microServiceUser = microServiceUser;
        this.adminService = adminService;
    }

    @Override
    public void addSelectionne(Selectionne selectionne) {
        selectionneRepository.save(selectionne);
    }

    @Override
    public List<Selectionne> getSelectionnes() {
        return selectionneRepository.findAll();
    }

    @Override
    public ResponseEntity<String> deleteSelectionne(Long id) {
        try {
            Optional<Selectionne> selectionneOptional = selectionneRepository.findById(id);

            if (selectionneOptional.isPresent()) {
                selectionneRepository.deleteById(id);
                return new ResponseEntity<>("Sélection supprimée avec succès", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Sélection non trouvée avec l'ID : " + id, HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Une exception s'est produite lors de la suppression : " + e.getMessage(),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public StudentBean selectStudentByAdmin(Long adminId, int idUser) {
        try {
            // Utilisez le service Feign pour obtenir les informations sur l'étudiant
            StudentBean studentBean = microServiceUser.getStudentInfoById(idUser);

            // Vérifiez si l'objet StudentBean est valide
            if (studentBean != null) {
                // Créez un objet Selectionne en utilisant les informations de l'étudiant et de l'admin
                Admin selectingAdmin = adminService.getAdminById(adminId).getBody();

                // Générez le matricule en utilisant le nom, le prénom et la date de naissance de l'étudiant
                String matricule = generateMatricule(studentBean.getName(), studentBean.getSurname(), studentBean.getDateNaiss());

                Selectionne selectionne = new Selectionne();

                // Enregistrez la sélection dans la base de données (utilisez la logique appropriée)
                selectionneRepository.save(selectionne);

                // Retournez l'objet StudentBean
                return studentBean;
            } else {
                // Gérez le cas où l'objet StudentBean est nul (peut-être définir une exception personnalisée)
                throw new ClassNotFoundException("Étudiant non trouvé pour l'ID : " + idUser);
            }
        } catch (Exception e) {
            // Gérez l'exception de manière appropriée (peut-être définir une exception personnalisée)
            throw new RuntimeException("Une exception s'est produite : " + e.getMessage());
        }
    }

    // Méthode de génération du matricule mise à jour
    private String generateMatricule(String nom, String prenom, Date dateNaiss) {
        // Utilisez la logique appropriée pour générer le matricule
        // Par exemple, concaténez les premières lettres du nom et du prénom avec la date de naissance
        // Assurez-vous de gérer les cas où le nom ou le prénom est vide
        String deuxPremieresLettresNom = nom.substring(0, Math.min(nom.length(), 2)).toUpperCase();
        String premiereLettrePrenom = prenom.substring(0, 1).toUpperCase();
        String anneeNaissance = new SimpleDateFormat("yy").format(dateNaiss);

        return anneeNaissance + deuxPremieresLettresNom + premiereLettrePrenom;
    }
}



