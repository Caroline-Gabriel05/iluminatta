<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="historico.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="conta.css" />
    <link rel="stylesheet" type="text/css" href="../conta/conta.css" />
</head>
<body>
    <!-- ------------menu------------- -->
    <?php
        include_once "../cabecalho/cabecalho_adm.php";
    ?>

    <!-- ------------menu adm------------- -->
    <?php
        include_once "../conta/conta.php";
        include_once "conecta.php";

        $query_1 ="SELECT*FROM tb_carrinho WHERE STATU = 'SEPARANDO'";
        $pedido_1 = mysqli_query( $conn, $query_1);

        $query_2 ="SELECT*FROM tb_carrinho WHERE STATU = 'ENVIADO'";
        $pedido_2 = mysqli_query( $conn, $query_2);

        $query_3 ="SELECT*FROM tb_carrinho WHERE STATU = 'ENTREGUE'";
        $pedido_3 = mysqli_query( $conn, $query_3);
        
    ?>

    <div class="historico env">
        <h3>Pedidos para envio</h3>
        <div class="pedidos env">
                <?php
                while($linha_ped_1 = mysqli_fetch_assoc($pedido_1)){?>
                    <div class="pedido">
                        <div class="linha_tit">
                            <p class="cod">Pedido <?=$linha_ped_1['CODIGO']?></p>
                            <p class="entrega"><?php
                                                    $cod=$linha_ped_1['CODIGO'];
                                                    $status= $linha_ped_1['STATU'];
                                                    $data = $linha_ped_1['DATA_PEDIDO'];
                                                    $qtdDias = 7;
                                                    $resultado = date('d/m/Y', strtotime("+{$qtdDias} days",strtotime($data)));
                                                    if($status=='SEPARANDO'){
                                                        echo "<p class='envi'>Envio até dia ".$resultado;?></P>
                                                        <form action="entrega.php" method="POST">
                                                            <button class="entre" name="enviado" value="<?=$cod?>">Em preparo</button>
                                                            
                                                            <button class="entregado" onclick="javascript: if (confirm('Você realmente enviou este pedido?'))location.href=entrega.php" name="enviado" value="<?=$cod?>"><img src="../../img/icone/verificado.png" class="envio"></button>
                                                        </form>
                                                <?php      
                                                    }

                                                    elseif ($status=='ENVIADO'){
                                                        echo "Enviado";
                                                    }
                                                    else{
                                                        echo "Entregue";
                                                    }
                                            ?></p> 
                        </div>

                            <div class="produtos">
                                <p class="modelo">Modelo</p>
                                <p class="nome">Nome</p>
                                <p class="quant">Quantidade</p>
                            
                        <?php
                            $query_item ="SELECT*FROM tb_item_carrinho WHERE CODIGO_CARRINHO= $cod";
                            $dados_item = mysqli_query( $conn, $query_item);
                            while ($linha_item = mysqli_fetch_assoc($dados_item)){
                                $prod=$linha_item['COD_ITEM'];
                                $query_prod ="SELECT*FROM tb_produto WHERE COD_PRODUTO= $prod";
                                $dados_prod = mysqli_query( $conn, $query_prod);
                                $linha_prod = mysqli_fetch_assoc($dados_prod);
                                $query_img ="SELECT*FROM tb_varias_img WHERE CHAVE_IMG_PROD= $prod ";
                                $dados_img = mysqli_query( $conn, $query_img);
                                $linha_img = mysqli_fetch_assoc($dados_img);
                                ?>
                                <div class="produto">
                                    <img src="../../<?=$linha_img['CAMINHO_IMG'] ?>" class="imga">
                                    <p class="model"><?=$linha_prod['MODELO']?></p>
                                    <p class="nom"><?=$linha_prod['NOME']?></p>
                                    <p class="quan"><?=$linha_item['QUANT_ITEM']?></p>
                                </div>
                                
                        
                    <?php  }
                        $ped=substr_replace($linha_ped_1['VALOR_TOTAL'], '.', -2, 0);
                        $ped= number_format($ped,2,",",".");
                        ?>
                            </div>
                            <div class="linha_fim">
                                <p class="tot_quant">Quantidade de Itens: <?=$linha_ped_1['QUANT_ITENS']?></p>
                                <p class="tot_val">Valor Total: <?=$ped?></p>
                            </div>
                    </div>
                 <?php 
                } ?>
            </div>
    </div>

    <div class="historico enviado">
    <h3>Pedidos enviados</h3>

        <div class="pedidos">
            <?php
            while($linha_ped_2 = mysqli_fetch_assoc($pedido_2)){?>
            <div class="pedido">
                <div class="linha_tit">
                    <p class="cod">Pedido <?=$linha_ped_2['CODIGO']?></p>
                    <p class="entrega"><?php
                                            $cod=$linha_ped_2['CODIGO'];
                                            $status= $linha_ped_2['STATU'];
                                            $data = $linha_ped_2['DATA_PEDIDO'];
                                            $qtdDias = 7;
                                            $resultado = date('d/m/Y', strtotime("+{$qtdDias} days",strtotime($data)));
                                            if($status=='SEPARANDO'){
                                                echo "<p class='envi'>Envio até dia ".$resultado;?></P>
                                                <form action="entrega.php" method="POST">
                                                    <button class="entre" name="enviado" value="<?=$cod?>">Em preparo</button>
                                                
                                                    <button class="entregado" name="enviado" value="<?=$cod?>"><img src="../../img/icone/verificado.png" class="envio"></button>
                                                </form>
                                        <?php      
                                            }

                                            elseif ($status=='ENVIADO'){
                                                echo "Enviado";
                                            }
                                            else{
                                                echo "Entregue";
                                            }
                                    ?></p> 
                </div>
                    <div class="produtos">
                        <p class="modelo">Modelo</p>
                        <p class="nome">Nome</p>
                        <p class="quant">Quantidade</p>
                    
                <?php
                    $query_item ="SELECT*FROM tb_item_carrinho WHERE CODIGO_CARRINHO= $cod";
                    $dados_item = mysqli_query( $conn, $query_item);
                    while ($linha_item = mysqli_fetch_assoc($dados_item)){
                        $prod=$linha_item['COD_ITEM'];
                        $query_prod ="SELECT*FROM tb_produto WHERE COD_PRODUTO= $prod";
                        $dados_prod = mysqli_query( $conn, $query_prod);
                        $linha_prod = mysqli_fetch_assoc($dados_prod);
                        $query_img ="SELECT*FROM tb_varias_img WHERE CHAVE_IMG_PROD= $prod ";
                        $dados_img = mysqli_query( $conn, $query_img);
                        $linha_img = mysqli_fetch_assoc($dados_img);
                        ?>
                        <div class="produto">
                            <img src="../../<?=$linha_img['CAMINHO_IMG'] ?>" class="imga">
                            <p class="model"><?=$linha_prod['MODELO']?></p>
                            <p class="nom"><?=$linha_prod['NOME']?></p>
                            <p class="quan"><?=$linha_item['QUANT_ITEM']?></p>
                        </div>
                        
                
            <?php   }
                $ped=substr_replace($linha_ped_2['VALOR_TOTAL'], '.', -2, 0);
                $ped= number_format($ped,2,",",".");
                ?>
                    </div>
                    <div class="linha_fim">
                        <p class="tot_quant">Quantidade de Itens: <?=$linha_ped_2 ['QUANT_ITENS']?></p>
                        <p class="tot_val">Valor Total: <?=$ped?></p>
                    </div>
            </div>
            <?php } ?>
        </div>
    </div>
    <div class="historico cheg">
        <h3>Pedidos entregues</h3>
        <div class="pedidos">
            <?php
            while($linha_ped_3 = mysqli_fetch_assoc($pedido_3)){?>
            <div class="pedido">
                <div class="linha_tit">
                    <p class="cod">Pedido <?=$linha_ped_3['CODIGO']?></p>
                    <p class="entrega"><?php
                                            $cod=$linha_ped_3['CODIGO'];
                                            $status= $linha_ped_3['STATU'];
                                            $data = $linha_ped_3['DATA_PEDIDO'];
                                            $qtdDias = 7;
                                            $resultado = date('d/m/Y', strtotime("+{$qtdDias} days",strtotime($data)));
                                            if($status=='SEPARANDO'){
                                                echo "<p class='envi'>Envio até dia ".$resultado;?></P>
                                                <form action="entrega.php" method="POST">
                                                    <button class="entre" name="enviado" value="<?=$cod?>">Em preparo</button>
                                                
                                                    <button class="entregado" name="enviado" value="<?=$cod?>"><img src="../../img/icone/verificado.png" class="envio"></button>
                                                </form>
                                        <?php      
                                            }

                                            elseif ($status=='ENVIADO'){
                                                echo "Enviado";
                                            }
                                            else{
                                                echo "Entregue";
                                            }
                                    ?></p> 
                    </div>
                    <div class="produtos">
                        <p class="modelo">Modelo</p>
                        <p class="nome">Nome</p>
                        <p class="quant">Quantidade</p>
                    
                <?php
                    $query_item ="SELECT*FROM tb_item_carrinho WHERE CODIGO_CARRINHO= $cod";
                    $dados_item = mysqli_query( $conn, $query_item);
                    while ($linha_item = mysqli_fetch_assoc($dados_item)){
                        $prod=$linha_item['COD_ITEM'];
                        $query_prod ="SELECT*FROM tb_produto WHERE COD_PRODUTO= $prod";
                        $dados_prod = mysqli_query( $conn, $query_prod);
                        $linha_prod = mysqli_fetch_assoc($dados_prod);
                        $query_img ="SELECT*FROM tb_varias_img WHERE CHAVE_IMG_PROD= $prod ";
                        $dados_img = mysqli_query( $conn, $query_img);
                        $linha_img = mysqli_fetch_assoc($dados_img);
                        ?>
                        <div class="produto">
                            <img src="../../<?=$linha_img['CAMINHO_IMG'] ?>" class="imga">
                            <p class="model"><?=$linha_prod['MODELO']?></p>
                            <p class="nom"><?=$linha_prod['NOME']?></p>
                            <p class="quan"><?=$linha_item['QUANT_ITEM']?></p>
                            <div class="produ_lin"></div>
                        </div>
                        
                
            <?php   }
                $ped=substr_replace($linha_ped_3['VALOR_TOTAL'], '.', -2, 0);
                $ped= number_format($ped,2,",",".");
                ?>
                    </div>
                    <div class="linha_fim">
                        <p class="tot_quant">Quantidade de Itens: <?=$linha_ped_3['QUANT_ITENS']?></p>
                        <p class="tot_val">Valor Total: <?=$ped?></p>
                    </div>
            </div>
            <?php } ?>
        </div>
    </div>

    </div>



    <?php
        include_once "../rodape/rodape.html";
    ?>


</body>
</html>