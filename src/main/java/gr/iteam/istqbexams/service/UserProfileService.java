package gr.iteam.istqbexams.service;

import java.util.List;

import gr.iteam.istqbexams.model.UserProfile;


public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);
	
	List<UserProfile> findAll();
	
}
