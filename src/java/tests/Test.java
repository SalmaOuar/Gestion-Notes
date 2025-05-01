/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import dao.AdminDao;
import dao.EnseignantDao;
import dao.EtudiantDao;
import dao.MatiereDao;
import dao.NoteDao;
import entities.Admin;
import entities.Enseignant;
import entities.Etudiant;
import entities.Matiere;
import entities.Note;

/**
 *
 * @author Yoga
 */
public class Test {
    public static void main(String[] args) {
        
        AdminDao adminDao = new AdminDao();
        EnseignantDao enseignantDao = new EnseignantDao();
        EtudiantDao etudiantDao = new EtudiantDao();
        MatiereDao matiereDao = new MatiereDao();
        NoteDao noteDao = new NoteDao();

        // 1. Créer un administrateur
        Admin admin = new Admin("Admin", "Admin", "admin@univ.ma", "admin123");
        adminDao.create(admin);

        // 2. Créer un enseignant
        Enseignant enseignant = new Enseignant("Ouarrar", "Salma", "salma@univ.ma", "salma123");

        enseignantDao.create(enseignant);

        // 3. Créer un étudiant
        Etudiant etudiant = new Etudiant("Imane", "imane", "imane@univ.ma", "imane123");
        etudiantDao.create(etudiant);

        // 4. Créer une matière enseignée par l’enseignant
        Matiere matiere = new Matiere("Math");
        matiere.setEnseignant(enseignant);
        matiereDao.create(matiere);

        // 5. Créer une note pour l’étudiant dans cette matière
        Note note = new Note(etudiant, matiere, 15.75, "Bonne compréhension du cours");
        noteDao.create(note);

        
        System.out.println("✔ Admin, enseignant, étudiant, matière et note insérés avec succès !");
    }
}
