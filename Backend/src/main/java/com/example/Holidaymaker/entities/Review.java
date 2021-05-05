package com.example.Holidaymaker.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "reviews")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private int rating;
    private String description;

    @ManyToOne
    private User user;

    @ManyToOne
    private Hotel hotel;

    public Review() {
    }


    public Review(long id, int rating, String description, User user, Hotel hotel) {
        this.id = id;
        this.rating = rating;
        this.description = description;
        this.user = user;
        this.hotel = hotel;
    }

    /*public Review(long id, long userId, long hotelId, int rating, String description) {
        this.id = id;
        this.userId = userId;
        this.hotelId = hotelId;
        this.rating = rating;
        this.description = description;
    }*/

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", rating=" + rating +
                ", description='" + description + '\'' +
                ", user=" + user +
                ", hotel=" + hotel +
                '}';
    }
}
