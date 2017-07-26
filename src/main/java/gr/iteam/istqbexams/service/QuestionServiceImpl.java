package gr.iteam.istqbexams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gr.iteam.istqbexams.dao.QuestionDao;
import gr.iteam.istqbexams.model.Question;

@Service("questionService")
@Transactional
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	QuestionDao questionDao;

	@Override
	public Question findById(int id) {
		return questionDao.findById(id);
	}

	@Override
	public void saveOrUpdate(Question question) {
		Question entity = null;
		if (question.getId()!=null) {
			entity = questionDao.findById(question.getId());
			if(entity!=null){
				entity.setId(question.getId());
				if(!question.getContext().equals(entity.getContext())){
					entity.setContext(question.getContext());
				}
				if (question.getChapter()!=entity.getChapter()) {
					entity.setChapter(question.getChapter());
				}
				if (question.getDifficulty()!=entity.getDifficulty()) {
					entity.setDifficulty(question.getDifficulty());
				}
				if (question.getCorrect()!=entity.getCorrect()) {
					entity.setCorrect(question.getCorrect());
				}
				if (question.getAnswera()!=entity.getAnswera()) {
					entity.setAnswera(question.getAnswera());
				}
				if (question.getAnswerb()!=entity.getAnswerb()) {
					entity.setAnswerb(question.getAnswerb());
				}
				if (question.getAnswerc()!=entity.getAnswerc()) {
					entity.setAnswerc(question.getAnswerc());
				}
				if (question.getAnswerd()!=entity.getAnswerd()) {
					entity.setAnswerd(question.getAnswerd());
				}
				if (!question.getCourse().equals(entity.getCourse())) {
					entity.setCourse(question.getCourse());
				}
			} else {
				questionDao.save(question);
			}
		}	else {
			questionDao.save(question);
		}
	}

	@Override
	public void delete(int id) {
		questionDao.delete(id);
		
	}

	@Override
	public List<Question> list(String course) {
		return questionDao.list(course);
	}

	@Override
	public List<Question> listFromCourse(String course) {
		return questionDao.listFromCourse(course);
	}

	@Override
	public Long count() {
		return questionDao.count();
	}

	@Override
	public List<Question> randomList(String course) {
		return questionDao.randomList(course);
	}
	
	@Override
	public List<Question> randomList(String course, int max) {
		return questionDao.randomList(course, max);
	}

	@Override
	public List<Question> randomListFromChapter(String course, int max, int chapter) {
		return questionDao.randomListFromChapter(course, max, chapter);
	}

}
