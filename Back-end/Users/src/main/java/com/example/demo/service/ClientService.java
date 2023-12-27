package com.example.demo.service;

import com.example.demo.models.Client;
import com.example.demo.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientService {

    private final ClientRepository clientRepo;

    @Autowired
    public ClientService(ClientRepository clientRepo) {
        this.clientRepo = clientRepo;
    }

    public Client addClient(String idclient, String nom, String age){
        Client client = new Client();
        client.setIdclient(idclient);
        client.setNom(nom);
        client.setAge(age);
        return clientRepo.save(client);
    }

    public List<Client> getAllClients() {
        return clientRepo.findAll();
    }
}
