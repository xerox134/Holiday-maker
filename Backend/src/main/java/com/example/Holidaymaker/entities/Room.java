package com.example.Holidaymaker.entities;

import javax.persistence.*;

@Entity // this is an entity class
@Table(name="rooms") // the table name is rooms
public class Room {
    @Id // the primary key is the long under this annotation
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id; // this is the primary key
    private long hotel;
    private long room_nr;
    private long beds;
    private long price;

    public Room() {
    }

    public Room(long id, long hotel, long room_nr, long beds, long price) {
        this.id = id;
        this.hotel = hotel;
        this.room_nr = room_nr;
        this.beds = beds;
        this.price = price;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getHotel() {
        return hotel;
    }

    public void setHotel(long hotel) {
        this.hotel = hotel;
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

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", hotel=" + hotel +
                ", room_nr=" + room_nr +
                ", beds=" + beds +
                ", price=" + price +
                '}';
    }
}
