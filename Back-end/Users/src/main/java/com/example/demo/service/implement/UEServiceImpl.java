package com.example.demo.service.implement;

import com.example.demo.models.UE;
import com.example.demo.repository.UERepository;
import com.example.demo.service.UEService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UEServiceImpl implements UEService {

    @Autowired
    private UERepository ueRepository;

    @Override
    public List<UE> getAllUEs() {
        return ueRepository.findAll();
    }

    @Override
    public UE getUEById(int id) {
        return ueRepository.findById(id).orElse(null);
    }

    @Override
    public UE createUE(UE ue) {
        return ueRepository.save(ue);
    }

    @Override
    public UE updateUE(int id, UE ue) {
        if (ueRepository.existsById(id)) {
            ue.setIdue(id);
            return ueRepository.save(ue);
        }
        return null;
    }

    @Override
    public void deleteUE(int id) {
        ueRepository.deleteById(id);
    }
}
