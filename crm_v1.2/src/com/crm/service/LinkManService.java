package com.crm.service;

import com.crm.entity.LinkMan;
import com.crm.utils.PageBean;
import org.hibernate.criterion.DetachedCriteria;


public interface LinkManService {

	PageBean<LinkMan> findAll(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);

	void save(LinkMan linkMan);

	LinkMan findById(Long lkm_id);

	void update(LinkMan linkMan);

	void delete(LinkMan linkMan);

	int findCount();
}
