<?php

include(dirname(__DIR__, 1).'/Controller/atividadeController.php');


	
	$atividade = new atividadeController();
	
	$atividade->listarAtividade();
		
?>