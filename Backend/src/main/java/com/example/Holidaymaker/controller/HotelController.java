package com.example.Holidaymaker.controller;

import com.example.Holidaymaker.entities.Hotel;
import com.example.Holidaymaker.entities.Room;
import com.example.Holidaymaker.services.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/rest")
public class HotelController {
    @Autowired
    private HotelService hotelService;

    @GetMapping("/hotels")
    public List<Hotel> getAllHotels(){ return hotelService.getAll(); }


    @GetMapping("/hotel/{hotelId}")
    public List<Hotel> getHotelsById(@PathVariable long hotelId){
        return hotelService.getHotelsById(hotelId);
    }

}
