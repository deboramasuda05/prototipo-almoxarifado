<?php

include(dirname(__DIR__, 1).'/Controller/equipamentoController.php');


	$pesquisa = isset($_POST['pesquisa']) ? $_POST['pesquisa'] : '';
		
	$equipamentos = new equipamentoController();

	$equipamentos->listarEquipamentos($pesquisa);
?>