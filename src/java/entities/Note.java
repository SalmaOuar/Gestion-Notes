/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "note")
public class Note implements Serializable {
@EmbeddedId
    private NotePK id;

    private double note;

    private String commentaire;

    @ManyToOne
    @MapsId("etudiantId")
    @JoinColumn(name = "etudiant_id")
    private Etudiant etudiant;

    @ManyToOne
    @MapsId("matiereId")
    @JoinColumn(name = "matiere_id")
    private Matiere matiere;

    public Note() {}

    public Note(Etudiant etudiant, Matiere matiere, double note, String commentaire) {
        this.etudiant = etudiant;
        this.matiere = matiere;
        this.note = note;
        this.commentaire = commentaire;
        this.id = new NotePK(etudiant.getId(), matiere.getId());
    }

    public Note(int etudiantId, int matiereId, double note) {
    this.id = new NotePK(etudiantId, matiereId);
    this.note = note;
}
    
    

    public NotePK getId() {
        return id;
    }

    public void setId(NotePK id) {
        this.id = id;
    }

    public double getNote() {
        return note;
    }

    public void setNote(double note) {
        this.note = note;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }
}
