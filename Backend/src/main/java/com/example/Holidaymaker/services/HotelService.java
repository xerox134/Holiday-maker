package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Hotels;
import com.example.Holidaymaker.repositories.HotelRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotelService {
    @Autowired
    private HotelRepo hotelRepo;

    public List<Hotels> getAll(){
        return hotelRepo.findAll(); //Select * From Service

    }
}
