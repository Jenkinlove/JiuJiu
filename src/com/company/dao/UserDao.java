package com.company.dao;

import com.company.domain.User;

import java.util.List;

public interface UserDao {
    public void saveUser(User user);

    public List<User> checkUser(User user);
}
