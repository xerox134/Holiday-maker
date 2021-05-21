package com.example.Holidaymaker.controller;

import com.example.Holidaymaker.entities.Booking;
import com.example.Holidaymaker.entities.Favorite;
import com.example.Holidaymaker.entities.Hotel;
import com.example.Holidaymaker.services.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rest")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @GetMapping("/bookings")
    public List<Booking> getAllBookings(){
        return bookingService.getAll();
    }


    @GetMapping("/bookings/{userId}")
    public List<Booking> getBookingByUserId(@PathVariable long userId){
        return bookingService.getBookingByUserId(userId);
    }

    @PostMapping("/bookings")
    public Booking book(@RequestBody Booking booking){
        return bookingService.addBooking(booking);
    }



}
