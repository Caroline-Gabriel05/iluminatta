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

</head>
<body>
<?php
        session_start();

        if(!isset ($_SESSION['id_logado']) == true){
            header ('location: ../../login/index.php');
        }
        $cliente= $_SESSION['id_logado'];

    ?>
    <?php 
        include_once "conecta.php"; 

        if ( isset($_POST["btn_salvar"]) )
        {
            $cep= $_POST['CEP'];
            $cidade= $_POST['cidade'];
            $bairro= $_POST['bairro'];
            $rua= $_POST['rua'];
            $numero= $_POST['numero'];

            $cep = str_replace("-" , "" , $cep );

            $sqldados = "UPDATE tb_cliente
                          SET CEP='$cep', CIDADE='$cidade', BAIRRO='$bairro', RUA='$rua', NUMERO='$numero'
                          WHERE CODIGO=$cliente";
                        
            mysqli_query($conn, $sqldados)or die( mysqli_error($conn) );
        }
    ?>

<?php header("Location: endereco.php"); ?>

</body>
</html>

