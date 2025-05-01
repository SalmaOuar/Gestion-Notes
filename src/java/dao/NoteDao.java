/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Note;

/**
 *
 * @author Yoga
 */
public class NoteDao extends AbstractDao<Note> {

    public NoteDao() {
        super(Note.class);
    }

}
