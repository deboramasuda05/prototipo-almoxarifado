<?php

class DashboardModel {
    private $pdo;

    public function __construct($conexao) {
        $this->pdo = $conexao;
    }
    public function getSolicitacoesUltimaSemana() {
    // Busca contagem dos últimos 7 dias
    $sql = "SELECT DATE(data_inicio_emprestimo) as data, COUNT(*) as quantidade 
            FROM solicitacao 
            WHERE data_inicio_emprestimo >= DATE_SUB(CURDATE(), INTERVAL 6 DAY)
            AND status = 'Aprovada'
            GROUP BY DATE(data_inicio_emprestimo)
            ORDER BY data ASC";
    $stmt = $this->pdo->query($sql);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    // Buscar últimos 6 meses do ano
    public function getSolicitacoesUltimos6Meses() {
        $sql = "SELECT DATE_FORMAT(data_inicio_emprestimo, '%Y-%m') as mes_ano, COUNT(*) as quantidade 
            FROM solicitacao 
            WHERE data_inicio_emprestimo >= DATE_SUB(CURDATE(), INTERVAL 5 MONTH)
            AND status = 'Aprovada'
            GROUP BY mes_ano
            ORDER BY mes_ano ASC";
        $stmt = $this->pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    // Função para o Gráfico
    public function getDadosGrafico() {
        $sql = "SELECT nome_atividade AS nome, COUNT(*) as quantidade 
                FROM solicitacao 
                GROUP BY nome_atividade 
                ORDER BY quantidade DESC -- Optional: traz os 5 maiores
                LIMIT 5";
        $stmt = $this->pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Função para contar por Status (Pendentes, Aprovadas, etc)
    // Ajuste o nome da coluna 'status' se no seu banco for diferente
    public function getContagemPorStatus($status) {
        $sql = "SELECT COUNT(*) as total FROM solicitacao WHERE status = :status";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['status' => $status]);
        $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
        return $resultado['total'] ?? 0;
    }

    // Função que estava faltando e causou o erro fatal
    public function getTotal() {
        $sql = "SELECT COUNT(*) as total FROM solicitacao";
        $stmt = $this->pdo->query($sql);
        $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
        return $resultado['total'] ?? 0;
    }
}