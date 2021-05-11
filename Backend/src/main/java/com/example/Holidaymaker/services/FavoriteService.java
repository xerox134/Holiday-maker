package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Favorite;
import com.example.Holidaymaker.entities.Review;
import com.example.Holidaymaker.entities.User;
import com.example.Holidaymaker.repositories.FavoriteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FavoriteService {

    @Autowired
    private FavoriteRepo favoriteRepo;
    @Autowired
    private UserService userService;



    public Favorite addFavorite(Favorite favorite) {
        User loggedUser = userService.whoAmI();
        if (loggedUser !=null){
            favorite.setUser(loggedUser);
            return favoriteRepo.save(favorite);
        }
        return null;
    }


    public void deleteById(long id) { favoriteRepo.deleteById(id); }



   public List<Favorite> getAll() {
        return favoriteRepo.findAll();
    }


    public List<Favorite> getFavoriteByUserId(long userId) {
       return favoriteRepo.findFavoriteByUserId(userId);

    }

    public Favorite getById(long id) {
        Optional<Favorite> favorite = favoriteRepo.findById(id);

        return favorite.orElse(null);
    }
}
