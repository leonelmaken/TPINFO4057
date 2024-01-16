package com.example.demo.service;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import com.example.demo.models.MessageBean;

import java.util.List;

@FeignClient(name = "microservice-communication", url = "http://localhost:8085")
public interface CommunicationFeignClient {

    @PostMapping("/api/messages/create")
    MessageBean sendMessage(@RequestBody MessageBean message);

    @GetMapping("/api/messages/sender/{senderId}")
    List<MessageBean> getMessagesBySenderId(@PathVariable Long senderId);

    @GetMapping("/api/messages/receiver/{receiverId}")
    List<MessageBean> getMessagesByReceiverId(@PathVariable Long receiverId);
    
}
