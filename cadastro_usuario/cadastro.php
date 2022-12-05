<?php
	
	include_once 'conecta.php';
       
   if ( isset($_POST["btn_enviar"]) )
   {
		$Nome = $_POST['Nome'];
		$Sobr = $_POST['sobr'];
		$Genero = $_POST['Genero'];
		$NASCIMENTO = $_POST['NASCIMENTO'];
		$CPF = $_POST['CPF'];
		$CEP = $_POST['CEP'];
		$cidade =$_POST['cidade'];
		$bairro =$_POST['bairro'];
		$rua =$_POST['rua'];
		$num =$_POST['numero'];
		$email = $_POST['email'];
		$password = $_POST['password'];

		$CEP = str_replace("-" , "" , $CEP );
		$CPF = str_replace("." , "" , $CPF );
		$CPF = str_replace("-" , "" , $CPF );
		
		$SQL = "INSERT INTO tb_cliente (NOME, SOBRENOME, GENERO, NASCIMENTO, CPF, CIDADE, BAIRRO, RUA, NUMERO, CEP)
		VALUES ('$Nome', '$Sobr', '$Genero', '$NASCIMENTO', '$CPF', '$cidade','$bairro', '$rua', '$num', '$CEP') ";
		$result = mysqli_query($conn, $SQL) ;

		$ult = mysqli_insert_id($conn);  

		$SQL_login= "INSERT INTO tb_usuario (COD_CLIENTE, LOGINUSU, SENHA, USER)
		VALUES ('$ult','$email', '$password', 'C') ";
		$result = mysqli_query($conn, $SQL_login) ;

		session_start();
		$_SESSION['id_logado'] = $ult;
		header ('location: ../usu_comum/dados_usu/dados_pessoais.php');


   }  
   
 
	   

?>