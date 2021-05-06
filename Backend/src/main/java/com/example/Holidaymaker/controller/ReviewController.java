package com.example.Holidaymaker.controller;

import com.example.Holidaymaker.entities.Review;
import com.example.Holidaymaker.services.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @GetMapping("/rest/reviews")
    public List<Review> getAllReviews() {
        return reviewService.getAllReviews();
    }

    @GetMapping("/rest/reviews/{id}")
    public Review getReviewById(@PathVariable long id) {
        return reviewService.getById(id);
    }

    @GetMapping("/rest/reviews/user/{userId}")
    public List<Review> getReviewsByUserId(@PathVariable long userId) {
        return reviewService.getReviewsByUserId(userId);
    }

    @GetMapping("/rest/reviews/hotel/{hotelId}")
    public List<Review> getReviewsByHotelId(@PathVariable long hotelId) {
        return reviewService.getReviewsByHotelId(hotelId);
    }

    @PostMapping("/rest/reviews")
    public Review addReview(@RequestBody Review review) {
        return reviewService.addReview(review);
        // EXEMPEL PÅ JSON-POST
    /*  {
        "rating": 5,
        "description": "Helt ok",
        "user": {
            "id": "2"
        },
        "hotel": {
            "id": 5
        }
    }*/
    }

    @DeleteMapping("/rest/reviews/{id}")
    public void deleteReview(@PathVariable long id) {
        reviewService.deleteReview(id);
    }

}
