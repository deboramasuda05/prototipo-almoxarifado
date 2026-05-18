<?php

include('../View/header.php');
// Erros para o XAMPP
ini_set('display_errors', 1);
error_reporting(E_ALL);

// 1. Importa seus defines
require_once(dirname(__DIR__, 2) . DIRECTORY_SEPARATOR . 'configuration' . DIRECTORY_SEPARATOR . 'connect.php');
// 2. Importa o Controller
require_once(dirname(__DIR__, 1) . DIRECTORY_SEPARATOR . 'Controller' . DIRECTORY_SEPARATOR . 'dashboardController.php');

// 3. CRIA A CONEXÃO MANUALMENTE (Já que não tem a classe Database)
try {
    $db = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME, USER, PASSWORD);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erro ao conectar: " . $e->getMessage());
}

// 4. Passa a conexão $db para o Controller
$controller = new DashboardController($db);
$dados = $controller->index();
$diasSemana    = $dados['diasSemana'] ?? [];
$valoresSemana = $dados['valoresSemana'] ?? [];
$labelsMeses  = $dados['labelsMeses'] ?? [];
$valoresMeses = $dados['valoresMeses'] ?? [];

// 5. Extrai os dados (Certifique-se que o Controller tem o 'return')
$nomes     = $dados['nomes'] ?? [];
$valores   = $dados['valores'] ?? [];
$total     = $dados['total'] ?? 0;
$pendentes = $dados['pendentes'] ?? 0;
$aprovados = $dados['aprovados'] ?? 0;

include('../View/dashboard_view.php');

