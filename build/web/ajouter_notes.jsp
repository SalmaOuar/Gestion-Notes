
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entities.Matiere, entities.Etudiant" %>
<%@ page import="services.MatiereService, services.EtudiantService" %>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
    if (role == null || !role.equals("enseignant")) {
        response.sendRedirect("login.jsp");
        return;
    }

    int enseignantId = ((entities.User) session.getAttribute("user")).getId();
    MatiereService matiereService = new MatiereService();
    List<Matiere> matieres = matiereService.findByEnseignantId(enseignantId);

    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attribuer une note</title>
        <link rel="icon" type="image/png" href="images/icon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fc;
                font-family: 'Segoe UI', sans-serif;
                padding: 50px;
            }
            h3 {
                color: #5c002e;
                margin-bottom: 30px;
            }
            .form-label {
                font-weight: 500;
            }
            .btn-primary {
                background-color: #0056b3;
                border: none;
            }
            .btn-secondary {
                background-color: #6c757d;
            }
        </style>
    </head>
    <body>
        <div class="container col-md-8 bg-white shadow-sm p-5 rounded">
            <h3><i class="fas fa-file-alt me-2"></i>Attribuer une note</h3>

            <% if ("true".equals(success)) { %>
            <div class="alert alert-success" role="alert">
                ✅ Note ajoutée avec succès !
            </div>
            <% } else if ("save".equals(error)) { %>
            <div class="alert alert-danger" role="alert">
                ❌ Échec de l’enregistrement de la note.
            </div>
            <% } else if ("exception".equals(error)) { %>
            <div class="alert alert-warning" role="alert">
                ⚠ Une erreur est survenue. Veuillez vérifier les champs.
            </div>
            <% } %>

            <form action="NoteCoursServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Matière :</label>
                    <select name="matiereId" class="form-select" required>
                        <option value="">-- Choisir une matière --</option>
                        <% for (Matiere m : matieres) {%>
                        <option value="<%= m.getId()%>"><%= m.getNom()%></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Étudiant :</label>
                    <select name="etudiantId" class="form-select" required>
                        <option value="">-- Choisir un étudiant --</option>
                        <% for (Etudiant e : new EtudiantService().findAll()) {%>
                        <option value="<%= e.getId()%>"><%= e.getNom()%> <%= e.getPrenom()%></option>
                        <% }%>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Titre :</label>
                    <input type="text" name="titre" class="form-control" placeholder="Cours" required>
                </div>

                <div class="mb-4">
                    <label class="form-label">Note :</label>
                    <input type="number" name="note" step="0.01" min="0" max="20" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-primary me-2"><i class="fas fa-check me-1"></i>Ajouter la note</button>
                <a href="dashboard_enseignant.jsp" class="btn btn-secondary">Annuler</a>
            </form>
        </div>
    </body>
</html>
