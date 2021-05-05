package com.example.Holidaymaker.services;

import com.example.Holidaymaker.configurations.MyUserDetailsService;
import com.example.Holidaymaker.entities.User;
import com.example.Holidaymaker.repositories.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;


@Service
public class UserService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MyUserDetailsService detailsService;

    // bean from your SecurityConfig


    public User register(User user) {
        return detailsService.registerUser(user);
    } // i my user detail service högst upp

    public List<User> getAll() {
        return userRepo.findAll(); // SELECT * FROM heroes
    }

    public User getById(long id) {
        Optional<User> user = userRepo.findById(id);

        return user.orElse(null);
    }

    public void deleteUser(long id) {
        userRepo.deleteById(id);
    }

    public User updateById(long id, User user) {
        User userFromDB = getById(id);
        if(userFromDB!=null){
            user.setId(id);
            user.setPassword(userFromDB.getPassword());
            return userRepo.save(user);
        }
        return null;
    }

    public User whoAmI() {
        // SecurityContextHolder.getContext() taps into the current session
        // getAuthentication() returns the current logged in user
        // getName() returns the logged in username (email in this case)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication != null) {
            String email = authentication.getName();
            return userRepo.findByEmail(email);
        }

        return null;
    }
}