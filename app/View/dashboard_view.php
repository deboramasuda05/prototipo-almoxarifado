<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard de Solicitações</title>
    <link rel="stylesheet" href="../../style/acessibilidade.css">
    
    <style>
        body { background-color: #f4f7f6; font-family: 'Segoe UI', sans-serif; margin: 20px; }

        /* Cabeçalho mais compacto */
        .header-dashboard { margin-bottom: 20px; border-left: 5px solid #2c3e50; padding-left: 15px; }
        .header-dashboard h1 { margin: 0; color: #2c3e50; font-size: 1.5rem; text-transform: uppercase; }

        /* Cards em uma única linha */
        .cards-container { display: flex; gap: 20px; margin-bottom: 30px; }
        .card { 
            background: #fff; border-radius: 8px; padding: 15px; flex: 1; 
            box-shadow: 0 2px 5px rgba(0,0,0,0.05); border-top: 4px solid #3498db; 
        }
        .card p { margin: 10px 0 0; font-size: 2.2rem; font-weight: bold; color: #2c3e50; }

        .card-pendente { border-top-color: #f1c40f; }
        .card-aprovado { border-top-color: #2ecc71; }
        .card-total { border-top-color: #34495e; }


        /* O SEGREDO: Grid de Gráficos */
        .charts-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); 
            gap: 20px; 
        }

        .chart-container { 
            background: #fff; padding: 40px; border-radius: 8px; 
            box-shadow: 0 2px 20px rgba(0,0,0,0.08); 
            height: 600px; /* Altura fixa para não esticar a página */
        }
        /* Garante que o canvas do gráfico use todo o espaço interno da div */
        .chart-container canvas {
            flex-grow: 1;
            width: 100% !important;
            height: 100% !important;
        }

        /* Responsividade: Se a tela for pequena (celular), empilha um no outro */
        @media (max-width: 1000px) {
            .charts-grid {
                grid-template-columns: 1fr;
        }
    }
    </style>
</head>
<body>

<header class="header-dashboard">
    <h1>Status das Solicitações</h1>
    <p>Visão geral do sistema</p>
</header>
<div class="cards-container">
    <div class="card card-pendente">
        <h4>Pendentes</h4>
        <p><?php echo $pendentes ?? 0; ?></p>
    </div>
    <div class="card card-aprovado">
        <h4>Aprovadas</h4>
        <p><?php echo $aprovados ?? 0; ?></p>
    </div>
    <div class="card card-total">
        <h4>Total</h4>
        <p><?php echo $total ?? 0; ?></p>
    </div>
</div>

<div class="charts-grid">
    <div class="chart-container">
        <h4>Distribuição por Atividade</h4>
        <canvas id="meuGrafico"></canvas>
    </div>

    <div class="chart-container">
        <h4>Últimos 7 Dias</h4>
        <canvas id="graficoSemanal"></canvas>
    </div>

    <div class="chart-container">
        <h4>Tendência (Últimos 6 Meses)</h4>
        <canvas id="graficoMensal"></canvas>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>

    //acrescimo
    const ctxSemana = document.getElementById('graficoSemanal').getContext('2d');
    new Chart(ctxSemana, {
        type: 'line',
        data: {
            labels: <?php echo json_encode($diasSemana); ?>,
            datasets: [{
                label: 'Empréstimos por dia',
                data: <?php echo json_encode($valoresSemana); ?>,
                borderColor: '#2ecc71',
                backgroundColor: 'rgba(46, 204, 113, 0.1)',
                fill: true,
                tension: 0.3, // Deixa a linha curvada
                pointRadius: 4
            }]
        },
            
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        // Adicionamos uma margem no topo para o gráfico "respirar"
                        grace: '5%', 
                        ticks: {
                            stepSize: 1,      // Força pular de 1 em 1 (1, 2, 3...)
                            precision: 0      // Sem casas decimais
                        },
                        grid: {
                            color: 'rgba(0,0,0,0.05)'
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }

                    }
            },
        }
    });
    // NOVO: Gráfico de 6 Meses
    const ctxMensal = document.getElementById('graficoMensal').getContext('2d'); // Nome diferente!
    new Chart(ctxMensal, {
        type: 'bar', // Sugiro 'bar' para diferenciar da linha de 7 dias
        data: {
            labels: <?php echo json_encode($labelsMeses); ?>,
            datasets: [{
                label: 'Empréstimos por Mês',
                data: <?php echo json_encode($valoresMeses); ?>,
                backgroundColor: '#34495e', // Cor diferente (cinza escuro)
                borderRadius: 5
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: { beginAtZero: true }
            }
        }
    });
    ////

    const ctx = document.getElementById('meuGrafico').getContext('2d');
    
    // Pegando os dados vindos do Controller (PHP -> JS)
    const labelsGrafico = <?php echo json_encode($nomes ?? []); ?>;
    const dadosGrafico = <?php echo json_encode($valores ?? []); ?>;
        new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labelsGrafico,
            datasets: [{
                label: 'Quantidade',
                data: dadosGrafico,
                backgroundColor: '#3498db',
                borderRadius: 5,
                // Ajusta a largura das barras para não ficarem "gigantes" com apenas 5 colunas
                barPercentage: 0.5, 
                categoryPercentage: 0.8
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false, // Permite controlar a altura pelo CSS do container
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        // RESOLVE O 0,5: Força a escala a pular de 1 em 1
                        stepSize: 1,
                        precision: 0 // Garante que não mostre casas decimais
                    },
                    grid: {
                        drawBorder: false,
                        color: 'rgba(0,0,0,0.05)' // Linhas de fundo bem sutis
                    }
                },
                x: {
                    grid: {
                        display: false // Remove as linhas verticais para um look mais limpo
                    }
                }
            },
            plugins: {
                legend: {
                    display: false // Se só tem um dado (Quantidade), a legenda é redundante
                }
            }
        }
    });
   
</script>

</body>
</html>
