package com.crm.service.impl;

import com.crm.dao.SaleVisitDao;
import com.crm.utils.PageBean;
import com.crm.entity.SaleVisit;
import com.crm.service.SaleVisitService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class SaleVisitServiceImpl implements SaleVisitService {
	@Autowired
    private SaleVisitDao saleVisitDao;

	@Override
	public SaleVisit findById(String visit_id) {
		return saleVisitDao.findById(visit_id);
	}

	@Override
	public void delete(SaleVisit saleVisit) {
      saleVisitDao.delete(saleVisit);
	}

	@Override
	public int findCount() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(SaleVisit.class);
		return  saleVisitDao.findTotalSize(detachedCriteria);
	}

	@Override
	public PageBean<SaleVisit> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize) {
		PageBean<SaleVisit> pageBean =new PageBean<SaleVisit>();
		pageBean.setCurrPage(currPage);
		pageBean.setPageSize(pageSize);
		//System.out.println(currPage);
		//System.out.println(pageSize);
		Integer totalSize=saleVisitDao.findTotalSize(detachedCriteria);
		pageBean.setTotalSize(totalSize);
		double tDouble=totalSize;
		Double totalPages=Math.ceil(tDouble/pageSize);
		pageBean.setTotalPage(totalPages.intValue());
		Integer begin=(currPage-1)*pageSize;
		List<SaleVisit> saleVisits=saleVisitDao.findByPage(detachedCriteria, begin, pageSize);
		pageBean.setList(saleVisits);
		return pageBean;
	}

	@Override
	public void save(SaleVisit saleVisit) {
       saleVisitDao.save(saleVisit);		
	}
}
