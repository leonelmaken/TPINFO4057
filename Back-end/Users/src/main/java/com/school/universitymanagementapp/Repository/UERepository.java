package com.school.universitymanagementapp.Repository;

import com.school.universitymanagementapp.Model.UE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UERepository extends JpaRepository<UE,Integer> {
}
