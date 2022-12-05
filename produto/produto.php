<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="../cabecalho/pag_inicial.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/rodape.css" />
    <link rel="stylesheet" type="text/css" href="produto.css" />
  
    
</head>
<body>
    <!-- ------------menu------------- -->
    <?php
       include_once "../cabecalho/index.php"
    ?>

    <!-- ------------produto------------- -->
    <?php
        include_once "conecta.php";
        include_once "conecta2.php";
    ?>
    <?php
        if ( isset($_GET['cod']) )
            {
                $codigo = $_GET['cod'];
                ?>
                <div class="container">
                    <?php
                        $produto_sql ="SELECT COD_PRODUTO, NOME, PRECO, MODELO, DESCRICAO, MARCA, ESTOQUE
                                        FROM tb_produto
                                        WHERE COD_PRODUTO = $codigo ";
                        
                        
                    ?>

                    <div class="produto">
                        <div class="inf_prod">
                            <div class="prod_img">
                                <?php
                                    $sqlImg =  "SELECT CODIGO, CHAVE_IMG_PROD, CAMINHO_IMG
                                                FROM TB_VARIAS_IMG
                                                WHERE CHAVE_IMG_PROD = '$codigo'";

                                    $resultImg = mysqli_query($conn2, $sqlImg);
                                    $qtd = mysqli_num_rows($resultImg);
                                    $i = 0;
                                    $pricaminho = "";
                                    $segcaminho = "";
                                    if ($qtd == 1)
                                    {
                                        while( $rowImg = mysqli_fetch_assoc($resultImg) )
                                        {
                                             $pricaminho = $rowImg["CAMINHO_IMG"];  
                                             echo " <div class='img_prod_um' >
                                                        <img src= '.$pricaminho' width='550'>
                                                    </div>";                    
                                        } 
                                    }
                                    else if ($qtd == 2)
                                    {                                    
                                        while( $rowImg = mysqli_fetch_assoc($resultImg) )
                                        {
                                            $i = $i + 1;
                                            if ($i == 1)
                                            {
                                                $pricaminho = $rowImg["CAMINHO_IMG"];
                                            } 
                                            else if  ($i == 2)
                                            {
                                                $segcaminho = $rowImg["CAMINHO_IMG"];
                                            }                                             
                                        } 
                                    }

                                

                                if (!empty($segcaminho))
                                {
                                    echo "  <div id='container'> 
                                                
                                                    <input id='foto1' type='radio' name='grupo' checked>
                                                    <label for='foto1'><img  src='.$pricaminho'></label>
                                                    <input id='foto2' type='radio' name='grupo'>
                                                    <label for='foto2'><img src='.$segcaminho'></label>
                                           
                           
                                                <div class='principal'>
                                                    <div class='slide'>         
                                                        <img src='.$pricaminho' height='auto' width='850' >
                                                        <img src='.$segcaminho' height='auto' width='850'>
                                                    
                                                    </div>
                                                </div>
                                            </div>";
                                }  
                                ?>

                                   

                            </div>
                            <div class="prod_tit">
                                <?php
                                    $result_prod = $conn->prepare($produto_sql);
                                    $result_prod->execute();
                                    if (($result_prod) AND ($result_prod->rowCount() != 0)) {
                                        $row_prod = $result_prod->fetch(PDO::FETCH_ASSOC);
                                        extract($row_prod); 
                                        
                                            $sqlconsultamarca= "SELECT * FROM tb_marca WHERE CODIGO = '$MARCA'"; 
                                            $result_marc = $conn->prepare($sqlconsultamarca);
                                            $result_marc->execute();
                                            $row_marc = $result_marc->fetch(PDO::FETCH_ASSOC);
                                            extract($row_marc); 
                                            $PRECO = str_replace("," , "" , $PRECO ); 
                                            $PRECO = substr_replace($PRECO, '.', -2, 0);
                                            $PRECO= number_format($PRECO,2,",",".");
                                            echo "<p class='marca'>$MARCA </p>";
                                            echo "<p class='nome'>$NOME </p>";
                                            echo "<p class='modelo'>$MODELO </p>";
                                            echo "<p class='valor'>R$ $PRECO </p>";
                                        
                                            if ($ESTOQUE==0){
                                                echo "<div class='add_sacola sem_est'>
                                                    <p>SEM ESTOQUE</p></a></div>";
                                            }
                                            else{
                                            echo "<div class='add_sacola'>
                                                    <a href='../carrinho/carrinho.php?id=$codigo&acao=add'>    
                                                    <p>ADICIONAR À SACOLA</p></a></div>";
                                            }?>
                               
                                
                            </div>
                        </div>
                        <div class="desc_prod">
                            <p class="desc_tit">DESCRIÇÃO</p>
                            <?php
                                echo "$DESCRICAO";
                                    }
                            ?>
                        </div>
                    </div>
                </div>
             <?php
            }
             ?>
	
	<!-- ------------rodapé-------------include_once "../cabecalho/rodape.html"; -->
    <?php
        
    ?>

</body>
</html>

<script>
    const box = document.getElementById("img_prod_um");
    const img = document.querySelector("img");
    
    box.addEventListener("mousemove", (e) =>{
        const x = e.clientX - e.target.offselLeft;
        const y = e.clientX - e.target.offselTop;

        console.log(x,y);

        img.style.transformOrigin = "$(x)px $(y)px";
        img.style.transform = "scale(2)";
    })
</script>