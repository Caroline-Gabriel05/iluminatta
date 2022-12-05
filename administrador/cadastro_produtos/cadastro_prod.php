<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css"/>
    <link rel="stylesheet" type="text/css" href="../cabecalho/rodape.css"/>
    <link rel="stylesheet" type="text/css" href="../produtos/produto.css"/>
    <link rel="stylesheet" type="text/css" href="../conta/conta.css"/>
    <link rel="stylesheet" type="text/css" href="conta.css"/>

</head>
<body>
    <?php  include_once "../cabecalho/cabecalho_adm.php";  ?>

    <?php
      include_once "../conta/conta.php";
    ?>

<?php
include_once 'conecta.php';
include_once 'conecta2.php';

   if ( isset($_POST["btn_salvar"]) )
   {
        $foto = $_FILES['imagem']['name'];
        $foto2 = $_FILES['imagem2']['name'];
        $nome = $_POST['nome_prod'];
        $marca = $_POST['marca'];
        $cat = $_POST['categTeste'];
        $modelo = $_POST['mod_prod'];
        $preco = $_POST['preco'];
        $detalhe = $_POST['det_prod'];
        $estoq = $_POST['estoq_prod'];


        $_UP = '../../img/produtos/';
        $_UPS = '../../img/produtos/';
        $_UP.=$foto;
        $_UPS.=$foto2;
        $tmp_name=$_FILES['imagem']['tmp_name'];
        $tmp_names=$_FILES['imagem2']['tmp_name'];
        move_uploaded_file($tmp_name,$_UP);
        move_uploaded_file($tmp_names,$_UPS);

      $sqlPRIMEIRO = "INSERT INTO tb_produto
	                   (marca, categorias, nome, modelo, descricao, preco, estoque)
                      VALUES
					   ('$marca', '$cat', '$nome', '$modelo', '$detalhe', '$preco', '$estoq')";
						   
      mysqli_query($conn2, $sqlPRIMEIRO)or die( mysqli_error($conn2) );


    $ult = mysqli_insert_id($conn2);          
     
	  
	  $valor = './img/produtos/'.$foto;

	  
	  $sqlSEGUNDO = "INSERT INTO tb_varias_img
	                   (CHAVE_IMG_PROD,CAMINHO_IMG)
                     VALUES
					   ('$ult', '$valor')";
						  
      mysqli_query($conn2, $sqlSEGUNDO)or die( mysqli_error($conn2) );


      if (!empty($foto2)) {
      {
        ////echo "último código inserido " . $ult;
        mysqli_query($conn2, "INSERT INTO tb_varias_img (CHAVE_IMG_PROD,CAMINHO_IMG)
        VALUES ('$ult','./img/produtos/$foto2')");

      }
   }}



   
   $sql = "SELECT*FROM tb_produto WHERE COD_PRODUTO=$ult";
   $result = mysqli_query($conn2, $sql);
   $row = mysqli_fetch_assoc($result);
   $cod_prod = $row['COD_PRODUTO'];
   
   $sqlImg = "SELECT * FROM TB_VARIAS_IMG
              WHERE CHAVE_IMG_PROD = '$ult'";
   $resultImg = mysqli_query($conn2, $sqlImg);

   $sqlconsulta= "SELECT * FROM TB_PRODUTO WHERE COD_PRODUTO = '$ult'";
   $sqlconsultamarca= "SELECT * FROM TB_MARCA WHERE CODIGO = '$marca'";
   $sqlconsultacateg= "SELECT * FROM TB_CODIGO_PROD WHERE COD_CATEGORIA = '$cat'";


   $resultconsulta= mysqli_query($conn2, $sqlconsulta);
   $resultconsultamarca= mysqli_query($conn2, $sqlconsultamarca);
   $resultconsultacateg= mysqli_query($conn2, $sqlconsultacateg);
   


   if ( isset($ult) )
   {
       $codigo = $ult;
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
                                               <img src= '../.$pricaminho' width='450'>
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
                        echo "  <div id='containe'> 
                                       
                        <input id='foto1' type='radio' name='grupo' checked>
                        <label for='foto1'><img  src='../.$pricaminho'></label>
                        <input id='foto2' type='radio' name='grupo'>
                        <label for='foto2'><img src='../.$segcaminho'></label>
               

                    <div class='principal'>
                        <div class='slide'>         
                            <img src='../.$pricaminho' height='auto' width='550' >
                            <img src='../.$segcaminho' height='auto' width='550'>
                        
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
                           
                                   echo "<p class='marca'>$MARCA </p>";
                                   echo "<p class='nome'>$NOME </p>";
                                   echo "<p class='modelo'>$MODELO </p>";
                                   echo "<p class='valor'>R$ $PRECO </p>";
                                   echo "<p class='estoque'>Estoque: $ESTOQUE </p>";
                               
                       ?>
                       <a href="#" class="adm_prod" onclick="javascript: if (confirm('Você realmente deseja realmente excluir este produto?'))location.href=<?php echo "'pro_deletar.php?id=$codigo'"; ?>">
                           <div class="excluir_prod">
                              <P> EXCLUIR PRODUTO</p>
                           </div>
                       </a>
                       <?php echo "<a class='adm_prod' href='../produtos/editar_pro.php?id=$codigo'>";?>
                           <div class="editar_prod">
                              <p> EDITAR PRODUTO</p>                          
                           </div>
                       </a>
                       <form action= "../cadastro_produtos/cadastro_pro.php" method="GET" class="button">
                          <input type="submit" name="btn_novo" id="novo" value="NOVO PRODUTO" class="btn_novo"></br>
                        </form>
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
        include_once "../rodape/rodape.html";
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

 
