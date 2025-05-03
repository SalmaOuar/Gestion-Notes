/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.NoteDao;
import entities.Note;
import java.util.List;

/**
 *
 * @author Yoga
 */
public class NoteService implements IService<Note> {

    private final NoteDao dao;
    private NoteDao noteDao = new NoteDao();

    public NoteService() {
        this.dao = new NoteDao();
    }

    @Override
    public boolean create(Note o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Note o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Note o) {
        return dao.update(o);
    }

    @Override
    public List<Note> findAll() {
        return dao.findAll();
    }

    @Override
    public Note findById(int id) {
        return dao.findById(id);
    }

    public Note findById(int etudiantId, int matiereId) {
        return dao.findById(etudiantId, matiereId);
    }

    public List<Note> findByEnseignantId(int enseignantId) {
        return dao.findByEnseignantId(enseignantId);
    }

    public List<Note> findByEtudiantId(int etudiantId) {
        return dao.findByEtudiantId(etudiantId);
    }

    public Note findByEtudiantAndMatiere(int etudiantId, int matiereId) {
        return noteDao.findByEtudiantAndMatiere(etudiantId, matiereId);
    }

    

}
