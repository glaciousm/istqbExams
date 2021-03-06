package gr.iteam.istqbexams.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import gr.iteam.istqbexams.model.Course;
import gr.iteam.istqbexams.model.Result;

@Repository("resultDao")
public class ResultDaoImpl extends AbstractDao<Integer, Result>  implements ResultDao {
	
	@SuppressWarnings("unchecked")
	@Override
	public void deleteByCourse(Course course) {		
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("course", course));
		List<Result> result = (List<Result>)crit.list();
		for (Result result2 : result) {
			delete(result2);
		}		
	}

	@Override
	public Result findByUserId(int id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("userId", id));
		Result result = (Result)crit.uniqueResult();
		return result;
	}

	@Override
	public void save(Result result) {
		persist(result);		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Result> list() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("date"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<Result> result = (List<Result>) criteria.list();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Result> listByUser(int id) {
		List<Result> list = new ArrayList<Result>();
		Query query = getSession().createQuery(
		        "from Result " + 
				"where userId = '" + id + "'");
		list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Result> listByUserAndCourse(int userId, int courseId) {
		List<Result> list = new ArrayList<Result>();
		Query query = getSession().createQuery(
		        "from Result " + 
				"where userId = '" + userId + "' and courseId = '" + courseId + "'");
		list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Result> findByCourseId(Course course) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("course", course));
		List<Result> result = (List<Result>) crit.list();
		return result;
	}

}
