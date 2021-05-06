package com.example.Holidaymaker.entities;

import javax.persistence.*;

@Entity // this is an entity class
@Table(name="rooms") // the table name is rooms
@SecondaryTable(name = "hotels") // access to hotels table for extraction of hotel name
public class Room {
    @Id // the primary key is the long under this annotation
    @GeneratedValue(strategy = GenerationType.IDENTITY) // activates autoincrement
    private long id; // this is the primary key
    private long hotel;
    private long room_nr;
    private long beds;
    private long price;
    private long booked;
    @Embedded
    private HotelName hotelName; // assign embedded class

    public Room() {
    }

    public Room(long id, long hotel, long room_nr, long beds, long price, long booked) {
        this.id = id;
        this.hotel = hotel;
        this.room_nr = room_nr;
        this.beds = beds;
        this.price = price;
        this.booked = booked;
    }

    public Room(long id, long hotel, long room_nr, long beds, long price, long booked, HotelName hotelName) {
        this.id = id;
        this.hotel = hotel;
        this.room_nr = room_nr;
        this.beds = beds;
        this.price = price;
        this.booked = booked;
        this.hotelName = hotelName;
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

    public long getBooked() {
        return booked;
    }

    public void setBooked(long booked) {
        this.booked = booked;
    }

    public HotelName getHotelName() {
        return hotelName;
    }

    public void setHotelName(HotelName hotelName) {
        this.hotelName = hotelName;
    }
}

@Embeddable
class HotelName{ // embedded class with hotel name from table hotels
    @Column(insertable = false, updatable = false, name = "name", table = "hotels")
    String hotelName;

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    @Override
    public String toString() {
        return "HotelName{" +
                "hotelName='" + hotelName + '\'' +
                '}';
    }

}