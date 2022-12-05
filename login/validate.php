<?php
 //login do usuário
 session_start(); 
 include_once "connection.php";

 $usuario=$_POST["E-mail"];
 $senha=$_POST["senha"];
 $tipo="C"; //por padrao é cliente, ~senão é ADM 

 $erro="";

 if ($usuario == "") 
 { 
	$erro .= "Digite o usuário/>";
 }

 elseif ($senha == "") 
 { 
	$erro .= "Digite a senha<br/>";
 }

 $sql3="SELECT *
	FROM tb_usuario
	WHERE LOGINUSU = '$usuario' and SENHA = '$senha' ";

 $result=mysqli_query($conn,$sql3)or die ("Impossivel verificar o cliente");
 $qtdREGISTRO = 0; // incializo
 $qtdREGISTRO = mysqli_num_rows($result);
 $linha=mysqli_fetch_assoc($result);

 if ($qtdREGISTRO > 0)
 {
	 $c = $linha["USER"];
	 //$_SESSION['c'] = $c ;

  
	  if ( $linha["USER"] == $tipo )
	  {
		
		session_start();

		$_SESSION['id_logado'] = $linha['COD_CLIENTE'];
		header ('location: ../usu_comum/dados_usu/dados_pessoais.php');
	  }
	  else
	  {
		session_start();

		$_SESSION['id_logado'] = $linha['COD_CLIENTE'];
		header ('location: ../administrador/dados_adm/dados_pessoais.php');
	  }

 

 			
} 
else{
	//$_SESSION["msg"]=true
	$_SESSION["msg"]="<script>alert('Login incorreto')</script>";
	header ('location: index.php');

}
?>
