package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Booking;
import com.example.Holidaymaker.entities.Favorite;
import com.example.Holidaymaker.entities.Hotel;
import com.example.Holidaymaker.entities.User;
import com.example.Holidaymaker.repositories.BookingRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingService {

    @Autowired
    private BookingRepo bookingRepo;
    @Autowired
    private UserService userService;

    public List<Booking> getBookingByUserId(long userId) {
        return bookingRepo.findBookingByUserId(userId);
    }


    public Booking addBooking(Booking booking) {
        User loggedUser = userService.whoAmI();
        if (loggedUser != null){
            booking.setUser(loggedUser);
            return bookingRepo.save(booking);
        }
        return null;
    }

    public List<Booking> getAll() {
        return bookingRepo.findAll();
    }

}
