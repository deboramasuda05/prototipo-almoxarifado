<?php

include(dirname(__DIR__, 1).'/Controller/emprestimoController.php');


	
	$emprestimo = new emprestimoController();
	
	$emprestimo->listarEmprestimo();
		
?>