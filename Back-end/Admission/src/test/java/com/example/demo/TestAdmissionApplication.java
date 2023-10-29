package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.TestConfiguration;

@TestConfiguration(proxyBeanMethods = false)
public class TestAdmissionApplication {

	public static void main(String[] args) {
		SpringApplication.from(AdmissionApplication::main).with(TestAdmissionApplication.class).run(args);
	}

}
