
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entities.Note" %>
<%@ page import="services.NoteService" %>

<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
    if (role == null || !role.equals("enseignant")) {
        response.sendRedirect("login.jsp");
        return;
    }

    int enseignantId = ((entities.User) session.getAttribute("user")).getId();
    NoteService noteService = new NoteService();
    List<Note> notes = noteService.findByEnseignantId(enseignantId);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des notes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light p-4">
        <div class="container">
            <h3 class="mb-4 text-center"><i class="fas fa-list me-2"></i>Liste des notes attribuées</h3>

            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Étudiant</th>
                        <th>Matière</th>
                        <th>Note</th>
                        <th>Commentaire</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Note n : notes) {
                            if (n.getEtudiant() != null && n.getMatiere() != null) {
                    %>
                    <tr>
                        <td><%= n.getEtudiant().getNom()%> <%= n.getEtudiant().getPrenom()%></td>
                        <td><%= n.getMatiere().getNom()%></td>
                        <td><%= n.getNote()%></td>
                        <td><%= n.getCommentaire() != null ? n.getCommentaire() : "-"%></td>
                    </tr>
                    <% }
                }%>
                </tbody>
            </table>

            <a href="dashboard_enseignant.jsp" class="btn btn-secondary mt-3">Retour</a>
        </div>
    </body>
</html>
