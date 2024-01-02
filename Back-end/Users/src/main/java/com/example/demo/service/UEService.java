package com.example.demo.service;

import com.example.demo.models.UE;

import java.util.List;

public interface UEService {
    List<UE> getAllUEs();

    UE getUEById(int id);

    UE createUE(UE ue);

    UE updateUE(int id, UE ue);

    void deleteUE(int id);
}
