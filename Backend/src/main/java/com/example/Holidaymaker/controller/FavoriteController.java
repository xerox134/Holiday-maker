package com.example.Holidaymaker.controller;

import com.example.Holidaymaker.entities.Favorite;
import com.example.Holidaymaker.entities.User;
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
        return favoriteService.addFavorite(favorite);}

    @DeleteMapping("/favorites/{id}")
    public void deleteById(@PathVariable long id) {
        favoriteService.deleteById(id);}

    @GetMapping("/favorites")
    public List<Favorite> getAll(){
        return favoriteService.getAll(); }

    @GetMapping("/favorites/{id}")
    public Favorite getFavoriteById(@PathVariable long id) {
        return favoriteService.getById(id);
    }

    @GetMapping("/favorites/user/{userId}")
     public List<Favorite> getFavoriteByUserId(@PathVariable long userId) {
        return favoriteService.getFavoriteByUserId(userId);
    }
}
