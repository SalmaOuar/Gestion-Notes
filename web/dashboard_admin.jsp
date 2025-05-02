
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Tableau de bord</title>
        <link rel="icon" type="image/png" href="images/icon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background: url('images/admin-dash.png') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Segoe UI', sans-serif;
            }
            .overlay {
                background-color: rgba(0, 0, 0, 0.6); 
                min-height: 100vh;
                padding: 60px 30px;
                color: white;
            }
            .navbar {
                background-color: #5c002e;
            }
            .navbar-brand {
                font-weight: bold;
            }
            .dashboard {
                padding: 60px 30px;
                background-color: rgba(255, 255, 255, 0.85);
                border-radius: 10px;
            }
            .card {
                transition: transform 0.3s;
            }
            .card:hover {
                transform: scale(1.02);
            }
            .card i {
                font-size: 2rem;
                color: #5c002e;
            }
        </style>
    </head>
    <body>


        <nav class="navbar navbar-expand-lg navbar-dark px-4">
            <a class="navbar-brand" href="#"><i class="fas fa-user-shield"></i> Espace Admin</a>
            <div class="ms-auto">
                <a href="logout.jsp" class="btn btn-light btn-sm">Déconnexion</a>
            </div>
        </nav>


        <div class="dashboard container">
            <h2 class="text-center mb-5">Tableau de bord Administrateur</h2>
            <div class="row g-4 justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow-sm p-4 text-center">
                        <i class="fas fa-users mb-3"></i>
                        <h5>Gérer les utilisateurs</h5>
                        <p>Ajouter, modifier ou supprimer des comptes.</p>
                        <a href="utilisateurs.jsp" class="btn btn-outline-primary btn-sm">Accéder</a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm p-4 text-center">
                        <i class="fas fa-book mb-3"></i>
                        <h5>Gérer les matières</h5>
                        <p>Ajouter et affecter des matières aux enseignants.</p>
                        <a href="matieres.jsp" class="btn btn-outline-primary btn-sm">Accéder</a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm p-4 text-center">
                        <i class="fas fa-chart-bar mb-3" style="color:#5c002e; font-size: 2rem;"></i>
                        <h5>Statistiques</h5>
                        <p>Visualiser les notes par matière (graphiques).</p>
                        <a href="statistiques.jsp" class="btn btn-outline-primary btn-sm">Voir les statistiques</a>
                    </div>
                </div>

            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
