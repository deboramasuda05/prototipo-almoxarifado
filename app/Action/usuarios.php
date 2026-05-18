<?php

include(dirname(__DIR__, 1).'/Controller/usuariosController.php');
	
	
	
		$usuarios = new usuariosController();
		$usuarios->listarUsuarios();

	

	
	
	
?>