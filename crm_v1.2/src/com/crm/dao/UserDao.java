package com.crm.dao;

import com.crm.entity.User;

public interface UserDao extends BaseDao<User>{

	void regist(User user);

	User login(User user);

}
