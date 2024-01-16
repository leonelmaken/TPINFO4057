package com.example.demo.service;


import com.example.demo.models.Message;

import java.util.List;

public interface MessageService {
    List<Message> getAllMessages();

    Message getMessageById(Long messageId);

    List<Message> getMessagesBySenderId(Long senderId);

    List<Message> getMessagesByReceiverId(Long receiverId);

    Message saveMessage( Long senderId,
                         Long receiverId,
                         String content,
                         String timestamp,
                         String senderName,
                         String receiverName
    );

    void deleteMessage(Long messageId);
}
