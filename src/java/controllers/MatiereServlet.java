/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Enseignant;
import entities.Matiere;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.EnseignantService;
import services.MatiereService;

/**
 *
 * @author Yoga
 */
@WebServlet(name = "MatiereServlet", urlPatterns = {"/MatiereServlet"})
public class MatiereServlet extends HttpServlet {

    private final MatiereService matiereService = new MatiereService();
    private final EnseignantService enseignantService = new EnseignantService();

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
            out.println("<title>Servlet MatiereServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MatiereServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        String idStr = request.getParameter("id");

        if (action != null && action.equals("edit") && idStr != null) {
            int id = Integer.parseInt(idStr);
            Matiere matiere = matiereService.findById(id);
            request.setAttribute("matiere", matiere);
            request.setAttribute("enseignants", enseignantService.findAll());
            request.getRequestDispatcher("modifier_matiere.jsp").forward(request, response);
            return;
        }

        if (action != null && action.equals("delete") && idStr != null) {
            int id = Integer.parseInt(idStr);
            Matiere m = matiereService.findById(id);
            matiereService.delete(m);
            response.sendRedirect("matieres.jsp");
            return;
        }

        response.sendRedirect("matieres.jsp");
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
        String idStr = request.getParameter("id");
        String nom = request.getParameter("nom");
        String enseignantIdStr = request.getParameter("enseignantId");

        Enseignant enseignant = null;
        if (enseignantIdStr != null && !enseignantIdStr.isEmpty()) {
            int ensId = Integer.parseInt(enseignantIdStr);
            enseignant = enseignantService.findById(ensId);
        }

        if (idStr == null || idStr.isEmpty()) {
            // Ajout
            Matiere m = new Matiere(nom);
            m.setEnseignant(enseignant);
            matiereService.create(m);
        } else {
            // Modification
            int id = Integer.parseInt(idStr);
            Matiere m = matiereService.findById(id);
            m.setNom(nom);
            m.setEnseignant(enseignant);
            matiereService.update(m);
        }

        response.sendRedirect("matieres.jsp");
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
