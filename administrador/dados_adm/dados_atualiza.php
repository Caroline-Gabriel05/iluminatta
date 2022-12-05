<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css"/>
    <link rel="stylesheet" type="text/css" href="../cabecalho/rodape.css"/>
    <link rel="stylesheet" type="text/css" href="produto.css"/>

</head>
<body>
    <?php 
        session_start();

        if(!isset ($_SESSION['id_logado']) == true){
            header ('location: ../login/index.php');
        }
        $cliente= $_SESSION['id_logado'];
        
        include_once "conecta.php"; 

        if ( isset($_POST["btn_salvar"]) )
        {
            $nome= $_POST['nome'];
            $sobrenome= $_POST['sobrenome'];
            $nasc= $_POST['nascimento'];
            $genero= $_POST['Genero'];
            $email= $_POST['email'];
            $senha= $_POST['password'];
            $cpf= $_POST['cpf'];

            $cpf = str_replace("." , "" , $cpf );
            $cpf = str_replace("-" , "" , $cpf );

            $sqldados = "UPDATE tb_cliente
                          SET NOME='$nome', SOBRENOME='$sobrenome', CPF='$cpf', GENERO='$genero', NASCIMENTO='$nasc'
                          WHERE CODIGO=$cliente";
                        
            mysqli_query($conn, $sqldados)or die( mysqli_error($conn) );
            
            $sqlusu = "UPDATE tb_usuario
                          SET  LOGINUSU='$email', SENHA='$senha' 
                          WHERE COD_CLIENTE=$cliente";

            mysqli_query($conn, $sqlusu)or die( mysqli_error($conn) );
        }
    ?>


    
<?php header("Location: dados_pessoais.php"); ?>

</body>
</html>

