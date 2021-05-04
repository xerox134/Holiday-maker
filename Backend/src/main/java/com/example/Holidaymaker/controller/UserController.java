package com.example.Holidaymaker.controller;


import com.example.Holidaymaker.entities.User;
import com.example.Holidaymaker.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class UserController {
  /*
      C - @PostMapping
      R - @GetMapping
      U - @PutMapping
      D - @DeleteMapping
   */

    @Autowired
    private UserService userService;

    @GetMapping("/rest/users")
    public List<User> getAll() {
        return userService.getAll();
    }

    @GetMapping("/rest/users/{id}")
    public User getById(@PathVariable long id) {
        return userService.findById(id);
    }

    @DeleteMapping("/rest/users/{id}")
    public void deleteById(@PathVariable long id) { userService.deleteById(id); }

    @PutMapping("/rest/users/{id}")
    public void updateById(@RequestBody User user, @PathVariable long id) { userService.updateById(id, user); }

    @PostMapping("/auth/register")
    public User register(@RequestBody User user){ return userService.register(user); }

    @PostMapping("/login")
    public User login(@RequestBody User user, HttpServletRequest req) { return userService.login(user, req); }

    @GetMapping("/auth/whoami")
    public User whoAmI() { return userService.findCurrentUser(); }


}