package com.example.Holidaymaker.controller;

import com.example.Holidaymaker.entities.Hotel;
import com.example.Holidaymaker.entities.Room;
import com.example.Holidaymaker.services.FilterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/rest")
public class FilterController {
    @Autowired
    private FilterService filterService;

    @GetMapping("hotels/filter/country/{countryname}")
    public List<Hotel> getByCountryName(@PathVariable String countryname) {
    return filterService.getByCountryName(countryname);
    }

    @GetMapping("hotels/filter/city/{cityname}")
    public List<Hotel> getByCityName(@PathVariable String cityname) {
        return filterService.getByCityName(cityname);}

    @GetMapping("hotels/filter/pool")
        public List<Hotel> getByPool() {
        return filterService.getHotelsByPool();
    }


}
