package com.crm.dao.impl;

import com.crm.dao.UserDao;
import com.crm.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public void regist(User user) {
        hibernateTemplate.save(user);
    }

    @Override
    public User login(User user) {
        List<User> users = (List<User>) hibernateTemplate.find("from User where user_code = ? and user_password =?", user.getUser_code(), user.getUser_password());
        if (users.size() > 0) {
            return users.get(0);
        }
        return null;
    }

}
