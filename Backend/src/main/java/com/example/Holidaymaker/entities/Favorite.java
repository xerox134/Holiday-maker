package com.example.Holidaymaker.entities;

import javax.persistence.*;

@Entity
@Table(name = "favorites")
public class Favorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long userid;
    private long hotelid;
    private String Hotelname;
    private String Description;
    private String Hotelcountry;
    private String Hotelcity;

    public Favorite() { }

    public Favorite(long id, long userid, long hotelid, String hotelname, String description, String hotelcountry, String hotelcity) {
        this.id = id;
        this.userid = userid;
        this.hotelid = hotelid;
        Hotelname = hotelname;
        Description = description;
        Hotelcountry = hotelcountry;
        Hotelcity = hotelcity;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public long getHotelid() {
        return hotelid;
    }

    public void setHotelid(long hotelid) {
        this.hotelid = hotelid;
    }

    public String getHotelname() {
        return Hotelname;
    }

    public void setHotelname(String hotelname) {
        Hotelname = hotelname;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getHotelcountry() {
        return Hotelcountry;
    }

    public void setHotelcountry(String hotelcountry) {
        Hotelcountry = hotelcountry;
    }

    public String getHotelcity() {
        return Hotelcity;
    }

    public void setHotelcity(String hotelcity) {
        Hotelcity = hotelcity;
    }

    @Override
    public String toString() {
        return "Favorite{" +
                "id=" + id +
                ", userid=" + userid +
                ", hotelid=" + hotelid +
                ", Hotelname='" + Hotelname + '\'' +
                ", Description='" + Description + '\'' +
                ", Hotelcountry='" + Hotelcountry + '\'' +
                ", Hotelcity='" + Hotelcity + '\'' +
                '}';
    }
}

