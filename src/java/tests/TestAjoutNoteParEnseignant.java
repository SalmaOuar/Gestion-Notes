/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import dao.EnseignantDao;
import dao.EtudiantDao;
import dao.MatiereDao;
import dao.NoteDao;
import entities.Enseignant;
import entities.Etudiant;
import entities.Matiere;
import entities.Note;

/**
 *
 * @author Yoga
 */
public class TestAjoutNoteParEnseignant {
     public static void main(String[] args) {
       
        EnseignantDao enseignantDao = new EnseignantDao();
        EtudiantDao etudiantDao = new EtudiantDao();
        MatiereDao matiereDao = new MatiereDao();
        NoteDao noteDao = new NoteDao();

        // 1. Création d'un enseignant
        Enseignant enseignant = new Enseignant("Rachid", "RAJI", "rachid@univ.ma", "1234");
        enseignantDao.create(enseignant);

        // 2. Création d'une matière et association à l'enseignant
        Matiere matiere = new Matiere("Base de données");
        matiere.setEnseignant(enseignant);
        matiereDao.create(matiere);

        // 3. Création d'un étudiant
        Etudiant etudiant = new Etudiant("Khadija", "SALHI", "khadija@univ.ma", "et1234");
        etudiantDao.create(etudiant);

        // 4. Vérification que l'enseignant enseigne bien la matière
        if (!matiere.getEnseignant().equals(enseignant)) {
            System.out.println("Erreur : L'enseignant n'enseigne pas cette matière !");
            return;
        }

        // 5. Création d'une note pour l'étudiant dans la matière
        Note note = new Note();
        note.setEtudiant(etudiant);
        note.setMatiere(matiere);
        note.setNote(17.0);
        note.setCommentaire("Très bon travail");
        noteDao.create(note);

        // 6. Affichage du résultat
        System.out.println(" L'enseignant '" + enseignant.getNom() + "' a bien noté l'étudiante '" 
                           + etudiant.getNom() + "' dans la matière '" + matiere.getNom() + "'");
    }
}
