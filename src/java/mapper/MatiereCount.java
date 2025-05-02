/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

/**
 *
 * @author Yoga
 */
public class MatiereCount {

    private String nomMatiere;
    private long nbNotes;

    public MatiereCount() {
    }

    public MatiereCount(String nomMatiere, long nbNotes) {
        this.nomMatiere = nomMatiere;
        this.nbNotes = nbNotes;
    }

    public String getNomMatiere() {
        return nomMatiere;
    }

    public void setNomMatiere(String nomMatiere) {
        this.nomMatiere = nomMatiere;
    }

    public long getNbNotes() {
        return nbNotes;
    }

    public void setNbNotes(long nbNotes) {
        this.nbNotes = nbNotes;
    }

}
