package com.example.Holidaymaker.repositories;

import com.example.Holidaymaker.entities.Favorite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface FavoriteRepo extends JpaRepository<Favorite, Long> {
          List<Favorite> findByUserId(Long user_id);


}
