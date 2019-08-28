package com.crm.dao.impl;

import com.crm.dao.CustomerDao;
import com.crm.entity.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDaoImpl extends BaseDaoImpl<Customer> implements CustomerDao {
}
