package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Favorite;
import com.example.Holidaymaker.repositories.FavoriteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FavoriteService {

    @Autowired
    private FavoriteRepo favoriteRepo;


    public Favorite addFavorite(Favorite favorite) {
        try {
            return favoriteRepo.save(favorite);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void deleteById(long id) { favoriteRepo.deleteById(id); }



   public List<Favorite> getAll() {
        return favoriteRepo.findAll();
    }


    public List<Favorite> findById(long userid) {
       if(favoriteRepo.findByUserid( userid) != null){
            List<Favorite> favoriteList = favoriteRepo.findByUserid(userid);
            return favoriteList;
        }
        return null;
    }
}
