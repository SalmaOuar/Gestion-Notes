/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.EnseignantDao;
import entities.Enseignant;
import java.util.List;

/**
 *
 * @author Yoga
 */
public class EnseignantService implements IService<Enseignant> {

    private final EnseignantDao dao;

    public EnseignantService() {
        this.dao = new EnseignantDao();
    }

    @Override
    public boolean create(Enseignant o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Enseignant o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Enseignant o) {
        return dao.update(o);
    }

    @Override
    public List<Enseignant> findAll() {
        return dao.findAll();
    }

    @Override
    public Enseignant findById(int id) {
        return dao.findById(id);
    }
}
