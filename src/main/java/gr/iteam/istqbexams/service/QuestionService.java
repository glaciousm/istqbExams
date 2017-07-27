package gr.iteam.istqbexams.service;

import java.util.List;

import gr.iteam.istqbexams.model.Course;
import gr.iteam.istqbexams.model.Question;

public interface QuestionService {
	
	Question findById(int id);
	
	void saveOrUpdate(Question question);
	
	void delete(int id);
	
	void deleteByCourse(Course course);
	
	List<Question> list();
	
	List<Question> listFromCourse(int course);
	
	List<Question> randomList(int course);
	
	List<Question> randomList(int course, int max);
	
	List<Question> randomListFromChapter(int course, int max, int chapter);
	
	Long count();

}
