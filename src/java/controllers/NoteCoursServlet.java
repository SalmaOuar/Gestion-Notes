/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Etudiant;
import entities.Matiere;
import entities.Note;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.EtudiantService;
import services.MatiereService;
import services.NoteService;

/**
 *
 * @author Yoga
 */
public class NoteCoursServlet extends HttpServlet {

    private final NoteService noteService = new NoteService();
    private final MatiereService matiereService = new MatiereService();
    private final EtudiantService etudiantService = new EtudiantService();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NoteCoursServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NoteCoursServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            int etudiantId = Integer.parseInt(request.getParameter("etudiantId"));
            int matiereId = Integer.parseInt(request.getParameter("matiereId"));
            double valeur = Double.parseDouble(request.getParameter("note"));


            Etudiant etudiant = etudiantService.findById(etudiantId);
            Matiere matiere = matiereService.findById(matiereId);

            Note note = new Note(etudiant, matiere, valeur ,""); // commentaire vide

            boolean success = noteService.create(note);

            if (success) {
                response.sendRedirect("ajouter_notes.jsp?success=true");
            } else {
                response.sendRedirect("ajouter_notes.jsp?error=save");
            }

        } catch (NumberFormatException | IOException e) {
            response.sendRedirect("ajouter_notes.jsp?error=exception");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
