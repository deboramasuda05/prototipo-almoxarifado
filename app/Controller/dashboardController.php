<?php
require_once dirname(__DIR__) . '/Model/dashboardModel.php';

class DashboardController {
    private $conexaoBanco;

    public function __construct($db) {
        $this->conexaoBanco = $db;
    }

    public function index() {
        $model = new DashboardModel($this->conexaoBanco);
        
        // --- 1. LÓGICA DOS CARDS E GRÁFICO DE BARRAS (EXISTENTE) ---
        $dadosBrutos = $model->getDadosGrafico();
        $pendentes = $model->getContagemPorStatus('Pendente'); 
        $aprovados = $model->getContagemPorStatus('Aprovada');
        $total = $model->getTotal(); 

        // Ordenar e preparar dados do gráfico de barras
        usort($dadosBrutos, function($a, $b) {
            return $b['quantidade'] <=> $a['quantidade'];
        });

        $nomes = [];
        $valores = [];
        foreach ($dadosBrutos as $linha) {
            $nomes[] = $linha['nome']; 
            $valores[] = $linha['quantidade'];
        }

        // --- 2. NOVA LÓGICA: GRÁFICO SEMANAL (ADICIONADA) ---
        $dadosSemanaBrutos = $model->getSolicitacoesUltimaSemana();
    
        // Mapeia os dados vindos do banco para facilitar o acesso por data
        $mapeado = [];
        foreach ($dadosSemanaBrutos as $linha) {
            $mapeado[$linha['data']] = $linha['quantidade'];
        }

        $diasSemana = [];
        $valoresSemana = [];

        // Preenche os últimos 7 dias (garante o "0" onde não há dados)
        for ($i = 6; $i >= 0; $i--) {
            $dataKey = date('Y-m-d', strtotime("-$i days")); // Gera: 2026-04-20
            $labelExibicao = date('d/m', strtotime($dataKey));
    
            $diasSemana[] = $labelExibicao;
            // O mapeado deve ter a chave '2026-04-20' exatamente assim
            $valoresSemana[] = isset($mapeado[$dataKey]) ? (int)$mapeado[$dataKey] : 0;
        }
        // LÓGICA DOS 6 MESES
        $dadosMesesBrutos = $model->getSolicitacoesUltimos6Meses();
        $mapeadoMeses = [];
        foreach ($dadosMesesBrutos as $linha) {
            $mapeadoMeses[$linha['mes_ano']] = $linha['quantidade'];
        }

        $labelsMeses = [];
        $valoresMeses = [];
        $mesesNomes = [
            1 => 'Jan', 2 => 'Fev', 3 => 'Mar', 4 => 'Abr', 5 => 'Mai', 6 => 'Jun',
            7 => 'Jul', 8 => 'Ago', 9 => 'Set', 10 => 'Out', 11 => 'Nov', 12 => 'Dez'
        ];

        for ($i = 5; $i >= 0; $i--) {
            $data = new DateTime("first day of -$i month");
            $chave = $data->format('Y-m'); // Ex: 2024-01
            $mesNumero = (int)$data->format('n');
        
            $labelsMeses[] = $mesesNomes[$mesNumero];
            $valoresMeses[] = $mapeadoMeses[$chave] ?? 0;
        }

 
        // --- 3. RETORNO ÚNICO COM TODOS OS DADOS ---
        return [
            'nomes'         => $nomes,
            'valores'       => $valores,
            'total'         => $total,
            'pendentes'     => $pendentes,
            'aprovados'     => $aprovados,
            'diasSemana'    => $diasSemana,   
            'valoresSemana' => $valoresSemana,
            'labelsMeses'   => $labelsMeses,
            'valoresMeses'  => $valoresMeses
        ];
    }
}