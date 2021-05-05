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

    @GetMapping("/rest/reviews/{hotelId}")
    public List<Review> getReviewsByHotelId(@PathVariable long hotelId) {
        return reviewService.getReviewsByHotelId(hotelId);
    }

    @PostMapping("/rest/reviews")
    public Review addReview(@RequestBody Review review) {
        return reviewService.addReview(review);
    }

}
