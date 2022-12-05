<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="estoque.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="conta.css" />
    <link rel="stylesheet" type="text/css" href="../conta/conta.css" />
</head>
<body>
    <!-- ------------menu------------- -->
    <?php
        include_once "../cabecalho/cabecalho_adm.php";
    ?>

    <?php
        include_once "../conta/conta.php";
        include_once "conecta.php";
        include_once "conecta2.php";
    ?>

    <div class="container_est">
        <h3>Estoque</h3>
    
    <?php
        $query_estoque = "SELECT COD_PRODUTO, NOME, PRECO, MODELO,MARCA, ESTOQUE
                            FROM tb_produto";
        $result_estoque = $conn->prepare($query_estoque);
        $result_estoque->execute();
    ?>
    <table class="estoque">
        <tr class="lin">
            <td class="cod">Código</td>
            <td class="nom">Nome</td>
            <td class="marc">Marca</td>
            <td class="mod">Modelo</td>
            <td class="pre">Preço</td>
            <td class="est">Estoque</td>
        </tr>
        <?PHP
            $i=0;
             
            while ($row_estoque = $result_estoque->fetch()) {
                extract($row_estoque); 
                $sqlconsultamarca= "SELECT * FROM tb_marca WHERE CODIGO = '$MARCA'"; 
                $result_marc = $conn->prepare($sqlconsultamarca);
                $result_marc->execute();
                $row_marc = $result_marc->fetch(PDO::FETCH_ASSOC);
                extract($row_marc);
                $PRECO = str_replace("," , "" , $PRECO ); 
                    $PRECO = substr_replace($PRECO, '.', -2, 0);
		            $PRECO= number_format($PRECO,2,",",".");
				if ($i%2==0)
				{	
					echo "<tr class='dados' bgcolor='#cccccc'>
							<td class='cod'> $COD_PRODUTO</td>
							<td class='nom'> $NOME</td>
							<td class='marc'>$MARCA </td>
							<td class='mod'> $MODELO </td>
							<td class='pre'> R$ $PRECO </td>
							<td class='est'> $ESTOQUE </td>
						</tr>";
				}
				else{
					echo "<tr class='dados'>
							<td class='cod'> $COD_PRODUTO</td>
							<td class='nom'> $NOME</td>
							<td class='marc'>$MARCA </td>
							<td class='mod'> $MODELO </td>
							<td class='pre'> R$ $PRECO </td>
							<td class='est'> $ESTOQUE </td>
						</tr>";
				}
				$i=$i+1;
			} 
		?>
    </table></BR>

    </div>

    <?php
        include_once "../rodape/rodape.html";
    ?>
</body>
</html>