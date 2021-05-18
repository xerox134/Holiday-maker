package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Hotel;
import com.example.Holidaymaker.entities.Review;
import com.example.Holidaymaker.entities.Room;
import com.example.Holidaymaker.repositories.HotelRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class HotelService {
    @Autowired
    private HotelRepo hotelRepo;

    public List<Hotel> getAll(){
        return hotelRepo.findAll(); //Select * From Service

    }

    public List<Hotel> getByHotelName(String phrase){
       List <Hotel> AllHotels;
       List <Hotel> returningHotels = new ArrayList<>();
       AllHotels=hotelRepo.findAll();

       for (Hotel hot: AllHotels){
           if (hot.getName().toLowerCase().contains(phrase.toLowerCase())){
               System.out.println(hot);
               System.out.println("here");
               returningHotels.add(hot);

           }
       }

       return returningHotels;

    }

    public List<Hotel> getHotelsById(long hotelId) {
        return hotelRepo.findById(hotelId);
    }
}
