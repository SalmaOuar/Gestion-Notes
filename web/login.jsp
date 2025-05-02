
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connexion - GestionNotes</title>
        <link rel="icon" type="image/png" href="images/icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #4facfe, #660033);
            font-family: 'Segoe UI', sans-serif;
        }
        .login-box {
            max-width: 450px;
            margin: 80px auto;
            padding: 40px;
            border-radius: 12px;
            background-color: white;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
            color: #5c002e;
        }
        .btn-primary {
            background-color: #5c002e;
            border: none;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2><i class="fas fa-sign-in-alt"></i> Connexion</h2>
    
    <% if (error != null) { %>
        <div class="alert alert-danger text-center"><%= error %></div>
    <% } %>

    <form action="LoginServlet" method="post">
        <div class="form-group mb-3">
            <label>Email :</label>
            <input type="email" name="email" class="form-control" required>
        </div>
        <div class="form-group mb-3">
            <label>Mot de passe :</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <div class="form-group mb-4">
            <label>Rôle :</label>
            <select name="role" class="form-select" required>
                <option value="">-- Choisir un rôle --</option>
                <option value="admin">Admin</option>
                <option value="enseignant">Enseignant</option>
                <option value="etudiant">Étudiant</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary w-100">Se connecter</button>
    </form>
</div>
    </body>
</html>
