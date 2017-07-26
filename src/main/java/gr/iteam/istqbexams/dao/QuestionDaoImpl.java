package gr.iteam.istqbexams.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import gr.iteam.istqbexams.model.Question;

@Repository("questionDao")
public class QuestionDaoImpl extends AbstractDao<Integer, Question> implements QuestionDao{

	@Override
	public Question findById(int id) {
		Question question = getByKey(id);
		if(question!=null){
			Hibernate.initialize(question.getId());
		}
		return question;
	}

	@Override
	public void save(Question question) {
		persist(question);
	}
	
	@Override
	public Long count() {
		Query query = getSession().createQuery(
		        "select count(id) from Question");
		Long count = (Long)query.uniqueResult();
		return count;
	}
	
	@Override
	public void update(Question question) {
		update(question);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Question> randomList(String course) {
		List<Question> randomLst = new ArrayList<Question>();
		Query query = getSession().createQuery(
		        "from Question where course = '"+ course + "' order by rand()");
		query.setMaxResults(40);
		randomLst = query.list();
		return randomLst;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Question> randomList(String course, int max) {
		List<Question> randomLst = new ArrayList<Question>();
		Query query = getSession().createQuery(
		        "from Question where course = '"+ course+"'  order by rand()");
		query.setMaxResults(max);
		randomLst = query.list();
		return randomLst;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Question> randomListFromChapter(String course, int max,int chap) {
		List<Question> randomLst = new ArrayList<Question>();
		Query query = getSession().createQuery(
		        "from Question " + 
				"where chapter = " + chap + " and course = '"+ course + "' order by rand()");
		query.setMaxResults(max);
		randomLst = query.list();
		return randomLst;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Question> listFromCourse(String course) {
		List<Question> randomLst = new ArrayList<Question>();
		Query query = getSession().createQuery(
		        "from Question " + 
				"where course = '" + course + "'");
		randomLst = query.list();
		return randomLst;
	}

	@Override
	public void delete(int id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Question question = (Question)crit.uniqueResult();
		delete(question);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Question> list(String course) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<Question> questionList = (List<Question>) criteria.list();
		return questionList;
	}

}
