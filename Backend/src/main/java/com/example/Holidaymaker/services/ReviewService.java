package com.example.Holidaymaker.services;

import com.example.Holidaymaker.entities.Review;
import com.example.Holidaymaker.repositories.ReviewRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepo reviewRepo;

    public List<Review> getReviewsByHotelId(long hotelId) {
        return reviewRepo.findByHotelId(hotelId);
    }

    public Review addReview(Review review) {
            try {
                return reviewRepo.save(review);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        return null;
    }

    public List<Review> getAllReviews() {
        return reviewRepo.findAll(); //Inbyggd metod
    }
}
