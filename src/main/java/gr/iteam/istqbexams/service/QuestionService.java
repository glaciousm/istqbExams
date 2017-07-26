package gr.iteam.istqbexams.service;

import java.util.List;

import gr.iteam.istqbexams.model.Question;

public interface QuestionService {
	
	Question findById(int id);
	
	void saveOrUpdate(Question question);
	
	void delete(int id);
	
	List<Question> list(String course);
	
	List<Question> listFromCourse(String course);
	
	List<Question> randomList(String course);
	
	List<Question> randomList(String course, int max);
	
	List<Question> randomListFromChapter(String course, int max, int chapter);
	
	Long count();

}
