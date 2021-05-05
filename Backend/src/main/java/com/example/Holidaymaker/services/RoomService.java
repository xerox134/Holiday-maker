package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Hotels;
import com.example.Holidaymaker.entities.Room;
import com.example.Holidaymaker.repositories.RoomRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomService {
    @Autowired
    private RoomRepo roomRepo;

    public List<Room> getAll(){
        return roomRepo.findAll(); //Select * From Room

    }

    public List<Room> getRooms (long hotel){
        if(roomRepo.getRooms(hotel) != null){
            List<Room> roomList = roomRepo.getRooms(hotel);
            return roomList;
        }
        return null;
    }



}
