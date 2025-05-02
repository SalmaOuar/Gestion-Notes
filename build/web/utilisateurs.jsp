
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entities.User" %>
<%@ page import="services.UserService" %>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserService service = new UserService();
    List<User> utilisateurs = service.findAll();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion des utilisateurs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
                font-family: 'Segoe UI', sans-serif;
            }
            .header {
                background-color: #5c002e;
                padding: 15px 30px;
                color: white;
            }
            .btn-add {
                background-color: #5c002e;
                border: none;
            }
            .btn-add:hover {
                background-color: #7a083f;
            }
            .table th {
                background-color: #e9ecef;
            }
        </style>
    </head>
    <body>

        <!-- Header -->
        <div class="header d-flex justify-content-between align-items-center">
            <h3><i class="fas fa-users"></i> Gestion des utilisateurs</h3>
            <a href="dashboard_admin.jsp" class="btn btn-light btn-sm">← Retour au dashboard</a>
        </div>

        <div class="container mt-4">
            <div class="d-flex justify-content-between mb-3">
                <h4>Liste des utilisateurs</h4>
                <a href="ajouter_utilisateur.jsp" class="btn btn-add text-white">
                    <i class="fas fa-user-plus"></i> Ajouter un utilisateur
                </a>
            </div>

            <table class="table table-bordered table-hover shadow-sm">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Email</th>
                        <th>Rôle</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (User u : utilisateurs) {%>
                    <tr>
                        <td><%= u.getId()%></td>
                        <td><%= u.getNom()%></td>
                        <td><%= u.getPrenom()%></td>
                        <td><%= u.getEmail()%></td>
                        <td><span class="badge bg-secondary"><%= u.getClass().getSimpleName()%></span></td>
                        <td class="text-center">
                            <a href="ModifierUtilisateurServlet?id=<%= u.getId()%>" class="btn btn-sm btn-outline-primary me-1">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="SupprimerUtilisateurServlet?id=<%= u.getId()%>" class="btn btn-sm btn-outline-danger"
                               onclick="return confirm('Confirmer la suppression ?');">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>

    </body>
</html>
