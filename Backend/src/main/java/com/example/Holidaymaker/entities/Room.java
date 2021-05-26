package com.example.Holidaymaker.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity // this is an entity class
@Table(name="rooms") // the table name is rooms
public class Room {
    @Id // the primary key is the long under this annotation
    @GeneratedValue(strategy = GenerationType.IDENTITY) // activates autoincrement
    private long id; // this is the primary key
    private long room_nr;
    private long beds;
    private long price;
    private boolean booked;

    @ManyToOne
    private Hotel hotel;

    @OneToMany (mappedBy = "room", cascade = CascadeType.ALL)
    private List<Booking> bookings;

    public Room() {
    }

    public Room(long id, long room_nr, long beds, long price, boolean booked, Hotel hotel) {
        this.id = id;
        this.room_nr = room_nr;
        this.beds = beds;
        this.price = price;
        this.booked = booked;
        this.hotel = hotel;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getRoom_nr() {
        return room_nr;
    }

    public void setRoom_nr(long room_nr) {
        this.room_nr = room_nr;
    }

    public long getBeds() {
        return beds;
    }

    public void setBeds(long beds) {
        this.beds = beds;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public boolean isBooked() {
        return booked;
    }

    public void setBooked(boolean booked) {
        this.booked = booked;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    @JsonIgnore
    public List<Booking> getBookings() {
        return bookings;
    }

    public void setBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", room_nr=" + room_nr +
                ", beds=" + beds +
                ", price=" + price +
                ", booked=" + booked +
                ", hotel=" + hotel +
                '}';
    }
}