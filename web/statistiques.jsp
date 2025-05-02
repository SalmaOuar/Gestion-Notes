
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistiques des notes par matière</title>
        <link rel="icon" type="image/png" href="images/icon.png">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        
    </head>
    <body style="text-align:center; padding: 2rem; background-color:#f0f2f5;">

        <h2>Nombre de notes par matière</h2>
        <canvas id="chart" width="600" height="400" style="display: block; margin: 0 auto;"></canvas>

        <script>
            fetch('StatistiqueController')
                    .then(res => res.json())
                    .then(data => {
                    const labels = data.map(item => item.nomMatiere);
                            const values = data.map(item => item.nbNotes);
                            new Chart(document.getElementById('chart'), {
                            type: 'bar',
                                    data: {
                                    labels: labels,
                                            datasets: [{
                                            label: 'Nombre de notes',
                                                    data: values,
                                                    backgroundColor: 'rgba(153, 102, 255, 0.5)',
                                                    borderColor: 'rgba(153, 102, 255, 1)',
                                                    borderWidth: 1
                                            }]
                                    },
                                    options: {
                                    responsive: true,
                                            scales: {
                                            y: {
                                            beginAtZero: true,
                                                    ticks: { stepSize: 1 }
                                            }
                                            }
                                    }
                            });
                    });
        </script>
    </body>
</html>
