package com.crm.service.impl;

import com.crm.dao.CustomerDao;
import com.crm.entity.Customer;
import com.crm.utils.PageBean;
import com.crm.service.CustomerService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;


    @Override
    public void save(Customer customer) {
        customerDao.save(customer);
    }

    @Override
    public PageBean<Customer> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize) {
        PageBean<Customer> pageBean = new PageBean<Customer>();
        pageBean.setCurrPage(currPage);
        pageBean.setPageSize(pageSize);
        Integer totalSize = customerDao.findTotalSize(detachedCriteria);
        pageBean.setTotalSize(totalSize);
        Double tot = totalSize.doubleValue();
        Double num = Math.ceil(tot / pageSize);
        pageBean.setTotalPage(num.intValue());
        Integer begin = (currPage - 1) * pageSize;
        List<Customer> customers = customerDao.findByPage(detachedCriteria, begin, pageSize);
        pageBean.setList(customers);
        return pageBean;
    }

    @Override
    public Customer findById(Long cust_id) {
        return customerDao.findById(cust_id);
    }

    @Override
    public void delete(Customer customer) {
        customerDao.delete(customer);
    }

    @Override
    public void update(Customer customer) {
        customerDao.update(customer);
    }

    @Override
    public List<Customer> findAll() {
        return customerDao.findAll();
    }


}
