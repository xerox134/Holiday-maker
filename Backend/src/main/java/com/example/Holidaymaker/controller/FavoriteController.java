package com.example.Holidaymaker.controller;

import com.example.Holidaymaker.entities.Favorite;
import com.example.Holidaymaker.services.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rest")
public class FavoriteController {
@Autowired
private FavoriteService favoriteService;

    @PostMapping("/favorites")
    public Favorite register(@RequestBody Favorite favorite){

        return favoriteService.addFavorite(favorite);
    }

}
