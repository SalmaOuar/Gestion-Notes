/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;
import entities.Admin;
import entities.Enseignant;
import entities.Etudiant;
import services.AdminService;
import services.EnseignantService;
import services.EtudiantService;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yoga
 */
//@WebServlet("/AjouterUtilisateurServlet")
public class AjouterUtilisateurServlet extends HttpServlet {

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
            out.println("<title>Servlet AjouterUtilisateurServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AjouterUtilisateurServlet at " + request.getContextPath() + "</h1>");
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
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        String role = request.getParameter("role");

        boolean success = false;

        switch (role) {
            case "admin":
                success = new AdminService().create(new Admin(nom, prenom, email, motDePasse));
                break;
            case "enseignant":
                success = new EnseignantService().create(new Enseignant(nom, prenom, email, motDePasse));
                break;
            case "etudiant":
                success = new EtudiantService().create(new Etudiant(nom, prenom, email, motDePasse));
                break;
        }

        if (success) {
            response.sendRedirect("ajouter_utilisateur.jsp?success=true");
        } else {
            response.sendRedirect("ajouter_utilisateur.jsp?error=Échec de l’ajout !");
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
