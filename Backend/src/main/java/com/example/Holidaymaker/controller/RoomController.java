package com.example.Holidaymaker.controller;

import com.example.Holidaymaker.entities.Hotels;
import com.example.Holidaymaker.entities.Room;
import com.example.Holidaymaker.services.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/rest")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @GetMapping("/room")
    public List<Room> getAllRooms(){
        return roomService.getAll();
    }




}
