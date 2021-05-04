package com.example.Holidaymaker.controller;

import com.example.Holidaymaker.entities.Hotels;
import com.example.Holidaymaker.services.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class HotelController {
    @Autowired
    private HotelService hotelService;

    @GetMapping("/rest/hotels")
    public List<Hotels> getAllHotels(){
        return hotelService.getAll();

    }
}
