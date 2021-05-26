package com.example.Holidaymaker.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name="hotels")
public class Hotel {
    @Id// Primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY) //autoincrement
    @Column(name = "id")
    private long id;
    private String name;
    private int review;
    private String country;
    private String city;
    private String address;
    private String description;
    private boolean wifi;
    private boolean pool;
    private boolean bar;
    private boolean entertainment;
    private boolean childrens_club;
    private boolean restaurant;
    private int distance_to_beach;
    private int distance_to_center;
    private String img;
    private int cheapest_price;

    @OneToMany(mappedBy = "hotel", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Review> reviews;

    @OneToMany(mappedBy = "hotel")
    private List<Room> rooms;

    @OneToMany(mappedBy = "hotel", cascade = CascadeType.ALL)
    private List<Favorite> favorites;

    @OneToMany(mappedBy = "hotel", cascade = CascadeType.ALL)
    private List<Booking> bookings;


    public Hotel() {
    }

    public Hotel(long id, String name, String country, String city, String address, String description,
                 boolean wifi, boolean pool, boolean bar, boolean entertainment, boolean childrens_club,
                 boolean restaurant, int distance_to_beach, int distance_to_center, String img, int review, int cheapest_price
                 ) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.city = city;
        this.address = address;
        this.description = description;
        this.wifi = wifi;
        this.pool = pool;
        this.bar = bar;
        this.entertainment = entertainment;
        this.childrens_club = childrens_club;
        this.restaurant = restaurant;
        this.distance_to_beach = distance_to_beach;
        this.distance_to_center = distance_to_center;
        this.img = img;
        this.review =review;
        this.cheapest_price=cheapest_price;
    }

    public int getReview() {
        return review;
    }

    public void setReview(int review) {
        this.review = review;
    }

    public int getCheapest_price() {
        return cheapest_price;
    }

    public void setCheapest_price(int cheapest_price) {
        this.cheapest_price = cheapest_price;
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

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isWifi() {
        return wifi;
    }

    public void setWifi(boolean wifi) {
        this.wifi = wifi;
    }

    public boolean isPool() {
        return pool;
    }

    public void setPool(boolean pool) {
        this.pool = pool;
    }

    public boolean isBar() {
        return bar;
    }

    public void setBar(boolean bar) {
        this.bar = bar;
    }

    public boolean isEntertainment() {
        return entertainment;
    }

    public void setEntertainment(boolean entertainment) {
        this.entertainment = entertainment;
    }

    public boolean isChildrens_club() {
        return childrens_club;
    }

    public void setChildrens_club(boolean childrens_club) {
        this.childrens_club = childrens_club;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @JsonIgnore
    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }
    @JsonIgnore
    public List<Room> getRooms() {
        return rooms;
    }

    public void setRooms(List<Room> rooms) {
        this.rooms = rooms;
    }

    @JsonIgnore
    public List<Favorite> getFavorites() {
        return favorites;
    }

    public void setFavorites(List<Favorite> favorites) {
        this.favorites = favorites;
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
        return "Hotel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", city='" + city + '\'' +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                ", wifi=" + wifi +
                ", pool=" + pool +
                ", bar=" + bar +
                ", entertainment=" + entertainment +
                ", childrens_club=" + childrens_club +
                ", restaurant=" + restaurant +
                ", distance_to_beach=" + distance_to_beach +
                ", distance_to_center=" + distance_to_center +
                ", img='" + img +
                ", review=" + review +
                ", cheapest_price" + cheapest_price + '\'' +
                '}';
    }
}
