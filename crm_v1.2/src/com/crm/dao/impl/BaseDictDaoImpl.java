package com.crm.dao.impl;

import com.crm.dao.BaseDictDao;
import com.crm.entity.BaseDict;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BaseDictDaoImpl extends BaseDaoImpl<BaseDict> implements BaseDictDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Override
	public List<BaseDict> findBaseDictByTypeCode(String dict_type_code) {
		return (List<BaseDict>) hibernateTemplate.find("from BaseDict where dict_type_code = ?", dict_type_code);
	}

}
