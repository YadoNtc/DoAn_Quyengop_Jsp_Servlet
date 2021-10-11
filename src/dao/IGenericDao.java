package dao;

import java.util.List;

import dao.mapper.IRowMapper;

public interface IGenericDao<T> {
	
	@SuppressWarnings("hiding")
	<T> List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters);
	
	Long insert(String sql, Object... parameters);
	
	void update(String sql, Object...paramters);
	
	int count(String sql, Object... parameters);
	
	void exceProcedure(String sql, Object... parameters);
}
