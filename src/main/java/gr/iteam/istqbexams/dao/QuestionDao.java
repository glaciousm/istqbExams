package gr.iteam.istqbexams.dao;

import java.util.List;

import gr.iteam.istqbexams.model.Course;
import gr.iteam.istqbexams.model.Question;

public interface QuestionDao {
	
	Question findById(int id);
	
	List<Question> findByCourse(Course course);
	
	void save(Question question);
	
	void update(Question question);
	
	void delete(int id);
	
	void deleteByCourse(Course course);
	
	List<Question> list();
	
	List<Question> listFromCourse(int course);
	
	List<Question> randomList(int course);
	
	List<Question> randomList(int course, int max);
	
	List<Question> randomListFromChapter(int course, int max, int chapter);
	
	Long count();

}
