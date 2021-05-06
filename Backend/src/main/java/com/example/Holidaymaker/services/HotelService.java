package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Hotel;
import com.example.Holidaymaker.entities.Review;
import com.example.Holidaymaker.entities.Room;
import com.example.Holidaymaker.repositories.HotelRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotelService {
    @Autowired
    private HotelRepo hotelRepo;

    public List<Hotel> getAll(){
        return hotelRepo.findAll(); //Select * From Service

    }


    public List<Hotel> getHotelsById(long hotelId) {
        return hotelRepo.findById(hotelId);
    }
}
