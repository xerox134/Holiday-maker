package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Review;
import com.example.Holidaymaker.entities.User;
import com.example.Holidaymaker.repositories.ReviewRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepo reviewRepo;

    private UserService userService;

    public List<Review> getAllReviews() {
        return reviewRepo.findAll(); //Inbyggd metod
    }

    public List<Review> getReviewsByUserId(long userId) {
        return reviewRepo.findByUserId(userId);
    }

    public List<Review> getReviewsByHotelId(long hotelId) {
        return reviewRepo.findByHotelId(hotelId);
    }

    public Review addReview(Review review) {
        User loggedUser = userService.whoAmI();
        if (loggedUser != null) {
            System.out.println(loggedUser);
            try {
                return reviewRepo.save(review);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
    }
        return null;
    }

    public Review getById(long id) {
            Optional<Review> review = reviewRepo.findById(id);

            return review.orElse(null);
    }

    public void deleteReview(long id) {
        reviewRepo.deleteById(id);
    }

}
