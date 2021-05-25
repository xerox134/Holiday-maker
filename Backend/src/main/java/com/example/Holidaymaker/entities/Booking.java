package com.example.Holidaymaker.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "bookings")
public class Booking {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;
    private long price;
    private boolean extraBed;
    private boolean wholePension;
    private boolean halfPension;
    private boolean allInclusive;
    private long fromDate;
    private long toDate;

    @ManyToOne
    private Hotel hotel;

    @ManyToOne
    private Room room;

    @ManyToOne
    private User user;

    public Booking() {
    }

    public Booking(long id, long price, boolean extraBed, boolean wholePension, boolean halfPension, boolean allInclusive, long fromDate, long toDate, Hotel hotel, Room room, User user) {
        this.id = id;
        this.price = price;
        this.extraBed = extraBed;
        this.wholePension = wholePension;
        this.halfPension = halfPension;
        this.allInclusive = allInclusive;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.hotel = hotel;
        this.room = room;
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public boolean isExtraBed() {
        return extraBed;
    }

    public void setExtraBed(boolean extraBed) {
        this.extraBed = extraBed;
    }

    public boolean isWholePension() {
        return wholePension;
    }

    public void setWholePension(boolean wholePension) {
        this.wholePension = wholePension;
    }

    public boolean isHalfPension() {
        return halfPension;
    }

    public void setHalfPension(boolean halfPension) {
        this.halfPension = halfPension;
    }

    public boolean isAllInclusive() {
        return allInclusive;
    }

    public void setAllInclusive(boolean allInclusive) {
        this.allInclusive = allInclusive;
    }

    public long getFromDate() {
        return fromDate;
    }

    public void setFromDate(long fromDate) {
        this.fromDate = fromDate;
    }

    public long getToDate() {
        return toDate;
    }

    public void setToDate(long toDate) {
        this.toDate = toDate;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "id=" + id +
                ", price=" + price +
                ", extraBed=" + extraBed +
                ", wholePension=" + wholePension +
                ", halfPension=" + halfPension +
                ", allInclusive=" + allInclusive +
                ", fromDate=" + fromDate +
                ", toDate=" + toDate +
                ", hotel=" + hotel +
                ", room=" + room +
                ", user=" + user +
                '}';
    }
}
