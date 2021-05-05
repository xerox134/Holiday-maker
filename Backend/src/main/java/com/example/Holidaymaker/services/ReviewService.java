package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Review;
import com.example.Holidaymaker.entities.User;
import com.example.Holidaymaker.repositories.ReviewRepo;
import com.example.Holidaymaker.repositories.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepo reviewRepo;

    public List<Review> getReviewsByHotelId(long hotelId) {
        return reviewRepo.getWithHotelId(hotelId);
    }

    public Review addReview(Review review) {
            try {
                return reviewRepo.save(review);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        return null;
    }
}
