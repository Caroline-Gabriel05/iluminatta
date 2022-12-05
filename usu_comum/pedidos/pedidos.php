<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="pedidos.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="../conta/conta.css" />
    <link rel="stylesheet" type="text/css" href="conta.css" />

</head>
<body>
    <?php
        include_once "../conta/conta.php";

        if(!isset ($_SESSION['id_logado']) == true){
            header ('location: ../../login/index.php');
        }
        $cliente= $_SESSION['id_logado'];

    ?>
    <!-- ------------menu------------- -->
    <?php
        include_once "../cabecalho/cabecalho_adm.php";
    ?>

    <!-- ------------menu adm------------- -->
    <?php

        include_once "conecta.php";
        $query ="SELECT*FROM tb_carrinho WHERE COD_CLIENTE=$cliente ORDER BY CODIGO DESC";
        $dados = mysqli_query( $conn, $query);
        $qtdREGISTRO = mysqli_num_rows($dados);?>
        <div class="pedidos">
            <h3>Pedidos</h3>
            <div class="mostra_pedidos">
<?php
                if ($qtdREGISTRO == 0){ ?>
                    <p class="sem_pedidos">Você ainda não realizou nenhuma compra.</p>
<?php          }

                else{
                    while($linha = mysqli_fetch_assoc($dados)){
                        
                        $cod = $linha['CODIGO'];
                        
                        $query_item ="SELECT*FROM tb_item_carrinho WHERE CODIGO_CARRINHO= $cod";
                        $dados_item = mysqli_query( $conn, $query_item);
                       echo " <a class='link_pedidos' href='dados_ped.php?cod_comp=$cod'>"; ?>
                            <div class="pedido"><?php
                            if($linha['STATU']=='ENVIADO'){?>
                                            <form action="entrega.php" method="POST"  class="form_chg">
                                                <button class="entregado" onclick="javascript: if (confirm('Seu pedido foi entregue?'))location.href=entrega.php" name="enviado" value="<?=$cod?>"><img src="../../img/icone/verificado.png" class="envio"></button>
                                            </form>
                                            <?php } 
                                while ($linha_item = mysqli_fetch_assoc($dados_item)){
                                    
                                    $prod=$linha_item['COD_ITEM'];    
                            
                                    $query_prod ="SELECT*FROM tb_produto WHERE COD_PRODUTO= $prod";
                                    $dados_prod = mysqli_query( $conn, $query_prod);
                                    $linha_prod = mysqli_fetch_assoc($dados_prod);
                            
                                    $query_img ="SELECT*FROM tb_varias_img WHERE CHAVE_IMG_PROD= $prod ";
                                    $dados_img = mysqli_query( $conn, $query_img);
                                    $linha_img = mysqli_fetch_assoc($dados_img);

                                    $preco = str_replace("," , "" , $linha_prod['PRECO'] );
                                    $PRECO = substr_replace($preco, '.', -2, 0);


                                    $sub = $PRECO * $linha_item['QUANT_ITEM'];
                                    $sub= number_format($sub,2,",",".");
                                    
                                    
                                    $PRECO= number_format($PRECO,2,",",".");


                                    echo " <a class='link_pedidos' href='../../produto/produto.php?cod=$prod'>"; ?>
                                        <div class="produto">

                                            <div class="imga"><img src="../../<?=$linha_img['CAMINHO_IMG'] ?>" class="prod_img"></div>
                                            <p class="nome_prod"><?=$linha_prod['NOME'] ?></p>
                                            <p class="preco_prod">R$ <?=$PRECO?></p></br>
                                            <p class="quant">Quantidade: <?=$linha_item['QUANT_ITEM'] ?></p>
                                            <p class="preco">Subtotal </p>
                                            <p class="preco_2">R$ <?=$sub ?></p>
                                        </div>
                                        <hr class="lih" size="1px" width="94%" color="grey"/>
                                    </a>
                                    <?php 
                                } 
                                
                                $TOTAL= str_replace("," , "" , $linha['VALOR_TOTAL'] );
                                $TOTAL= substr_replace($TOTAL, '.', -2, 0);
                                

                                $data = $linha['DATA_PEDIDO'];
                                $qtdDias = 7;
                                $resultado = date('d/m/Y', strtotime("+{$qtdDias} days",strtotime($data)));

                                $dt_atual= date("Y-m-d");
                                ?>

                    
                                <div class="entrega">
                                    <p class="status">Status: <?php 
                                                                    if($linha['STATU']=='ENTREGUE'){
                                                                        echo "<p class='entreg'> Pedido entregue</p>";
                                                                    }
                                                                    else if($linha['STATU']=='SEPARANDO'){
                                                                        echo "<p class='chegada'> Previsão de entrega dia ".$resultado;
                                                                        echo "<p class='cheg'> Em separação</p>";
                                                                    }
                                                                    else{
                                                                        echo "<p class='chegad'> Previsão de chegada dia ".$resultado;?>
                                                                        <form action="entrega.php" method="POST">
                                                                            <button class="entre" name="enviado" value="<?=$cod?>">A caminho</button>
                                                                            
                                                                        </form></p>
                                                                        <?php  
                                                                    }
                                                                ?></p>
                                    <p class="total">Total </p><p class="tot">R$
                                    <?=$total= number_format($TOTAL,2,",",".")?></p>
                                </div>
                            </div>
                       
                     <?php 
                    }?>
                
                 <?php 
                } ?>
            </div>
        </div>
        <?php
             include_once "../rodape/rodape.html";
        ?>
</body>
</html>