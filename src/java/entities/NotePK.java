/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class NotePK implements Serializable {
     @Column(name = "etudiant_id")
    private int etudiantId;

    @Column(name = "matiere_id")
    private int matiereId;

    public NotePK() {}

    public NotePK(int etudiantId, int matiereId) {
        this.etudiantId = etudiantId;
        this.matiereId = matiereId;
    }

    public int getEtudiantId() {
        return etudiantId;
    }

    public void setEtudiantId(int etudiantId) {
        this.etudiantId = etudiantId;
    }

    public int getMatiereId() {
        return matiereId;
    }

    public void setMatiereId(int matiereId) {
        this.matiereId = matiereId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof NotePK)) return false;
        NotePK that = (NotePK) o;
        return etudiantId == that.etudiantId && matiereId == that.matiereId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(etudiantId, matiereId);
    }
}
