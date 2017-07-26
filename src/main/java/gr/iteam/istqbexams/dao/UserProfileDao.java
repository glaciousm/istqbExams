package gr.iteam.istqbexams.dao;

import java.util.List;

import gr.iteam.istqbexams.model.UserProfile;


public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
