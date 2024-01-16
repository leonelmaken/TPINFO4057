package com.example.demo.service.implement;


import com.example.demo.models.Message;
import com.example.demo.models.StudentBean;
import com.example.demo.repository.MessageRepository;
import com.example.demo.service.FeignInterface;
import com.example.demo.service.MessageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MessageServiceImpl implements MessageService {

    private final MessageRepository messageRepository;

    @Autowired
    public MessageServiceImpl(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @Override
    public List<Message> getAllMessages() {
        return messageRepository.findAll();
    }

    @Override
    public Message getMessageById(Long messageId) {
        Optional<Message> optionalMessage = messageRepository.findById(messageId);
        return optionalMessage.orElse(null);
    }

    @Override
    public List<Message> getMessagesBySenderId(Long senderId) {
        return messageRepository.findBySenderId(senderId);
    }

    @Override
    public List<Message> getMessagesByReceiverId(Long receiverId) {
        return messageRepository.findByReceiverId(receiverId);
    }

    @Override
    public Message saveMessage(Message message) {
        return messageRepository.save(message);
    }

    @Override
    public void deleteMessage(Long messageId) {
        messageRepository.deleteById(messageId);
            }
    
}
