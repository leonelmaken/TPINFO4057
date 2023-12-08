package com.example.demo.models;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

@Component
@EnableBinding(YourEventProducerClass.YourEventSource.class)
public class YourEventProducerClass {

    private final YourEventSource eventSource;

    @Autowired
    public YourEventProducerClass(YourEventSource eventSource) {
        this.eventSource = eventSource;
    }

    public void publishEvent(TeacherEvent event) {
        eventSource.output().send(MessageBuilder.withPayload(event).build());
    }

    public interface YourEventSource {
        String OUTPUT = "yourEventOutput";

        @Output(OUTPUT)
        MessageChannel output();
    }

    // Configuration pour enregistrer l'interface en tant que bean
    @Configuration
    public static class YourEventSourceConfiguration {
        @Bean
        public YourEventSource yourEventSource() {
            return new YourEventSource() {
                @Override
                public MessageChannel output() {
                    // Logique de création du canal de sortie
                    // Peut être personnalisé selon les besoins
                    return null;
                }
            };
        }
    }
}
