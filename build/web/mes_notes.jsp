
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entities.Note, services.NoteService" %>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
    if (role == null || !role.equals("etudiant")) {
        response.sendRedirect("login.jsp");
        return;
    }

    int etudiantId = ((entities.User) session.getAttribute("user")).getId();
    NoteService noteService = new NoteService();
    List<Note> notes = noteService.findByEtudiantId(etudiantId);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mes notes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fc;
                font-family: 'Segoe UI', sans-serif;
            }
            .table thead {
                background-color: #212529;
                color: white;
            }
            .illustration {
                max-width: 100%;
                height: auto;
            }
            .content-box {
                background-color: white;
                border-radius: 10px;
                padding: 30px;
                box-shadow: 0 0 15px rgba(0,0,0,0.05);
            }
        </style>
    </head>
    <body class="p-5">

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <!-- Illustration -->
                <div class="col-md-5 text-center mb-4">
                    <img src="images/Nerd.jpg" alt="Illustration" class="illustration">
                </div>

                <!-- Notes -->
                <div class="col-md-7">
                    <div class="content-box">
                        <h3 class="mb-4 text-center">📋 Mes notes</h3>
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Matière</th>
                                    <th>Note</th>
                                    <th>Commentaire</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Note n : notes) {%>
                                <tr>
                                    <td><%= n.getMatiere().getNom()%></td>
                                    <td><%= n.getNote()%></td>
                                    <td><%= n.getCommentaire() != null ? n.getCommentaire() : "-"%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                        <div class="text-center mt-4">
                            <a href="dashboard_etudiant.jsp" class="btn btn-secondary">Retour</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
