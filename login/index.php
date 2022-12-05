
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="dados_pessoais.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/pag_inicial.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/rodape.css" />	
    <link rel="stylesheet" type="text/css" href="login.css" />
</head>

<body>
	<?php
        include_once "../cabecalho/index.php";
        if (isset($_SESSION["msg"]))
        {
         echo $_SESSION["msg"]; //"<script>alert('Login incorreto')</script>" 
         unset($_SESSION["msg"]);
        }

    ?>
	<div class="login">
		<form action="validate.php" method="post">
			<div class="login-box">
				<h1 class="login_tit">Login</h1>

				<div class="textbox">
					<i class="fa fa-user" aria-hidden="true"></i>
					<input type="text" placeholder="E-mail" name="E-mail" value="">
				</div>

				<div class="textbox">
					<i class="fa fa-lock" aria-hidden="true"></i>
					<input type="password" placeholder="Senha" id="password" name="senha" value="">  
					<button type="button" class="ver" onclick="mostrarSenha()"><img id="ver_img" src="../img/icone/olho.png"></button> 
				</div>

				<input class="button" type="submit"name="login" value="Entrar"> <a href="validate.php">
				<a class="cadastro" href="../cadastro_usuario/cadastro_usu.php">Não possui conta? Cadastre-se</a>	
			</div>
		</form>
	</div>
	<?php include_once "../cabecalho/rodape.html";?>
</body>
</html>

<script>
    function mostrarSenha(){
        var tipo = document.getElementById("password");
        var imagem = document.getElementById("ver_img");

        if(tipo.type == "password"){
            tipo.type = "text";
            imagem.src= "../img/icone/escondido.png";
        }else{
            tipo.type = "password";
            imagem.src= "../img/icone/olho.png";
        }
    }
</script>
