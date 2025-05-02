/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Matiere;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Yoga
 */
public class MatiereDao extends AbstractDao<Matiere> {

    public MatiereDao() {
        super(Matiere.class);
    }

    public List<Matiere> findByEnseignantId(int enseignantId) {
        Session session = null;
        Transaction tx = null;
        List<Matiere> list = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            Query query = session.createQuery("FROM Matiere WHERE enseignant.id = :id");
            query.setParameter("id", enseignantId);
            list = query.list();

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return list;
    }
}
