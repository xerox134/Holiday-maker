package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookingRepo extends JpaRepository <Booking, Long> {
    List<Booking> findBookingByUserId(Long userId);

}
