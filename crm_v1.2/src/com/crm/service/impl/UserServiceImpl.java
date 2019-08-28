package com.crm.service.impl;

import com.crm.dao.UserDao;
import com.crm.entity.User;
import com.crm.service.UserService;
import com.crm.utils.MD5Utils;
import com.crm.utils.PageBean;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Autowired
    private UserDao userDao;

    @Override
    public PageBean<User> findByPage(DetachedCriteria detachedCriteria, Integer currPage, Integer pageSize) {
        PageBean<User> pageBean = new PageBean<User>();
        pageBean.setCurrPage(currPage);
        pageBean.setPageSize(pageSize);
        Integer totalSize = userDao.findTotalSize(detachedCriteria);
        pageBean.setTotalSize(totalSize);
        Double tot = totalSize.doubleValue();
        Double num = Math.ceil(tot / pageSize);
        pageBean.setTotalPage(num.intValue());
        Integer begin = (currPage - 1) * pageSize;
        List<User> users = userDao.findByPage(detachedCriteria, begin, pageSize);
        pageBean.setList(users);
        return pageBean;
    }

    @Override
    public void regist(User user) {
        user.setUser_password(MD5Utils.md5(user.getUser_password()));
        user.setUser_state("1");
        userDao.regist(user);
    }


    @Override
    public User login(User user) {
        user.setUser_password(MD5Utils.md5(user.getUser_password()));
        return userDao.login(user);
    }


}
