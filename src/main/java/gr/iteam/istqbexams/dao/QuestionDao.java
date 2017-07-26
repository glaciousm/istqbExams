package gr.iteam.istqbexams.dao;

import java.util.List;

import gr.iteam.istqbexams.model.Question;

public interface QuestionDao {
	
	Question findById(int id);
	
	void save(Question question);
	
	void update(Question question);
	
	void delete(int id);
	
	List<Question> list(String course);
	
	List<Question> listFromCourse(String course);
	
	List<Question> randomList(String course);
	
	List<Question> randomList(String course, int max);
	
	List<Question> randomListFromChapter(String course, int max, int chapter);
	
	Long count();

}
