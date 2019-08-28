package com.crm.dao;

import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
public void save(T t);
public void update(T t);
public void delete(T t);
public List<T> findAll();
public Integer findTotalSize(DetachedCriteria detachedCriteria);
public T findById(Serializable id);
public List<T> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);
}
