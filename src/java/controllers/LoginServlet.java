/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.AdminService;
import services.EnseignantService;
import services.EtudiantService;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    HttpSession session = request.getSession();

    Object user = null;

    switch (role) {
        case "admin":
            AdminService adminService = new AdminService();
            user = adminService.findAll().stream()
                    .filter(a -> a.getEmail().equals(email) && a.getMotDePasse().equals(password))
                    .findFirst().orElse(null);
            break;

        case "enseignant":
            EnseignantService ensService = new EnseignantService();
            user = ensService.findAll().stream()
                    .filter(e -> e.getEmail().equals(email) && e.getMotDePasse().equals(password))
                    .findFirst().orElse(null);
            break;

        case "etudiant":
            EtudiantService etuService = new EtudiantService();
            user = etuService.findAll().stream()
                    .filter(e -> e.getEmail().equals(email) && e.getMotDePasse().equals(password))
                    .findFirst().orElse(null);
            break;
    }

    if (user != null) {
        session.setAttribute("user", user);
        session.setAttribute("role", role);
        switch (role) {
            case "admin": response.sendRedirect("dashboard_admin.jsp"); break;
            case "enseignant": response.sendRedirect("dashboard_enseignant.jsp"); break;
            case "etudiant": response.sendRedirect("dashboard_etudiant.jsp"); break;
        }
    } else {
        request.setAttribute("error", "Email, mot de passe ou rôle incorrect !");
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
