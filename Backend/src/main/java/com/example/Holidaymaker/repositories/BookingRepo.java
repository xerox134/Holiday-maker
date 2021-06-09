package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookingRepo extends JpaRepository <Booking, Long> {
    List<Booking> findBookingByUserId(Long userId);

    List<Booking> findBookingByRoomId(Long roomId);

    @Query(
            value = "UPDATE bookings " +
                    "SET paid = 1 " +
                    "WHERE user_id = ?1 " +
                    "ORDER BY id DESC " +
                    "LIMIT 1",
            nativeQuery = true
    )
    List<Booking> confirmPayment (long userId);

    /*  big RIP
        @Query(
            value = "SELECT rooms.id, rooms.hotel, hotels.id, hotels.name, rooms.room_nr, rooms.beds, rooms.price, rooms.booked " +
            "FROM rooms " +
            "JOIN hotels " +
            "ON rooms.hotel=hotels.id " +
            "WHERE rooms.hotel = ?1",
            nativeQuery = true)
    List<Room> getRooms (Long hotel);

     */

}
