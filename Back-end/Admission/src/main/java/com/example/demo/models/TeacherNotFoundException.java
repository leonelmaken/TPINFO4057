package com.example.demo.models;

public class TeacherNotFoundException extends RuntimeException {

    public TeacherNotFoundException(String message) {
        super(message);
    }
}
