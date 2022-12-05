<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="vitrine.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="../conta/conta.css" />
    <link rel="stylesheet" type="text/css" href="conta.css" />
</head>
<body>
    <!-- ------------menu------------- -->
    <?php
        include_once "../cabecalho/cabecalho_adm.php";
    ?>

    <!-- ------------menu adm------------- -->
    <?php
        include_once "../conta/conta.php";
    ?>

    <!-- ------------vitrine------------- -->
    <?php
    
        include_once "conecta.php";

        $query_products = "SELECT COD_PRODUTO, NOME, PRECO, CHAVE_IMG_PROD, CAMINHO_IMG 
                            FROM tb_produto, tb_varias_img 
                            WHERE COD_PRODUTO = CHAVE_IMG_PROD 
                            GROUP BY COD_PRODUTO, NOME, PRECO, CHAVE_IMG_PROD
                            ORDER BY COD_PRODUTO ";
        $result_products = $conn->prepare($query_products);
        $result_products->execute();
    ?>

    <div class="vit_prod">
        <div class="produtos">
            <?php
                while ($row_product = $result_products->fetch()) {
                    extract($row_product); 
					$codigo = $row_product["COD_PRODUTO"];
                    $PRECO = str_replace("," , "" , $PRECO ); 
                    $PRECO = substr_replace($PRECO, '.', -2, 0);
		            $PRECO= number_format($PRECO,2,",",".");
            ?>
                        <div class="produto">
                            <div class="icon_prod">
                                <?php echo "<a href='editar_pro.php?id=$codigo'>";?>
                                    <img class="edit" src="../../img/icone/editar.png">
                                </a>      
                                <form action="pro_deletar.php" method="POST">   
                                    <input class="codigo" type="number" name="id" value="<?=$codigo?>">                 
                                    <button type="submit" class="botao" onclick="javascript: if (confirm('Você realmente deseja realmente excluir este produto?'))location.href=<?php echo "'pro_deletar.php?id=$codigo'"; ?>">
                                        <img  src="../../img/icone/excluir.png">
                                    </button>  
                                </form>                         
                            </div>
                            <?php echo "<a href='../produto/produto.php?cod=$codigo'>";?>
                                <div class="imagem_prod">
                                <?php
                                    echo "<img class='img_produtos'src='../../$CAMINHO_IMG'><br>";
                                    ?>
                                </div>
                                <?php
                                    echo "<h3>$NOME </h3><br>";
                                    echo "<b>R$ $PRECO </b><br>";
                                ?>
                                
                                </div>
                            </a>
            <?php
                }
            ?>
        </div>
    </div>

    <!-- ------------rodapé------------- -->
    <?php
        include_once "../rodape/rodape.html";
    ?>

</body>
</html>



