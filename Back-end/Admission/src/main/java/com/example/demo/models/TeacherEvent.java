package com.example.demo.models;

import org.springframework.context.ApplicationEvent;

public class TeacherEvent extends ApplicationEvent {

    private Teacher teacher;

    public TeacherEvent(Object source, Teacher teacher) {
        super(source);
        this.teacher = teacher;
    }

    public Teacher getTeacher() {
        return teacher;
    }
}
