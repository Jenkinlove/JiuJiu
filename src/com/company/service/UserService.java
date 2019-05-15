package com.company.service;

import com.company.domain.User;

import java.util.List;

public interface UserService {
    public void saveUser(User user);

    public List<User> checkUser(User user) throws Exception;
}
