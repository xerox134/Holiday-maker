package com.example.Holidaymaker.repositories;


import com.example.Holidaymaker.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
/*
    @Query(value = "SELECT username, " +
            "friend_relationships.relation, users.id, users.password "+
            "FROM friend_relationships "+
            "JOIN users "+
            "ON friend_relationships.friendsid=users.id " +
            "WHERE friend_relationships.userid = ?1", nativeQuery = true)
    List<User> getFriend (Long id);
 */
}
