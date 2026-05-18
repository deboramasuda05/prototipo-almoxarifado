<?php

include(dirname(__DIR__, 1).'/Controller/solicitacaoController.php');


		$solicitacao = new solicitacaoController();
 		$solicitacao->listarSolicitacoes();	
	
	
?>