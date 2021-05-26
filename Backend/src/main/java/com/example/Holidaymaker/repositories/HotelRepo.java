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
    List<Hotel> findByCountry(String countryname);
    List<Hotel> findByCity(String cityname);
    List<Hotel> findByPoolTrue();
    List<Hotel> findByWifiTrue();
    List<Hotel> findByRestaurantTrue();
    List<Hotel> findByBarTrue();
    List<Hotel> findByEntertainmentTrue();
}
