
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="services.UserService" %>
<%@ page import="services.AdminService, services.EtudiantService, services.EnseignantService" %>
<%@ page import="entities.Admin, entities.Etudiant, entities.Enseignant" %>
<%
    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter un utilisateur</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
                font-family: 'Segoe UI', sans-serif;
            }
            .card {
                max-width: 600px;
                margin: 60px auto;
                padding: 30px;
                border: none;
                border-radius: 12px;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            }
            .btn-add {
                background-color: #198754;
                color: white;
            }
            .btn-add:hover {
                background-color: #146c43;
            }
        </style>
    </head>
    <body>

        <div class="card">
            <h3 class="text-center mb-4"><i class="fas fa-user-plus me-2"></i>Ajouter un utilisateur</h3>

            <% if (error != null) {%>
            <div class="alert alert-danger"><%= error%></div>
            <% } %>
            <% if (success != null) { %>
            <div class="alert alert-success">✅ Utilisateur ajouté avec succès !</div>
            <% }%>

            <form action="AjouterUtilisateurServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Nom :</label>
                    <input type="text" name="nom" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Prénom :</label>
                    <input type="text" name="prenom" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email :</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mot de passe :</label>
                    <input type="password" name="motDePasse" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Rôle :</label>
                    <select name="role" class="form-select" required>
                        <option value="">-- Choisir un rôle --</option>
                        <option value="admin">Admin</option>
                        <option value="enseignant">Enseignant</option>
                        <option value="etudiant">Étudiant</option>
                    </select>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-add px-4"><i class="fas fa-check-circle me-1"></i>Ajouter</button>
                    <a href="utilisateurs.jsp" class="btn btn-secondary"><i class="fas fa-times me-1"></i>Annuler</a>
                </div>
            </form>
        </div>

    </body>
</html>
