package com.company.dao;

import com.company.domain.User;

import java.util.List;

public interface UserDao {
    public void saveUser(User user);

    public User checkUser(String username,String password);

    void updateUser(User user);
}
