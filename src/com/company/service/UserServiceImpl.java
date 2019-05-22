package com.company.service;

import com.company.dao.UserDao;
import com.company.domain.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/*@Transactional(isolation= Isolation.DEFAULT,propagation= Propagation.REQUIRED)*/
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Resource(name = "userDao")
    UserDao userDao;
    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User checkUser(User user) {
        User resUser = userDao.checkUser(user.getUsername(),user.getPassword());
        return resUser;
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }
}
