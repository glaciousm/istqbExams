package gr.iteam.istqbexams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gr.iteam.istqbexams.dao.ResultDao;
import gr.iteam.istqbexams.model.Result;

@Service("resultService")
@Transactional
public class ResultServiceImpl implements ResultService {
	
	@Autowired
	ResultDao resultDao;

	@Override
	public Result findByUserId(int id) {
		return resultDao.findByUserId(id);
	}

	@Override
	public void save(Result result) {
		resultDao.save(result);
	}

	@Override
	public List<Result> list() {
		return resultDao.list();
	}

	@Override
	public List<Result> listByUser(int id) {
		return resultDao.listByUser(id);
	}

}
