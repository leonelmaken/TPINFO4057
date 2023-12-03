package com.example.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.example.demo.models.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, Long> {

	 @Query("SELECT t FROM Teacher t WHERE  t.name like %?1%")
	    Optional<Teacher> findByNameCaseSensitive(String name);
	 @Query("SELECT t FROM Teacher t WHERE  t.matricule like %?1%")
	    Optional<Teacher> findByNameCaseSensitivematriculeprof(String matricule);
}
