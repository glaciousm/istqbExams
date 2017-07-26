package gr.iteam.istqbexams.dao;

import java.util.List;

import gr.iteam.istqbexams.model.Result;

public interface ResultDao {

	Result findByUserId(int id);
	
	void save(Result result);
	
	List<Result> list();
	
	List<Result> listByUser(int id);
}
