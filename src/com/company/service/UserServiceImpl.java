package com.company.service;

import com.company.dao.UserDao;
import com.company.domain.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource(name = "userDao")
    UserDao userDao;

    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public List<User> checkUser(User user) throws Exception {
        List<User> users = userDao.checkUser(user);
        if(users.size()!=0){
            return users;
        }else {
            throw new Exception("�û������������");
        }
    }
}
