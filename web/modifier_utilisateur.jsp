
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entities.User" %>
<%
    User user = (User) request.getAttribute("user");
    if (user == null) {
        response.sendRedirect("utilisateurs.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier utilisateur</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f6f9;
                font-family: 'Segoe UI', sans-serif;
            }
            .card {
                max-width: 600px;
                margin: 80px auto;
                padding: 30px;
                border: none;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            }
            .btn-save {
                background-color: #5c002e;
                border: none;
            }
            .btn-save:hover {
                background-color: #75063e;
            }
            .form-label {
                font-weight: 500;
            }
        </style>
    </head>
    <body>

        <div class="card">
            <h3 class="text-center mb-4"><i class="fas fa-user-edit me-2"></i>Modifier un utilisateur</h3>
            <form action="ModifierUtilisateurServlet" method="post">
                <input type="hidden" name="id" value="<%= user.getId()%>">

                <div class="mb-3">
                    <label class="form-label">Nom :</label>
                    <input type="text" name="nom" class="form-control" value="<%= user.getNom()%>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Prénom :</label>
                    <input type="text" name="prenom" class="form-control" value="<%= user.getPrenom()%>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email :</label>
                    <input type="email" name="email" class="form-control" value="<%= user.getEmail()%>" required>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-save text-white px-4"><i class="fas fa-save me-1"></i>Enregistrer</button>
                    <a href="utilisateurs.jsp" class="btn btn-secondary"><i class="fas fa-times me-1"></i>Annuler</a>
                </div>
            </form>
        </div>

    </body>
</html>
