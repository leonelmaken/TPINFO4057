package com.example.demo.controller;

import com.example.demo.models.Client;
import com.example.demo.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ClientController {
    @Autowired
    private ClientService clientService;

    @RequestMapping(method = RequestMethod.POST, value = "/registerclient")
    public Client addClient(@RequestParam String idclient, @RequestParam String nom, @RequestParam String age) {
        return clientService.addClient(idclient, nom, age);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/displayclient")
    public List<Client> getAllClients() {
        return clientService.getAllClients();
    }
}
