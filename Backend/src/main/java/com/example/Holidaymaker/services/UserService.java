package com.example.Holidaymaker.services;


import com.example.Holidaymaker.configurations.MyUserDetailsService;
import com.example.Holidaymaker.entities.User;
import com.example.Holidaymaker.repositories.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Field;
import java.util.List;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@Service
public class UserService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MyUserDetailsService detailsService;

    // bean from your SecurityConfig
    @Resource(name="authenticationManager")
    private AuthenticationManager authManager;

    public User register(User user) {
        return detailsService.addUser(user);
    } // i my user detail service högst upp

    public List<User> getAll() {
        return userRepo.findAll();
    }

//  public User save(User user) {
//    return userRepo.save(user);
//  }

    public User findById(long id) {
        if(userRepo.findById(id).isPresent()) {
            return userRepo.findById(id).get();
        }
        return null;
    }



    public void deleteById(long id) {
        userRepo.deleteById(id);
    }

    public void updateById(long id, User user) {
        User fromDb = findById(id);
        if(fromDb != null) {

            Field[] fields = user.getClass().getDeclaredFields(); // get all fields, even private one
            try {
                for(Field field : fields) {
                    field.setAccessible(true); // get access to private fields
                    if(field.get(user) != null && !field.isAnnotationPresent(Id.class)) {
                        field.set(fromDb, field.get(user));
                    }
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }

            detailsService.updateUser(fromDb);
        }
    }

    public User findCurrentUser() {
        // the login session is stored between page reloads,
        // and we can access the current authenticated user with this
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return userRepo.findByUsername(username);
    }

    public User login(User user, HttpServletRequest req) {
        try {
            UsernamePasswordAuthenticationToken authReq
                    = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
            Authentication auth = authManager.authenticate(authReq);

            SecurityContext sc = SecurityContextHolder.getContext();
            sc.setAuthentication(auth);
            HttpSession session = req.getSession(true);
            session.setAttribute(SPRING_SECURITY_CONTEXT_KEY, sc);
        } catch(BadCredentialsException err) {
            throw new BadCredentialsException("Bad Credentials");
        }

        return findCurrentUser();
    }
}
