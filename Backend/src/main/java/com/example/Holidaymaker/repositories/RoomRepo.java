package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomRepo extends JpaRepository<Room, Long> {

    List<Room> findRoomByHotelId(Long hotel);

    @Query(value = "SELECT " +
            "" +
            "", nativeQuery = true)
    List<Room> getRoom (Long id);

}
