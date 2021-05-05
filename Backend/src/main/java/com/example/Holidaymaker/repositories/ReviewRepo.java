package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepo extends JpaRepository<Review, Long> {

    @Query(value = "SELECT * FROM reviews WHERE cape_color LIKE %?1% ORDER BY name ASC", nativeQuery = true)
    List<Review> getWithHotelId(long hotelId);
}
