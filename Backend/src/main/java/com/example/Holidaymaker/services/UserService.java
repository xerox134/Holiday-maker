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