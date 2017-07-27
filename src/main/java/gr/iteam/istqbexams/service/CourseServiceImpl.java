package gr.iteam.istqbexams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gr.iteam.istqbexams.dao.CourseDao;
import gr.iteam.istqbexams.dao.QuestionDao;
import gr.iteam.istqbexams.dao.ResultDao;
import gr.iteam.istqbexams.model.Course;

@Service("courseService")
@Transactional
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private CourseDao dao;
	
	@Autowired
	private ResultDao resultDao;
	
	@Autowired
	private QuestionDao questionDao;

	@Override
	public Course findById(int id) {
		return dao.findByCourseId(id);
	}

	@Override
	public void saveOrUpdate(Course course) {
		Course entity = null;
		if (course.getId()!=null) {
			entity = dao.findByCourseId(course.getId());
			if(entity!=null){
				entity.setId(course.getId());
				if(!course.getName().equals(entity.getName())){
					entity.setName(course.getName());
				}
			} else {
				dao.save(course);
			}
		}	else {
			dao.save(course);
		}
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

	@Override
	public List<Course> findAll() {
		return dao.list();
	}

	@Override
	public Course findByName(String name) {
		return dao.findByName(name);
	}

	@Override
	public void deleteByCourse(int courseid) {
		Course course = dao.findByCourseId(courseid);
		if (resultDao.findByCourseId(course) != null) {
			resultDao.deleteByCourse(course);
		}
		if (questionDao.findByCourse(course)!=null) {
			questionDao.deleteByCourse(course);
		}
		
		dao.delete(courseid);
	}

}
