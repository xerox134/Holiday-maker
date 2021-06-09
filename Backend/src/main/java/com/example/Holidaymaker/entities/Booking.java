package com.example.Holidaymaker.entities;

import com.fasterxml.jackson.annotation.JsonFormat;

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
    private int numberOfAdults;
    private int numberOfChildren;
    private String fromDate;
    private String toDate;
    private boolean paid;

    @ManyToOne
    private Room room;

    @ManyToOne
    private User user;

    public Booking() {
    }

    public Booking(long id, long price, boolean extraBed, boolean wholePension, boolean halfPension,boolean allInclusive,
                   int numberOfAdults, int numberOfChildren, String fromDate, String toDate, Room room, User user, boolean paid) {
        this.id = id;
        this.price = price;
        this.extraBed = extraBed;
        this.wholePension = wholePension;
        this.halfPension = halfPension;
        this.allInclusive = allInclusive;
        this.numberOfAdults = numberOfAdults;
        this.numberOfChildren = numberOfChildren;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.room = room;
        this.user = user;
        this.paid = paid;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public int getNumberOfAdults() {
        return numberOfAdults;
    }

    public void setNumberOfAdults(int numberOfAdults) {
        this.numberOfAdults = numberOfAdults;
    }

    public int getNumberOfChildren() {
        return numberOfChildren;
    }

    public void setNumberOfChildren(int numberOfChildren) {
        this.numberOfChildren = numberOfChildren;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public boolean isPaid() {
        return paid;
    }

    public void setPaid(boolean paid) {
        this.paid = paid;
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
                ", numberOfAdults=" + numberOfAdults +
                ", numberOfChildren=" + numberOfChildren +
                ", fromDate='" + fromDate + '\'' +
                ", toDate='" + toDate + '\'' +
                ", paid=" + paid +
                ", room=" + room +
                ", user=" + user +
                '}';
    }
}
