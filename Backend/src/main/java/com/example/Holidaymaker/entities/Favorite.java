package com.example.Holidaymaker.entities;

import javax.persistence.*;

@Entity
@Table(name = "favorites")
public class Favorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long user;
    private long hotel;

    public Favorite() {    }

    public Favorite(long id, long user_id, long hotel) {
        this.id = id;
        this.user = user_id;
        this.hotel = hotel;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUser_id() {
        return user;
    }

    public void setUser_id(long user_id) {
        this.user = user_id;
    }

    public long getHotel() {
        return hotel;
    }

    public void setHotel(long hotel) {
        this.hotel = hotel;
    }

    @Override
    public String toString() {
        return "Favorite{" +
                "id=" + id +
                ", user=" + user +
                ", hotel=" + hotel +
                '}';
    }
}
