<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
    if (role == null || !role.equals("etudiant")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Espace Étudiant</title>
        <link rel="icon" type="image/png" href="images/icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fc; font-family: 'Segoe UI', sans-serif; }
        .navbar { background-color: #5c002e; }
        .dashboard { padding: 60px 30px; }
        .card i { font-size: 2rem; color: #5c002e; }
        
       
    body {
        background-image: url('images/background.jpg'); 
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        font-family: 'Segoe UI', sans-serif;
        height: 100vh;
        margin: 0;
    }

    .navbar {
        background-color: #5c002e;
    }

    .dashboard {
        padding: 60px 30px;
        background-color: rgba(255, 255, 255, 0.85); 
        border-radius: 10px;
    }

    .card i {
        font-size: 2rem;
        color: #5c002e;
    }


    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="#"><i class="fas fa-user-graduate"></i> Étudiant</a>
    <div class="ms-auto">
        <a href="logout.jsp" class="btn btn-light btn-sm">Déconnexion</a>
    </div>
</nav>

<div class="dashboard container">
    <h2 class="text-center mb-5">Mon tableau de bord</h2>
    <div class="row g-4 justify-content-center">
        <div class="col-md-4">
            <div class="card shadow-sm p-4 text-center">
                <i class="fas fa-list-alt mb-3"></i>
                <h5>Mes notes</h5>
                <p>Consulter toutes vos notes par matière.</p>
                <a href="mes_notes.jsp" class="btn btn-outline-primary btn-sm">Voir mes notes</a>
            </div>
        </div>
    </div>
</div>
    </body>
</html>
