package com.example.demo.service.implement;

import com.example.demo.models.Annonce;
import com.example.demo.repository.AnnonceRepository;
import com.example.demo.service.AnnonceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Service
public class AnnonceServiceImpl implements AnnonceService {

    private final AnnonceRepository annonceRepository;

    @Autowired
    public AnnonceServiceImpl(AnnonceRepository annonceRepository) {
        this.annonceRepository = annonceRepository;
    }

    @Override
    public Annonce createAnnonce(Annonce annonce, MultipartFile imageFile) {
        // Traitement de l'image uniquement si elle est fournie et est du bon type
        if (imageFile != null && !imageFile.isEmpty() && isImageTypeValid(imageFile)) {
            // Ajoutez votre logique de traitement de l'image ici
            String fileName = "annonce_" + annonce.getId() + "_" + imageFile.getOriginalFilename();
            saveImageToFileSystem(imageFile, fileName);
            annonce.setImageFile(fileName);
        }

        return annonceRepository.save(annonce);
    }

    private boolean isImageTypeValid(MultipartFile imageFile) {
        // Vérifiez si le type du fichier est une image valide (ajoutez d'autres types au besoin)
        List<String> validImageTypes = List.of("image/jpeg", "image/jpg", "image/gif", "image/png");
        return validImageTypes.contains(imageFile.getContentType());
    }

    private void saveImageToFileSystem(MultipartFile imageFile, String fileName) {
        try {
            // Spécifiez le chemin où vous souhaitez sauvegarder l'image
            String folderPath = "static/annonces/";
            // Sauvegardez l'image sur le serveur
            byte[] bytes = imageFile.getBytes();
            Path path = Paths.get(folderPath + File.separator + fileName);
            Files.write(path, bytes);
        } catch (IOException e) {
            e.printStackTrace();
            // Gérez l'exception selon vos besoins
        }
    }

    @Override
    public List<Annonce> getAllAnnonces() {
        return annonceRepository.findAll();
    }

    @Override
    public Annonce getAnnonceById(Long id) {
        return annonceRepository.findById(id).orElse(null);
    }
}