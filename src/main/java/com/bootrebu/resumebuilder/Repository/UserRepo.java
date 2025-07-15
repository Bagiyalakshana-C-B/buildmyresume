package com.bootrebu.resumebuilder.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bootrebu.resumebuilder.Model.User;

public interface UserRepo extends JpaRepository<User,Integer> {
	
	User findByEmail(String email);

}
