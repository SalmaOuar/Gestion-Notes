
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entities.Matiere" %>
<%@ page import="entities.Enseignant" %>
<%@ page import="java.util.List" %>
<%
    Matiere matiere = (Matiere) request.getAttribute("matiere");
    List<Enseignant> enseignants = (List<Enseignant>) request.getAttribute("enseignants");
    if (matiere == null) {
        response.sendRedirect("matieres.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier une matière</title>
        <link rel="icon" type="image/png" href="images/icon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
                padding: 40px;
            }
            .btn-primary {
                background-color: #5c002e;
                border: none;
            }
            .btn-primary:hover {
                background-color: #75063e;
            }
        </style>
    </head>
    <body>
        <h3 class="mb-4"><i class="fas fa-edit me-2"></i>Modifier la matière</h3>
        <form action="MatiereServlet" method="post">
            <input type="hidden" name="id" value="<%= matiere.getId()%>">
            <div class="mb-3">
                <label class="form-label">Nom :</label>
                <input type="text" name="nom" class="form-control" value="<%= matiere.getNom()%>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Enseignant :</label>
                <select name="enseignantId" class="form-select">
                    <option value="">-- Aucun enseignant --</option>
                    <% for (Enseignant e : enseignants) {%>
                    <option value="<%= e.getId()%>" <%= matiere.getEnseignant() != null && e.getId() == matiere.getEnseignant().getId() ? "selected" : ""%>>
                        <%= e.getNom()%> <%= e.getPrenom()%>
                    </option>
                    <% }%>
                </select>
            </div>
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary">Modifier</button>
                <a href="matieres.jsp" class="btn btn-secondary">Annuler</a>
            </div>
        </form>
    </body>
</html>
