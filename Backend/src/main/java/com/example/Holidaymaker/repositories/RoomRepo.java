package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomRepo extends JpaRepository<Room, Long> {

    List<Room> getRoomsByHotelId(Long hotelId);

    @Query(value = "SELECT rooms.room_nr, rooms.beds, rooms.price, rooms.booked" +
            "FROM rooms" +
            "JOIN hotels " +
            "ON rooms.hotel=hotels.id" +
            "WHERE rooms.hotel = ?1",
            nativeQuery = true)
    List<Room> getRooms (Long hotelId);

}
