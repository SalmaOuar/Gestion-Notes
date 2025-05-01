/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.EtudiantDao;
import entities.Etudiant;
import java.util.List;

/**
 *
 * @author Yoga
 */
public class EtudiantService implements IService<Etudiant> {

    private final EtudiantDao dao;

    public EtudiantService() {
        this.dao = new EtudiantDao();
    }

    @Override
    public boolean create(Etudiant o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Etudiant o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Etudiant o) {
        return dao.update(o);
    }

    @Override
    public List<Etudiant> findAll() {
        return dao.findAll();
    }

    @Override
    public Etudiant findById(int id) {
        return dao.findById(id);
    }
    
}
