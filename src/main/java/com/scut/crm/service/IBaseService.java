package com.scut.crm.service;

import com.scut.crm.entity.Pagination;

import java.util.List;
import java.util.Map;

public interface IBaseService<T> {
	Pagination<T> listByPage(Map<String,Object> map);

	List<T> listByForeignKey(String id);

	int getTotalRecords(String joint, Object[] params);

	T getById(Integer id);

	void update(T object);

	void remove(T object);

	int save(T object);
}
