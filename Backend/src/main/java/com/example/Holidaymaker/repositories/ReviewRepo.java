package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepo extends JpaRepository<Review, Long> {
    List<Review> findByUserId(long userId);

    List<Review> findByHotelId(long hotelId);
}
