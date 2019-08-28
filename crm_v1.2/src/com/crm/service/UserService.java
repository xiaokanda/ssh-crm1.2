package com.crm.service;

import com.crm.entity.User;
import com.crm.utils.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface UserService {

	void regist(User user);

	User login(User user);

	PageBean<User> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize);

	List<User> findAll();
}
