<?php
session_start();
include_once("conecta2.php");
$id = $_POST['id'];

	$result_img = "DELETE FROM tb_varias_img WHERE CHAVE_IMG_PROD='$id'";
	$result_prod = "DELETE FROM tb_produto WHERE COD_PRODUTO='$id'";
	$resultado_img = mysqli_query($conn2, $result_img);
	$resultado_prod = mysqli_query($conn2, $result_prod);

	header("Location: vitrine.php")

?>