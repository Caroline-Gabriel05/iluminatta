<?php
session_start();
include_once("conecta2.php");
$id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
if(!empty($id)){
	$result_img = "DELETE FROM tb_varias_img WHERE CHAVE_IMG_PROD='$id'";
	$result_prod = "DELETE FROM tb_produto WHERE COD_PRODUTO='$id'";
	$resultado_prod = mysqli_query($conn2, $result_img, $result_prod);
	if(mysqli_affected_rows($conn2)){
		$_SESSION['msg'] = "<p style='color:green;'>Usuário apagado com sucesso</p>";
		header("Location: vitrine.php");
	}else{
		
		$_SESSION['msg'] = "<p style='color:red;'>Erro o usuário não foi apagado com sucesso</p>";
		header("Location: index.php");
	}
}else{	
	$_SESSION['msg'] = "<p style='color:red;'>Necessário selecionar um usuário</p>";
	header("Location: index.php");
}

?>