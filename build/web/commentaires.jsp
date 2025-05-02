
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
        <title>Commentaire sur la note</title>
        <link rel="icon" type="image/png" href="images/icon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        h3 {
            color: #5c002e;
        }
    </style>
</head>
<body class="bg-light p-4">
    <div class="container">
        <h3 class="mb-4"><i class="fas fa-comments me-2"></i>Commentaires sur les notes</h3>

        <table class="table table-bordered table-striped table-hover shadow-sm rounded bg-white">
            <thead class="table-dark">
                <tr>
                    <th>Étudiant</th>
                    <th>Matière</th>
                    <th>Note</th>
                    <th>Commentaire</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Note n : notes) {
                    if (n.getEtudiant() != null && n.getMatiere() != null) {
                %>
                <tr>
                    <td><%= n.getEtudiant().getNom() %> <%= n.getEtudiant().getPrenom() %></td>
                    <td><%= n.getMatiere().getNom() %></td>
                    <td><%= n.getNote() %></td>
                    <td><%= n.getCommentaire() != null ? n.getCommentaire() : "-" %></td>
                    <td>
                        <button class="btn btn-outline-primary btn-sm btn-commenter"
                                data-etudiant="<%= n.getEtudiant().getId() %>"
                                data-matiere="<%= n.getMatiere().getId() %>"
                                data-commentaire="<%= n.getCommentaire() != null ? n.getCommentaire().replace("\"", "&quot;") : "" %>">
                            <i class="fas fa-pen"></i> Commenter
                        </button>
                    </td>
                </tr>
                <% } } %>
            </tbody>
        </table>

        <a href="dashboard_enseignant.jsp" class="btn btn-outline-secondary mt-3">
            <i class="fas fa-arrow-left me-1"></i> Retour
        </a>
    </div>

    <!-- Modal Bootstrap -->
    <div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="commentForm">
                    <div class="modal-header">
                        <h5 class="modal-title">Ajouter un commentaire</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
                    </div>
                    <div class="modal-body">
                        <textarea name="commentaire" class="form-control" rows="3" required></textarea>
                        <input type="hidden" name="etudiantId">
                        <input type="hidden" name="matiereId">
                        <div id="msgSuccess" class="text-success mt-2" style="display:none;">
                            ✅ Commentaire enregistré
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Enregistrer</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const modal = new bootstrap.Modal(document.getElementById('commentModal'));
        $('.btn-commenter').click(function () {
            const etudiantId = $(this).data('etudiant');
            const matiereId = $(this).data('matiere');
            const commentaire = $(this).data('commentaire');
            $("#commentForm textarea[name='commentaire']").val(commentaire);
            $("#commentForm input[name='etudiantId']").val(etudiantId);
            $("#commentForm input[name='matiereId']").val(matiereId);
            $('#msgSuccess').hide();
            modal.show();
        });

        $('#commentForm').submit(function (e) {
            e.preventDefault();
            $.post('UpdateCommentaireServlet', $(this).serialize(), function () {
                $('#msgSuccess').fadeIn();
                setTimeout(() => {
                    modal.hide();
                    location.reload();
                }, 1500);
            });
        });
    </script>
    </body>
</html>
