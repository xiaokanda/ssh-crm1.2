package com.crm.service;

import com.crm.utils.PageBean;
import com.crm.entity.SaleVisit;
import org.hibernate.criterion.DetachedCriteria;


public interface SaleVisitService {

	PageBean<SaleVisit> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);

	void save(SaleVisit saleVisit);

    int findCount();

    SaleVisit findById(String visit_id);

    void delete(SaleVisit saleVisit);
}
