<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="relatorio.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="conta.css" />
    <link rel="stylesheet" type="text/css" href="../conta/conta.css" />
</head>
<body>
    <!-- ------------menu------------- -->
    <?php
        include_once "../cabecalho/cabecalho_adm.php";
        include_once "../conta/conta.php";
        include_once "conecta.php";

        $out ="SELECT * FROM tb_carrinho WHERE MONTH(DATA_PEDIDO) = '10' ";
        $dados_out = mysqli_query( $conn, $out);
        $out_sum = "SELECT sum(VALOR_TOTAL), sum(QUANT_ITENS) FROM tb_carrinho WHERE MONTH(DATA_PEDIDO) = '10' ORDER BY CODIGO DESC";
        $dados_out_sum = mysqli_query( $conn, $out_sum);
        $linha_out_sum = mysqli_fetch_assoc($dados_out_sum);
        $valor_total_out= substr_replace($linha_out_sum['sum(VALOR_TOTAL)'], '.', -2, 0);
        $valor_total_out= number_format($valor_total_out,2,",",".");
        $quant_1= $linha_out_sum['sum(QUANT_ITENS)'];

        $nov ="SELECT * FROM tb_carrinho WHERE MONTH(DATA_PEDIDO) = '11' ";
        $dados_nov = mysqli_query( $conn, $nov);
        $nov_sum = "SELECT sum(VALOR_TOTAL), sum(QUANT_ITENS) FROM tb_carrinho WHERE MONTH(DATA_PEDIDO) = '11' ORDER BY CODIGO DESC";
        $dados_nov_sum = mysqli_query( $conn, $nov_sum);
        $linha_nov_sum = mysqli_fetch_assoc($dados_nov_sum);
        $valor_total_nov= substr_replace($linha_nov_sum['sum(VALOR_TOTAL)'], '.', -2, 0);
        $valor_total_nov= number_format($valor_total_nov,2,",",".");
        $quant_2= $linha_nov_sum['sum(QUANT_ITENS)'];

        $dez ="SELECT * FROM tb_carrinho WHERE MONTH(DATA_PEDIDO) = '12'";
        $dados_dez = mysqli_query( $conn, $dez);
        $dez_sum = "SELECT sum(VALOR_TOTAL), sum(QUANT_ITENS) FROM tb_carrinho WHERE MONTH(DATA_PEDIDO) = '12' ORDER BY CODIGO DESC";
        $dados_dez_sum = mysqli_query( $conn, $dez_sum);
        $linha_dez_sum = mysqli_fetch_assoc($dados_dez_sum);
        $valor_total_dez= substr_replace($linha_dez_sum['sum(VALOR_TOTAL)'], '.', -2, 0);
        $valor_total_dez= number_format($valor_total_dez,2,",",".");
        $quant_3= $linha_dez_sum['sum(QUANT_ITENS)'];
        
        $quer="SELECT sum(VALOR_TOTAL), sum(QUANT_ITENS) FROM tb_carrinho";
        $dado = mysqli_query( $conn, $quer);
        $linh = mysqli_fetch_assoc($dado);
        $valor_total= substr_replace($linh['sum(VALOR_TOTAL)'], '.', -2, 0);
        $valor_total= number_format($valor_total,2,",",".");


        

    ?>

    <div class="relatorio">
        <h3>Relatório de Vendas</h3>
        <div class="anual">
            <p class="itens_tot">Total itens vendidos: <?=$linh['sum(QUANT_ITENS)']?></p>
            <p class="val_tot">Valor total das vendas: R$ <?=$valor_total?></p>
        </div>
        <div class="mes">
            <h4>Outubro</h4>
            <p class="itens_tot">Quantidade de itens vendidos: <?=$quant_1?></p>
            <p class="val_tot">Valor total vendido: R$ <?=$valor_total_out?></p>
            <table >
                <tr class="leg">
                    <td class="codig">Cód. Venda</td>
                    <td class="nome">Cliente</td>
                    <td class="data">Data</td>
                    <td class="preco">Valor</td>
                    <td class="quant">Quant. Itens</td>
                </tr><?php
                $o=0;
                while($linha_out = mysqli_fetch_assoc($dados_out)){ 
                    $valor= substr_replace($linha_out['VALOR_TOTAL'], '.', -2, 0);
                    $valor= number_format($valor,2,",",".");
                    $CODI=$linha_out['COD_CLIENTE'];
                    $nome= "SELECT * FROM tb_cliente WHERE CODIGO= $CODI ";
                    $dado_no = mysqli_query( $conn, $nome);
                    $linh_no = mysqli_fetch_assoc($dado_no);
                
                    if ($o%2==0){ ?>
                        <tr bgcolor="#edebeb">
                            <td class="codig"><?=$linha_out['CODIGO'] ?></td>
                            <td class="nome"><?php echo $linh_no['NOME']. " ". $linh_no['SOBRENOME'];  ?></td>
                            <td class="data"><?php echo date('d-m-Y', strtotime($linha_out['DATA_PEDIDO'])); ?></td>
                            <td class="preco">R$ <?=$valor ?></td>
                            <td class="quant"><?=$linha_out['QUANT_ITENS'] ?></td>
                        </tr><?php  
                    }
                    else{	 ?>
                        <tr bgcolor="#cfcccc">
                            <td class="codig"><?=$linha_out['CODIGO'] ?></td>
                            <td class="nome"><?php echo $linh_no['NOME']. " ". $linh_no['SOBRENOME'];  ?></td>
                            <td class="data"><?php echo date('d-m-Y', strtotime($linha_out['DATA_PEDIDO'])); ?></td>
                            <td class="preco">R$ <?=$valor ?></td>
                            <td class="quant"><?=$linha_out['QUANT_ITENS'] ?></td>
                        </tr><?php  
                    }
                    $o=$o+1;
                }
                ?>
            </table>
            
        </div>
        <div class="mes">
            <h4>Novembro</h4>
            <p class="itens_tot">Quantidade de itens vendidos: <?=$quant_2?></p>
            <p class="val_tot">Valor total vendido: R$ <?=$valor_total_nov?></p>
            <table >
                <tr class="leg">
                    <td class="codig">Cód. Venda</td>
                    <td class="nome">Cliente</td>
                    <td class="data">Data</td>
                    <td class="preco">Valor</td>
                    <td class="quant">Quant. Itens</td>
                </tr><?php
                $i=0;
                while($linha_nov = mysqli_fetch_assoc($dados_nov)){ 
                    $valor_nov= substr_replace($linha_nov['VALOR_TOTAL'], '.', -2, 0);
                    $valor_nov= number_format($valor_nov,2,",",".");
                    $CODIG=$linha_nov['COD_CLIENTE'];
                    $nome= "SELECT * FROM tb_cliente WHERE CODIGO= $CODIG ";
                    $dado_no = mysqli_query( $conn, $nome);
                    $linh_no = mysqli_fetch_assoc($dado_no);
                    if ($i%2==0){	?>
                        <tr bgcolor="#edebeb">
                            <td class="codig"><?=$linha_nov['CODIGO'] ?></td>
                            <td class="nome"><?php echo $linh_no['NOME']. " ". $linh_no['SOBRENOME'];  ?></td>
                            <td class="data"><?php echo date('d-m-Y', strtotime($linha_nov['DATA_PEDIDO'])); ?></td>
                            <td class="preco">R$ <?=$valor_nov ?></td>
                            <td class="quant"><?=$linha_nov['QUANT_ITENS'] ?></td>
                        </tr><?php   
                    }
                    else{	?>
                        <tr bgcolor="#cfcccc">
                            <td class="codig"><?=$linha_nov['CODIGO'] ?></td>
                            <td class="nome"><?php echo $linh_no['NOME']. " ". $linh_no['SOBRENOME'];  ?></td>
                            <td class="data"><?php echo date('d-m-Y', strtotime($linha_nov['DATA_PEDIDO'])); ?></td>
                            <td class="preco">R$ <?=$valor_nov ?></td>
                            <td class="quant"><?=$linha_nov['QUANT_ITENS'] ?></td>
                        </tr><?php   
                    }
                    $i=$i+1;
                } ?>
                
            </table>

            <div class="tot"></div>
        </div>
        <div class="mes">
            <h4>Dezembro</h4>
            <p class="itens_tot">Quantidade de itens vendidos: <?=$quant_3?></p>
            <p class="val_tot">Valor total vendido: R$ <?=$valor_total_dez?></p>
            <table >
                <tr class="leg">
                    <td class="codig">Cód. Venda</td>
                    <td class="nome">Cliente</td>
                    <td class="data">Data</td>
                    <td class="preco">Valor</td>
                    <td class="quant">Quant. Itens</td>
                </tr><?php
                $i=0;
                while($linha_dez = mysqli_fetch_assoc($dados_dez)){ 
                    $valor_dez= substr_replace($linha_dez['VALOR_TOTAL'], '.', -2, 0);
                    $valor_dez= number_format($valor_dez,2,",",".");
                    $CODIG=$linha_dez['COD_CLIENTE'];
                    $nome= "SELECT * FROM tb_cliente WHERE CODIGO= $CODIG ";
                    $dado_dez = mysqli_query( $conn, $nome);
                    $linh_dez = mysqli_fetch_assoc($dado_dez);
                    if ($i%2==0){	?>
                        <tr bgcolor="#edebeb">
                            <td class="codig"><?=$linha_dez['CODIGO'] ?></td>
                            <td class="nome"><?php echo $linh_dez['NOME']. " ". $linh_dez['SOBRENOME'];  ?></td>
                            <td class="data"><?php echo date('d-m-Y', strtotime($linha_dez['DATA_PEDIDO'])); ?></td>
                            <td class="preco">R$ <?=$valor_dez ?></td>
                            <td class="quant"><?=$linha_dez['QUANT_ITENS'] ?></td>
                        </tr><?php   
                    }
                    else{	?>
                        <tr bgcolor="#cfcccc">
                            <td class="codig"><?=$linha_dez['CODIGO'] ?></td>
                            <td class="nome"><?php echo $linh_dez['NOME']. " ". $linh_dez['SOBRENOME'];  ?></td>
                            <td class="data"><?php echo date('d-m-Y', strtotime($linha_dez['DATA_PEDIDO'])); ?></td>
                            <td class="preco">R$ <?=$valor_dez ?></td>
                            <td class="quant"><?=$linha_dez['QUANT_ITENS'] ?></td>
                        </tr><?php   
                    }
                    $i=$i+1;
                } ?>
                
            </table>

            <div class="tot"></div>
        </div>
    </div>





<?php
        include_once "../rodape/rodape.html";
    ?>
</body>
</html>