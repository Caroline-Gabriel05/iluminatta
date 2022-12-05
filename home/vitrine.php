<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="vitrine.css" />

</head>
<body>
    <!-- ------------menu------------- -->
    <?php
        include_once "../cabecalho/index.php";
    ?>
    <?php
        include_once "home.php";
    ?>
    <!-- ------------vitrine------------- -->
    <?php
        include_once "conecta.php";
    ?>

    <div class="vit_prod">
        <?php
            $query_products = "SELECT COD_PRODUTO, NOME, PRECO, ESTOQUE, CHAVE_IMG_PROD, CAMINHO_IMG 
                                FROM tb_produto, tb_varias_img 
                                WHERE COD_PRODUTO = CHAVE_IMG_PROD 
                                GROUP BY COD_PRODUTO, NOME, PRECO, CHAVE_IMG_PROD
                                ORDER BY COD_PRODUTO DESC LIMIT 12";
            $result_products = $conn->prepare($query_products);
            $result_products->execute();
        ?>
        <div class="produtos">
            <?php
                while ($row_product = $result_products->fetch()) {
                    extract($row_product); 
					$codigo = $row_product["COD_PRODUTO"];
                    echo "<a href='../produto/produto.php?cod=$codigo'>"; 
                    $PRECO = str_replace("," , "" , $PRECO ); 
                    $PRECO = substr_replace($PRECO, '.', -2, 0);
		            $PRECO= number_format($PRECO,2,",",".");
                    ?>
                        <div class="produto">
                            <div class="imagem_prod">
                                <?php
                                    echo "<img src='../$CAMINHO_IMG'><br>";
                                ?></div><?php
                                    echo "<h3>$NOME </h3><br><br>";
                                    echo "<b>R$ $PRECO </b><br>";
                                if ($ESTOQUE==0){
                                    echo "<div class='add_sacola'>
                                        <p>SEM ESTOQUE</p></a>";
                                }
                                else{
                                echo "<div class='add_sacola'>
                                        <a href='../carrinho/carrinho.php?id=$codigo&acao=add'>    
                                        <p>ADICIONAR À SACOLA</p></a>";
                                }?>
                            </div>
                        </div>
                    </a>
                    <?php
                }
                    ?>
        </div>
    </div>

    <!-- ------------rodapé------------- -->
    <?php
        include_once "../cabecalho/rodape.html";
    ?>

</body>
</html>