
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entities.Matiere" %>
<%@ page import="services.MatiereService" %>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    MatiereService service = new MatiereService();
    List<Matiere> matieres = service.findAll();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion des Matières</title>
        <link rel="icon" type="image/png" href="images/icon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
                padding: 40px;
            }
            h3 {
                color: #5c002e;
            }
            .btn-primary {
                background-color: #0069d9;
            }
            .btn-success {
                background-color: #28a745;
            }
            .btn-danger {
                background-color: #dc3545;
            }
            .btn-secondary {
                background-color: #6c757d;
            }
            .table th, .table td {
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h3 class="mb-4 text-center"><i class="fas fa-book me-2"></i>Gestion des matières</h3>
            <div class="mb-3 text-end">
                <a href="ajouter_matiere.jsp" class="btn btn-success">
                    <i class="fas fa-plus-circle me-1"></i>Ajouter une matière
                </a>
            </div>

            <table class="table table-bordered table-hover shadow-sm">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Nom de la matière</th>
                        <th>Enseignant</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Matiere m : matieres) {%>
                    <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getNom()%></td>
                        <td><%= m.getEnseignant() != null ? m.getEnseignant().getNom() + " " + m.getEnseignant().getPrenom() : "-"%></td>
                        <td class="text-center">
                            <a href="MatiereServlet?action=edit&id=<%= m.getId()%>" class="btn btn-sm btn-primary">

                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="MatiereServlet?action=delete&id=<%= m.getId()%>" class="btn btn-sm btn-danger" onclick="return confirm('Confirmer la suppression ?');">

                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>

            <a href="dashboard_admin.jsp" class="btn btn-secondary mt-3"><i class="fas fa-arrow-left me-1"></i>Retour</a>
        </div>
    </body>
</html>
