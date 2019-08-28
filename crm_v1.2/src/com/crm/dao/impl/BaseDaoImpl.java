package com.crm.dao.impl;

import com.crm.dao.BaseDao;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;


public class BaseDaoImpl<T> implements BaseDao<T> {
	private Class clazz;
	/*public BaseDaoImpl(Class clazz) {
		this.clazz = clazz;
	}*/
    @Autowired
	private HibernateTemplate hibernateTemplate;

	public BaseDaoImpl() {
	      Class clazz=this.getClass();//得到操作类
          Type type=clazz.getGenericSuperclass();//得到参数化类型
		  ParameterizedType parameter=(ParameterizedType) type;
		  Type[] types=parameter.getActualTypeArguments();//得到实际类型参数
		  this.clazz=(Class) types[0];
	}

	@Override
	public void save(T t) {
       hibernateTemplate.save(t);
	}

	@Override
	public void update(T t) {
		 hibernateTemplate.update(t);
		
	}

	@Override
	public void delete(T t) {
		 hibernateTemplate.delete(t);
		
	}

	@Override
	public List<T> findAll() {
		return (List<T>) hibernateTemplate.find("from "+clazz.getSimpleName());
	}

	@Override
	public Integer findTotalSize(DetachedCriteria detachedCriteria) {
		detachedCriteria.setProjection(Projections.rowCount());
		List<Long> list=(List<Long>) hibernateTemplate.findByCriteria(detachedCriteria);
		if (list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	@Override
	public T findById(Serializable id) {
		return (T) hibernateTemplate.get(clazz, id);
	}

	@Override
	public List<T> findByPage(DetachedCriteria detachedCriteria, Integer begin, Integer pageSize) {
		detachedCriteria.setProjection(null);
		return (List<T>)hibernateTemplate.findByCriteria(detachedCriteria, begin, pageSize);
	}


}
