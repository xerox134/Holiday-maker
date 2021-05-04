package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Hotels;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HotelRepo extends JpaRepository<Hotels, Long> {


}
