
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entities.Matiere" %>
<%@ page import="entities.User" %>
<%@ page import="services.MatiereService" %>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
    User enseignant = (User) session.getAttribute("user");

    if (enseignant == null || !"enseignant".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    MatiereService service = new MatiereService();
    List<Matiere> matieres = service.findByEnseignantId(enseignant.getId());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mes Matières</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body { background-color: #f8f9fc; padding: 40px; }
            h3 { color: #5c002e; }
            .table th, .table td { vertical-align: middle; }
        </style>
    </head>
    <body>
        <div class="container">
            <h3 class="mb-4"><i class="fas fa-book me-2"></i>Mes matières enseignées</h3>


            <table class="table table-bordered table-hover shadow-sm">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Nom de la matière</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (matieres != null && !matieres.isEmpty()) {
                    for (Matiere m : matieres) {%>
                    <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getNom()%></td>
                    </tr>
                    <%  }
            } else { %>
                    <tr><td colspan="2" class="text-center">Aucune matière trouvée.</td></tr>
                    <% }%>
                </tbody>
            </table>

            <a href="dashboard_enseignant.jsp" class="btn btn-secondary mt-3"><i class="fas fa-arrow-left me-1"></i> Retour</a>
            
            <div class="text-center mb-4">
                <img src="images/mes_matieres.jpg" alt="Mes matières" class="img-fluid rounded shadow" style="max-width: 400px;">
            </div>
        </div>
    </body>
</html>
