package com.company.service;

import com.company.domain.User;

import java.util.List;

public interface UserService {
    public void saveUser(User user);

    public User checkUser(User user);

    void updateUser(User user);
}
