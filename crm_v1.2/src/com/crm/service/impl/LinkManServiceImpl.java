package com.crm.service.impl;

import com.crm.dao.LinkManDao;
import com.crm.entity.LinkMan;
import com.crm.utils.PageBean;
import com.crm.service.LinkManService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class LinkManServiceImpl implements LinkManService {
	@Override
	public int findCount() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(LinkMan.class);
		return linkManDao.findTotalSize(detachedCriteria);
	}

	@Autowired
    private LinkManDao linkManDao;

	@Override
	public PageBean<LinkMan> findAll(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize) {
		PageBean<LinkMan> pageBean =new PageBean<LinkMan>();
		pageBean.setCurrPage(currPage);
		pageBean.setPageSize(pageSize);
		Integer totalSize=linkManDao.findTotalSize(detachedCriteria);
		pageBean.setTotalSize(totalSize);
		Double aDouble=Math.ceil((totalSize.doubleValue())/pageSize);
		pageBean.setTotalPage(aDouble.intValue());
		Integer begin=(currPage-1)*pageSize;
		List<LinkMan> linkMans=linkManDao.findByPage(detachedCriteria,begin,pageSize);
		pageBean.setList(linkMans);
		return pageBean;
	}

	@Override
	public void save(LinkMan linkMan) {
	linkManDao.save(linkMan);
	}

	@Override
	public LinkMan findById(Long lkm_id) {
		return linkManDao.findById(lkm_id);
	}

	@Override
	public void update(LinkMan linkMan) {
		linkManDao.update(linkMan);
	}

	@Override
	public void delete(LinkMan linkMan) {
		linkManDao.delete(linkMan);
	}
}
