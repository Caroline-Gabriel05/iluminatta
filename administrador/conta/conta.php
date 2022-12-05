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
    <link rel="stylesheet" type="text/css" href="conta.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="../cadastro_produtos/cad_prod.css" />

</head>
<body>



<div class="administrador">
        <div class="menu_admin">
            <div class="ola">
                <label>Olá, administrador!</label>
            </div>  
            <div class="menu_adm" style="list-style: none;">
                <a href="../dados_adm/dados_pessoais.php" id="btn-div" class="item-nav" >
                    <div class="menu_adm_ele">
                        <label class="descr-nav dad" for="tab1">Dados Pessoais</label>
                    </div>
                </a>
                <a href="../cadastro_produtos/cadastro_pro.php" id="btn-div2" class="item-nav">
                    <div class="menu_adm_ele cadas" >
                        <label class="descr-nav cad" for="tab2">Cadastro de Produto</label>
                    </div>
                </a>
                <a href="../produtos/vitrine.php" id="btn-div3" class="item-nav">
                    <div class="menu_adm_ele pedi">
                        <label class="descr-nav prod" for="tab3">Produtos</label>
                    </div>
                </a>
                <a href="../historico/historico.php" id="btn-div3" class="item-nav">
                    <div class="menu_adm_ele pedi">
                        <label class="descr-nav ped" for="tab3">Pedidos</label>
                    </div>
                </a>
                <a href="../estoque/estoque.php" id="btn-div3" class="item-nav">
                    <div class="menu_adm_ele pedi">
                        <label class="descr-nav est" for="tab3">Estoque</label>
                    </div>
                </a>
                <a href="../relatorio/relatorio.php" id="btn-div3" class="item-nav">
                    <div class="menu_adm_ele pedi">
                        <label class="descr-nav rel" for="tab3">Relatório de venda</label>
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