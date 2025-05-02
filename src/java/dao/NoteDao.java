/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Note;
import entities.NotePK;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Yoga
 */
public class NoteDao extends AbstractDao<Note> {

    public NoteDao() {
        super(Note.class);
    }

    public Note findById(int etudiantId, int matiereId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Note note = null;
        try {
            NotePK id = new NotePK(etudiantId, matiereId);
            note = (Note) session.get(Note.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return note;
    }

    public List<Note> findByEnseignantId(int enseignantId) {
        Session session = null;
        List<Note> notes = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "SELECT n FROM Note n JOIN FETCH n.etudiant e JOIN FETCH n.matiere m WHERE m.enseignant.id = :id";
            notes = session.createQuery(hql)
                    .setParameter("id", enseignantId)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return notes;
    }

    public List<Note> findByEtudiantId(int etudiantId) {
        List<Note> notes = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Note WHERE etudiant.id = :id";
            notes = session.createQuery(hql).setParameter("id", etudiantId).list();
        } finally {
            session.close();
        }
        return notes;
    }

}
