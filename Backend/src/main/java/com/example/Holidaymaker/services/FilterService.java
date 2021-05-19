package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.Holidaymaker.repositories.HotelRepo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class FilterService {
    @Autowired
    private HotelRepo hotelRepo;
    private List poolList = new ArrayList();
    private List entertainmentList = new ArrayList();
    private List restaurantList = new ArrayList();
    private List wifiList = new ArrayList();
    private List barList = new ArrayList();
    private List filteredHotels= new ArrayList();




    public List<Hotel> getByCountryName(String countryname) {
      if(hotelRepo.findByCountry(countryname) !=null){
          List<Hotel> hotelList= hotelRepo.findByCountry(countryname);
        return hotelList;
      }
        return null;
       }


    public List<Hotel> getByCityName(String cityname) {
        if(hotelRepo.findByCity(cityname) !=null){
            List<Hotel> hotelList= hotelRepo.findByCity(cityname);
            return hotelList;
        }
        return null;
    }

    public List<Hotel> getHotelsByPool() {
        poolList = hotelRepo.findByPoolTrue();
        return poolList;
    }

    public List<Hotel> getHotelsByEntertainment() {
        entertainmentList = hotelRepo.findByEntertainmentTrue();
        return entertainmentList;
    }
    public List<Hotel> getHotelsByRestaurant() {
        restaurantList = hotelRepo.findByRestaurantTrue();
        return restaurantList;
    }

    public List<Hotel> getHotelsByWifi() {
        wifiList = hotelRepo.findByWifiTrue();
        return wifiList;
    }

    public List<Hotel> getHotelsByBar() {
        barList = hotelRepo.findByBarTrue();
        return barList;
    }





    public List<Hotel> getFilteredHotels() {
        for (Object x : poolList){
            if (x.contains())
        }

        return null;
    }




}
