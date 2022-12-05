<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="../rodape/rodape.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="../cadastro_produtos/cad_prod.css" />

</head>
<body>


    <?php
    session_start();

    if(!isset ($_SESSION['id_logado']) == true){
        header ('location: ../../login/index.php');
    }
    $cliente= $_SESSION['id_logado'];


    include_once "../cabecalho/cabecalho_adm.php";
    include_once "conecta.php";

    $query ="SELECT*FROM tb_cliente WHERE CODIGO=$cliente";
    $dados = mysqli_query( $conn, $query);
    $linha = mysqli_fetch_assoc($dados);
    ?>


    <div class="administrador">
        <div class="menu_admin">
            <div class="ola">
                <label>Olá, <?=$linha['NOME'] ?>!</label>
            </div>  
            <div class="menu_adm" style="list-style: none;">
                <a href="../dados_usu/dados_pessoais.php" id="btn-div" class="item-nav" >
                    <div class="menu_adm_ele">
                        <label class="descr-nav dad" for="tab1">Dados Pessoais</label>
                    </div>
                </a>
                <a href="../endereco/endereco.php" id="btn-div2" class="item-nav">
                    <div class="menu_adm_ele cadas" >
                        <label class="descr-nav end" for="tab2">Endereço</label>
                    </div>
                </a>
                <a href="../pedidos/pedidos.php" id="btn-div3" class="item-nav">
                    <div class="menu_adm_ele pedi">
                        <label class="descr-nav ped" for="tab3">Pedidos</label>
                    </div>
                </a>
                <a onclick="javascript: if (confirm('Você realmente deseja sair?'))location.href=<?php echo "'../sair/sair.php'"; ?>" id="btn-div4" class="item-nav">
                    <div class="menu_adm_ele">
                        <label class="descr-nav sair" for="tab4">Sair</label>
                    </div>
                </a>
            </div>
        </div>

</body>
</html>