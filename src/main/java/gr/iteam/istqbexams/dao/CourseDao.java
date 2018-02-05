package gr.iteam.istqbexams.dao;

import java.util.List;

import gr.iteam.istqbexams.model.Course;

public interface CourseDao {
	
	Course findByCourseId(int id);
	
	Course findByName(String name);
	
	void save(Course course);
	
	List<Course> list();
	
	void delete(int id);
	
	void clear(int id);

}
