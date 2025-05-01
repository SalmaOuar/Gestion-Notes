/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "matieres")
public class Matiere {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nom;

    @ManyToOne
    @JoinColumn(name = "enseignant_id")

    private Enseignant enseignant;

    public Matiere() {
    }

    @OneToMany(mappedBy = "matiere", cascade = CascadeType.ALL)
    private List<Note> notes;

    public Matiere(String nom) {
        this.nom = nom;
    }

    public Matiere(int id, String nom, Enseignant enseignant, List<Note> notes) {
        this.id = id;
        this.nom = nom;
        this.enseignant = enseignant;
        this.notes = notes;
    }

    public Enseignant getEnseignant() {
        return enseignant;
    }

    public List<Note> getNotes() {
        return notes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setEnseignant(Enseignant enseignant) {
        this.enseignant = enseignant;
    }

}
