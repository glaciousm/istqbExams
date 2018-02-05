package gr.iteam.istqbexams.service;

import java.util.List;

import gr.iteam.istqbexams.model.Course;

public interface CourseService {
	
	Course findById(int id);
	
	void deleteByCourse(int courseid);
	
	Course findByName(String name);
	
	void saveOrUpdate(Course course);
	
	void delete(int id);
	
	void clear(int id);

	List<Course> findAll(); 

}
