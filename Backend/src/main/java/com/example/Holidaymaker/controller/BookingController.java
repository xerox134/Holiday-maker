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


    @GetMapping("/bookings/user/{userId}")
    public List<Booking> getBookingByUserId(@PathVariable long userId){
        return bookingService.getBookingByUserId(userId);
    }

    @GetMapping("/confirmpayment/{userId}")
    public void confirmPayment(@PathVariable long userId){
        bookingService.confirmPayment(userId);
    }

    @PostMapping("/bookings")
    public Booking addBooking(@RequestBody Booking booking) {
        return bookingService.addBooking(booking);
        // EXEMPEL PÅ JSON-POST
        /*
        {
            "room": {
                "id": 1085
                },
                "price": 1200,
                "extraBed": true,
                "wholePension": true,
                "halfPension": false,
                "allInclusive": false,
                "numberOfAdults": 4,
                "numberOfChildren": 0,
                "fromDate": 20210715,
                "toDate": 20210723
        }
         */
    }

    @DeleteMapping("/bookings/{id}")
    public void deleteBookingById(@PathVariable long id) {
        bookingService.deleteById(id);}


}
