package com.example.Holidaymaker.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "bookings")
public class Booking {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    private Hotel hotel;
    @ManyToOne
    private Room room;
    @ManyToOne
    private User user;
    private long price;
    private boolean extraBed;
    private long wholePension;
    private long halfPension;
    private long allInclusive;
    private Date fromDate;
    private Date toDate;

    public Booking() {
    }

    public Booking(long id, Hotel hotel, Room room, User user, long price, boolean extraBed,
                   long wholePension, long halfPension, long allInclusive, Date fromDate, Date toDate) {
        this.id = id;
        this.hotel = hotel;
        this.room = room;
        this.user = user;
        this.price = price;
        this.extraBed = extraBed;
        this.wholePension = wholePension;
        this.halfPension = halfPension;
        this.allInclusive = allInclusive;
        this.fromDate = fromDate;
        this.toDate = toDate;
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

    public long getWholePension() {
        return wholePension;
    }

    public void setWholePension(long wholePension) {
        this.wholePension = wholePension;
    }

    public long getHalfPension() {
        return halfPension;
    }

    public void setHalfPension(long halfPension) {
        this.halfPension = halfPension;
    }

    public long getAllInclusive() {
        return allInclusive;
    }

    public void setAllInclusive(long allInclusive) {
        this.allInclusive = allInclusive;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "id=" + id +
                ", hotel=" + hotel +
                ", room=" + room +
                ", user=" + user +
                ", price=" + price +
                ", extraBed=" + extraBed +
                ", wholePension=" + wholePension +
                ", halfPension=" + halfPension +
                ", allInclusive=" + allInclusive +
                ", fromDate=" + fromDate +
                ", toDate=" + toDate +
                '}';
    }
}
