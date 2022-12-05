<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="vitrine_busca.css" />

</head>
<body>
    <?php
        if (!isset($_GET['busca'])) {
            echo "<label>Nada foi buscado.</label>";
        }

        $nome = "%".trim($_GET['busca'])."%";

        $dbh = new PDO('mysql:host=localhost;dbname=luminata', 'root', '');

        $sth = $dbh->prepare('SELECT * FROM `tb_produto` LIKE :nome');
        $sth->bindParam(':nome', $nome, PDO::PARAM_STR);
        $sth->execute();

        $resultados = $sth->fetchAll(PDO::FETCH_ASSOC);
        ?>

        <h2>Resultado da busca</h2>
        <div class="produtos">
            <?php
                if (count($resultados)) {
                    foreach($resultados as $Resultado) {
                        while ($row_product = $result_products->fetch()) {
                            extract($row_product); 
                            $codigo = $row_product["COD_PRODUTO"];
                            ?>
                                <div class="produto">
                                    <div class="icon_prod">
                                        <?php echo "<a href='editar_pro.php?id=$codigo'>";?><img class="edit" src="../../img/icone/editar.png"></a>                          
                                        <a href="#" onclick="javascript: if (confirm('Você realmente deseja realmente excluir este produto?'))location.href=<?php echo "'pro_deletar.php?id=$codigo'"; ?>"><img  src="../../img/icone/excluir.png"></a>                           
                                    </div>
                                <?php echo "<a href='produto.php?cod=$codigo'>";  ?>
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
                    } 
                } 
                else {
            ?>
                    <label>Não foram encontrados resultados pelo termo buscado.</label>
            <?php
                }
            ?>
        </div>
</body>
</html>