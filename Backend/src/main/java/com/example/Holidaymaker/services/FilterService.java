package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.Holidaymaker.repositories.HotelRepo;

import java.util.List;

@Service
public class FilterService {
    @Autowired
    private HotelRepo hotelRepo;



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
        return hotelRepo.findByPoolTrue();
    }
}
