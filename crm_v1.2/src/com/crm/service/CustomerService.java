package com.crm.service;

import com.crm.entity.Customer;
import com.crm.utils.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;


public interface CustomerService {

	void save(Customer customer);

	PageBean<Customer> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);

	Customer findById(Long cust_id);

	void delete(Customer customer);

	void update(Customer customer);

	List<Customer> findAll();

}
