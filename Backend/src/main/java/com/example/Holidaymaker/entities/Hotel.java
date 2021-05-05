package com.example.Holidaymaker.entities;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="hotels")
public class Hotel {
    @Id// Primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY) //autoincrement
    @Column(name = "id")
    private long id;
    private String name;
    private String country;
    private String city;
    private String address;
    private boolean pool;
    private boolean entertainment;
    private boolean childrensClub;
    private boolean restaurant;
    private int distance_to_beach;
    private int distance_to_center;

    @OneToMany(mappedBy = "hotel")
    private List<Review> reviews;

    public Hotel() {
    }

    public Hotel(long id, String name, String country, String city, String address, boolean pool, boolean entertainment, boolean childrensClub, boolean restaurant, int distance_to_beach, int distance_to_center) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.city = city;
        this.address = address;
        this.pool = pool;
        this.entertainment = entertainment;
        this.childrensClub = childrensClub;
        this.restaurant = restaurant;
        this.distance_to_beach = distance_to_beach;
        this.distance_to_center = distance_to_center;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String adress) {
        this.address = adress;
    }

    public boolean isPool() {
        return pool;
    }

    public void setPool(boolean pool) {
        this.pool = pool;
    }

    public boolean isEntertainment() {
        return entertainment;
    }

    public void setEntertainment(boolean entertainment) {
        this.entertainment = entertainment;
    }

    public boolean isChildrensClub() {
        return childrensClub;
    }

    public void setChildrensClub(boolean childrensClub) {
        this.childrensClub = childrensClub;
    }

    public boolean isRestaurant() {
        return restaurant;
    }

    public void setRestaurant(boolean restaurant) {
        this.restaurant = restaurant;
    }

    public int getDistance_to_beach() {
        return distance_to_beach;
    }

    public void setDistance_to_beach(int distance_to_beach) {
        this.distance_to_beach = distance_to_beach;
    }

    public int getDistance_to_center() {
        return distance_to_center;
    }

    public void setDistance_to_center(int distance_to_center) {
        this.distance_to_center = distance_to_center;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    @Override
    public String toString() {
        return "\nhotels{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", city='" + city + '\'' +
                ", address='" + address + '\'' +
                ", pool=" + pool +
                ", entertainment=" + entertainment +
                ", childrens_club=" + childrensClub +
                ", restaurant=" + restaurant +
                ", distance_to_beach=" + distance_to_beach +
                ", distance_to_center=" + distance_to_center +
                '}';
    }
}
