package com.example.demo.service;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.demo.models.MessageBean;

@FeignClient(name = "microservice-communication",  url = "http://localhost:8085")
public interface CommunicationFeignClient {

    @GetMapping("/messages")
    List<MessageBean> getAllMessages();

    @GetMapping("/messages/{messageId}")
    MessageBean getMessageById(@PathVariable Long messageId);

    @GetMapping("/messages/sender/{senderId}")
    List<MessageBean> getMessagesBySenderId(@PathVariable Long senderId);

    @GetMapping("/messages/receiver/{receiverId}")
    List<MessageBean> getMessagesByReceiverId(@PathVariable Long receiverId);

    @PostMapping("/messages")
    MessageBean saveMessage(@RequestBody MessageBean message);

    @DeleteMapping("/messages/{messageId}")
    void deleteMessage(@PathVariable Long messageId);
}
