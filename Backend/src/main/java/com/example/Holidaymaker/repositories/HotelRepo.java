package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Hotel;
import com.example.Holidaymaker.entities.Review;
import com.example.Holidaymaker.entities.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HotelRepo extends JpaRepository<Hotel, Long> {

    List<Hotel> findById(long hotelId);


}
