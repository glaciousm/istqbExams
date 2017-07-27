package gr.iteam.istqbexams.dao;

import java.util.List;

import gr.iteam.istqbexams.model.Course;
import gr.iteam.istqbexams.model.Result;

public interface ResultDao {

	Result findByUserId(int id);
	
	List<Result> findByCourseId(Course course);
	
	void deleteByCourse(Course course);
	
	void save(Result result);
	
	List<Result> list();
	
	List<Result> listByUser(int id);
	
	List<Result> listByUserAndCourse(int userId, int courseId);
}
