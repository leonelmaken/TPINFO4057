package com.example.demo.controllers;

import com.example.demo.models.Message;
import com.example.demo.service.MessageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/messages")
public class MessageController {

    private final MessageService messageService;

    @Autowired
    public MessageController(MessageService messageService) {
        this.messageService = messageService;
    }

    @PostMapping(path = "/create")
    public Message sendMessage(@RequestBody Message message) {
        return messageService.saveMessage(message);
    }

    @GetMapping("/sender/{senderId}")
    public List<Message> getMessagesBySenderId(@PathVariable Long senderId) {
        return messageService.getMessagesBySenderId(senderId);
    }

    @GetMapping("/receiver/{receiverId}")
    public List<Message> getMessagesByReceiverId(@PathVariable Long receiverId) {
        return messageService.getMessagesByReceiverId(receiverId);
    }    
}
