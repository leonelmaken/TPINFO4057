package com.school.universitymanagementapp.Repository;

import com.school.universitymanagementapp.Model.Specialite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpecialiteRepository extends JpaRepository<Specialite,Integer> {
}
