
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
        <link rel="icon" type="image/png" href="images/icon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            h3 { color: #5c002e; }
            table { background-color: white; }
        </style>
    </head>
    <body class="bg-light p-4">
        <div class="container">
            <h3 class="mb-4"><i class="fas fa-table me-2"></i>Liste des notes attribuées</h3>

            <table class="table table-bordered table-hover table-striped shadow-sm rounded">
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
                            if (n.getEtudiant() != null && n.getMatiere() != null) {%>
                    <tr>
                        <td><%= n.getEtudiant().getNom()%> <%= n.getEtudiant().getPrenom()%></td>
                        <td><%= n.getMatiere().getNom()%></td>
                        <td><%= n.getNote()%></td>
                        <td><%= n.getCommentaire() != null ? n.getCommentaire() : "-"%></td>
                        <td>
                            <button class="btn btn-sm btn-warning btn-edit"
                                    data-etudiantid="<%= n.getEtudiant().getId()%>"
                                    data-matiereid="<%= n.getMatiere().getId()%>"
                                    data-note="<%= n.getNote()%>"
                                    data-commentaire="<%= n.getCommentaire() != null ? n.getCommentaire().replace("\"", "&quot;") : ""%>">
                                Modifier
                            </button>
                        </td>
                    </tr>
                    <% }
                        }%>
                </tbody>
            </table>

            <a href="dashboard_enseignant.jsp" class="btn btn-secondary mt-3">
                <i class="fas fa-arrow-left me-1"></i>Retour
            </a>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="UpdateNoteServlet">
                        <div class="modal-header">
                            <h5 class="modal-title">Modifier la note</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="etudiantId" id="etudiantId">
                            <input type="hidden" name="matiereId" id="matiereId">
                            <div class="mb-3">
                                <label for="note" class="form-label">Note</label>
                                <input type="number" step="0.01" min="0" max="20" name="note" id="note" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="commentaire" class="form-label">Commentaire</label>
                                <textarea name="commentaire" id="commentaire" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Enregistrer</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                    const modal = new bootstrap.Modal(document.getElementById('editModal'));
                    document.querySelectorAll('.btn-edit').forEach(btn => {
            btn.addEventListener('click', () => {
            document.getElementById('etudiantId').value = btn.dataset.etudiantid;
                    document.getElementById('matiereId').value = btn.dataset.matiereid;
                    document.getElementById('note').value = btn.dataset.note;
                    document.getElementById('commentaire').value = btn.dataset.commentaire;
                    modal.show();
            });
            });
        </script>
    </body>
</html>
