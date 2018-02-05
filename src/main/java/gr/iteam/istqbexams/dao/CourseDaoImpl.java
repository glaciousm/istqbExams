package gr.iteam.istqbexams.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import gr.iteam.istqbexams.model.Course;

@Repository("courseDao")
public class CourseDaoImpl extends AbstractDao<Integer, Course>   implements CourseDao {

	@Override
	public Course findByCourseId(int id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Course course = (Course)crit.uniqueResult();
		return course;
	}

	@Override
	public void save(Course course) {
		persist(course);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Course> list() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<Course> course = (List<Course>) criteria.list();
		return course;
	}
	
	@Override
	public void delete(int id) {		
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Course courseD = (Course)crit.uniqueResult();
		delete(courseD);
	}
	
	@Override
	public void clear(int id) {		
		Query query = getSession().createQuery(
		        "delete from Question " + 
				"where courseId = '" + id + "'");
		query.executeUpdate();
	}

	@Override
	public Course findByName(String name) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("name", name));
		Course course = (Course)crit.uniqueResult();
		return course;
	}

}
