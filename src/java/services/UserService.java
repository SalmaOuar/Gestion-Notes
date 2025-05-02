/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.UserDao;
import entities.User;
import java.util.List;

public class UserService implements IService<User> {

    private final UserDao dao;

    public UserService() {
        this.dao = new UserDao();
    }

    @Override
    public boolean create(User o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(User o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(User o) {
        return dao.update(o);
    }

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public User findById(int id) {
        return dao.findById(id);
    }
}
