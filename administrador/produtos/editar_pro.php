<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
  <title>Iluminatta - Otica e Joalheria</title>
  <link rel="stylesheet" type="text/css" href="../rodape/rodape.css" />
  <link rel="stylesheet" type="text/css" href="conta.css" />
  <link rel="stylesheet" type="text/css" href="../conta/conta.css" />
  <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
  <link rel="stylesheet" type="text/css" href="../cadastro_produtos/cad_prod.css" />
</head>
<body>
 
  <?php
      include_once "../cabecalho/cabecalho_adm.php";
  ?>

  <?php
      include_once "../conta/conta.php";
      include_once "conecta2.php";

      $codigo = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

      $select_prod= "SELECT COD_PRODUTO, NOME, PRECO, MODELO, DESCRICAO, MARCA, ESTOQUE, CATEGORIAS
                              FROM tb_produto
                              WHERE COD_PRODUTO = $codigo ";
      $select_prod_result= mysqli_query($conn2, $select_prod);
      $row_select_prod= mysqli_fetch_assoc($select_prod_result);

      $select_img= "SELECT CAMINHO_IMG  
                              FROM tb_varias_img
                              WHERE CHAVE_IMG_PROD = $codigo ";
      $select_img_result= mysqli_query($conn2, $select_img);
      $qtd = mysqli_num_rows($select_img_result);
                                    $i = 0;
                                    $pricaminho = "";
                                    $segcaminho = "";
                                    if ($qtd == 1)
                                    {
                                        while( $rowImg = mysqli_fetch_assoc($select_img_result) )
                                        {
                                             $pricaminho = $rowImg["CAMINHO_IMG"];                     
                                        } 
                                    }

                                    else if ($qtd == 2)
                                    {                                    
                                        while( $rowImg = mysqli_fetch_assoc($select_img_result) )
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
  ?>

  <!--cadastro de produto-->
  <div class="box_cad">
    <form name="cadastro" id="cadastro" <?php echo "action='atualizar_prod.php?id=$codigo'"; ?> method="POST" enctype="multipart/form-data">
        <div id="inputform">
          <h3>Editar Produto</h3>
          <div class="inputcampoimg"> 
              <div class="insereimg">
                <label>Imagem 1:</label> 
                <label for="imagem" id="image">Selecione</label> 
                  <input type="file" name="imagem" id="imagem" class="insere" onchange="previewImagem()"/><br>
                <div class="imgprod">
                  <img id="imgprod" src="<?php echo"../.$pricaminho"; ?>" style="width: 150px; height: 150px;">
                </div>
              </div>
              <div class="insereimg">
                  <label>Imagem 2:</label>
                  <label for="imagem2" id="image">Selecione</label> 
                    <input type="file" name="imagem2" id="imagem2" class="insere" onchange="previewImagem2()"/></br>
                  <div class="imgprod">
                    <?php 
                      if (!empty($segcaminho)){
                        echo "<img id='imgprod2' style='width: 150px; height: 150px;' src='../.$segcaminho'> ";
                      }
                      else{
                        echo "<img id='imgprod2' style='width: 150px; height: 150px;' >";
                      }
                    ?>
                                                                                      
                  </div>
              </div>
          </div>
          </br>
          <div class="inputcampo">
              <input type="text" name="nome_prod" class="insere" value="<?php echo $row_select_prod['NOME'];?>" required >
              <label for="nome_prod" class="labelInput">Nome:</label> <br/>
          </div>
          <div class="inputcampo">
            <label>Marca:</label>
            <select name="marca" id="marca" required > <br/>
            <?php
              if ( $row_select_prod["MARCA"] == 1 )
              {
                    echo "<option value='1' selected>Ana Hickamann</option>";
                    }
              else
              {
                    echo "<option value='1'>Ana Hickamann</option>";					
              }

              if ( $row_select_prod["MARCA"] == 2 )
              {
                    echo "<option value='2' selected>Carolina Herrera</option>";
                    }
              else
              {
                    echo "<option value='2'>Carolina Herrera</option>";					
              }

              if ( $row_select_prod["MARCA"] == 3 )
              {
                    echo "<option value='3' selected>Chilli Beans</option>";
                    }
              else
              {
                    echo "<option value='3'>Chilli Beans</option>";					
              }

            if ( $row_select_prod["MARCA"] == 4 )
            {
                    echo "<option value='4' selected>Colcci</option>";
            }
            else
            {
                    echo "<option value='4'>Colcci</option>";					
            }

            if ( $row_select_prod["MARCA"] == 5 )
            {
                    echo "<option value='5' selected>Dolce&Gabbana</option>";
            }
            else
            {
                    echo "<option value='5'>Dolce&Gabbana</option>";					
            }

            if ( $row_select_prod["MARCA"] == 6 )
            {
                    echo "<option value='6' selected>Gucci</option>";
            }
            else
            {
                    echo "<option value='6'>Gucci</option>";					
            }
            
            if ( $row_select_prod["MARCA"] == 7 )
            {
                    echo "<option value='7' selected>Guess</option>";
            }
            else
            {
                    echo "<option value='7'>Guess</option>";					
            }

            if ( $row_select_prod["MARCA"] == 8 )
            {
                    echo "<option value='8' selected>Lacoste</option>";
            }
            else
            {
                    echo "<option value='8'>Lacoste</option>";					
            }

            if ( $row_select_prod["MARCA"] == 9 )
            {
                    echo "<option value='9' selected>Olivia Burtonby</option>";
            }
            else
            {
                    echo "<option value='9'>Olivia Burtonby</option>";					
            }

            if ( $row_select_prod["MARCA"] == 10 )
            {
                    echo "<option value='10' selected>Polaroid</option>";
            }
            else
            {
                    echo "<option value='10'>Polaroid</option>";					
            }

            if ( $row_select_prod["MARCA"] == 11 )
            {
                    echo "<option value='11' selected>Tommy Hilfiger</option>";
            }
            else
            {
                    echo "<option value='11'>Tommy Hilfiger</option>";					
            }

            if ( $row_select_prod["MARCA"] == 12 )
            {
                    echo "<option value='12' selected>Versace</option>";
            }
            else
            {
                    echo "<option value='12'>Versace</option>";					
            }

            if ( $row_select_prod["MARCA"] == 13 )
            {
                    echo "<option value='13' selected>Vivara</option>";
            }
            else
            {
                    echo "<option value='13'>Vivara</option>";					
            }

            if ( $row_select_prod["MARCA"] == 14 )
            {
                    echo "<option value='14' selected>Cartier</option>";
            }
            else
            {
                    echo "<option value='14'>Cartier</option>";					
            }

            if ( $row_select_prod["MARCA"] == 15 )
            {
                    echo "<option value='15' selected>Pandora</option>";
            }
            else
            {
                    echo "<option value='15'>Pandora</option>";					
            }

            if ( $row_select_prod["MARCA"] == 16 )
            {
                    echo "<option value='16' selected>Monte Carlo</option>";
            }
            else
            {
                    echo "<option value='16'>Monte Carlo</option>";					
            }

            if ( $row_select_prod["MARCA"] == 17 )
            {
                    echo "<option value='17' selected>Tiffany&Co</option>";
            }
            else
            {
                    echo "<option value='17'>Tiffany&Co</option>";					
            }

            if ( $row_select_prod["MARCA"] == 18 )
            {
                    echo "<option value='18' selected>Cassio</option>";
            }
            else
            {
                    echo "<option value='18'>Cassio</option>";					
            }

            if ( $row_select_prod["MARCA"] == 19 )
            {
                    echo "<option value='19' selected>Puma</option>";
            }
            else
            {
                    echo "<option value='19'>Puma</option>";					
            }

            if ( $row_select_prod["MARCA"] == 20 )
            {
                    echo "<option value='20' selected>Diesel</option>";
            }
            else
            {
                    echo "<option value='20'>Diesel</option>";					
            }

            if ( $row_select_prod["MARCA"] == 21 )
            {
                    echo "<option value='21' selected>Nike</option>";
            }
            else
            {
                    echo "<option value='21'>Nike</option>";					
            }

            if ( $row_select_prod["MARCA"] == 22 )
            {
                    echo "<option value='22' selected>Oakley</option>";
            }
            else
            {
                    echo "<option value='22'>Oakley</option>";					
            }

            if ( $row_select_prod["MARCA"] == 23 )
            {
                    echo "<option value='23' selected>Prada</option>";
            }
            else
            {
                    echo "<option value='23'>Prada</option>";					
            }

            if ( $row_select_prod["MARCA"] == 24 )
            {
                    echo "<option value='24' selected>Ray Ban</option>";
            }
            else
            {
                    echo "<option value='24'>Ray Ban</option>";					
            }

            if ( $row_select_prod["MARCA"] == 25 )
            {
                    echo "<option value='25' selected>Louis Vuitton</option>";
            }
            else
            {
                    echo "<option value='25'>Louis Vuitton</option>";					
            }

            if ( $row_select_prod["MARCA"] == 26 )
            {
                    echo "<option value='26' selected>Tom Wood</option>";
            }
            else
            {
                    echo "<option value='26'>Tom Wood</option>";					
            }
          ?>
            </select><br/><br/>
          </div>  
          <div class="inputcampo"> 
            <label>Categorias: <br/></label>
            <table cellspacing=4>
              <tr>
                <?php
                  if ( $row_select_prod["CATEGORIAS"] == 1 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='1' id='1' checked>
                              <label for='1'>Óculos de Grau Masculino</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='1' id='1'>
                              <label for='1'>Óculos de Grau Masculino</label><br/></td>";
                  }					  

                  if ( $row_select_prod["CATEGORIAS"] == 8 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='8' id='8' checked>
                              <label for='8'>Brinco</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='8' id='8'>
                              <label for='8'>Brinco</label><br/></td>";
                  }					  
                ?>
              </tr>
              <tr>
                <?php
                  if ( $row_select_prod["CATEGORIAS"] == 2 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='2' id='2' checked>
                              <label for='2'>Óculos de Grau Feminino</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='2' id='2'>
                              <label for='2'>Óculos de Grau Feminino</label><br/></td>";
                  }					  

                  if ( $row_select_prod["CATEGORIAS"] == 9 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='9' id='9' checked>
                              <label for='9'>Anel</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='9' id='9'>
                              <label for='9'>Anel</label><br/></td>";
                  }					  
                ?>
              </tr>
              <tr>
                <?php
                  if ( $row_select_prod["CATEGORIAS"] == 3 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='3' id='3' checked>
                              <label for='3'>Óculos de Sol Masculino</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='3' id='3'>
                              <label for='3'>Óculos de Sol Masculino</label><br/></td>";
                  }					  

                  if ( $row_select_prod["CATEGORIAS"] == 10 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='10' id='10' checked>
                              <label for='10'>Pulseira</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='10' id='10'>
                              <label for='10'>Pulseira</label><br/></td>";
                  }					  
                ?>
              </tr>
              <tr>
              <?php
                  if ( $row_select_prod["CATEGORIAS"] == 4 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='4' id='4' checked>
                              <label for='4'>Óculos de Sol Feminino</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='4' id='4'>
                              <label for='4'>Óculos de Sol Feminino</label><br/></td>";
                  }					  

                  if ( $row_select_prod["CATEGORIAS"] == 11 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='11' id='11' checked>
                              <label for='11'>Colar</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='11' id='11'>
                              <label for='11'>Colar</label><br/></td>";
                  }					  
                ?>
              </tr>
              <tr>
              <?php
                  if ( $row_select_prod["CATEGORIAS"] == 5 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='5' id='5' checked>
                              <label for='5'>Relógio Masculino</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='5' id='5'>
                              <label for='5'>Relógio Masculino</label><br/></td>";
                  }					  

                  if ( $row_select_prod["CATEGORIAS"] == 12 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='12' id='12' checked>
                              <label for='12'>Pingente</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='12' id='12'>
                              <label for='12'>Pingente</label><br/></td>";
                  }					  
                ?>
              </tr>
              <tr>
              <?php
                  if ( $row_select_prod["CATEGORIAS"] == 6 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='6' id='6' checked>
                              <label for='6'>Relógio Feminino</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='6' id='6'>
                              <label for='6'>Relógio Feminino</label><br/></td>";
                  }					  

                  if ( $row_select_prod["CATEGORIAS"] == 13 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='13' id='13' checked>
                              <label for='13'>Bracelete<</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='13' id='13'>
                              <label for='13'>Bracelete</label><br/></td>";
                  }					  
                ?>
              </tr>
              <tr>
              <?php
                  if ( $row_select_prod["CATEGORIAS"] == 7 )
                  {
                    echo "<td><input type='radio' name='categTeste' value='7' id='7' checked>
                              <label for='6'>Pendente</label><br/></td>";
                  }
                  else
                  {
                    echo "<td><input type='radio' name='categTeste' value='7' id='7'>
                              <label for='7'>Pendente</label><br/></td>";
                  }					  
                ?>
              </tr> 
            </table><br/>
          </div>  
          <div class="inputgrupodois">  
            <div class="inputdois">  
              <label for="mod_prod" class="labelInputdois">Modelo: </label>
              <input type="text" name="mod_prod" class="inseredois" value="<?php echo $row_select_prod['MODELO'];?>"required>
            </div>
            <div class="inputdois">
              <label for="preco" class="labelInputdois">Preço: </label> 
              <input type="text" name="preco" class="inseredoisd" value="<?php echo $row_select_prod['PRECO'];?>" required>
            </div>
          </div>
          <div class="inputcampo"> 
            <textarea id="msg" name="det_prod" rows="4" cols="50" class="insere" required><?=$row_select_prod['DESCRICAO'];?></textarea></br>
            <label for="det_prod" class="labelInput">Detalhes: </label><br/>
          </div> 
          <div class="inputcampo">
              <input type="number" name="estoq_prod" class="insere" value="<?php echo $row_select_prod['ESTOQUE'];?>">
              <label for="estoq_prod" class="labelInput">Estoque:</label> <br/>
          </div>
            </br>
          <button type="submit" name="btn_salvar" id="salva">Salvar Produto</button><br/><br/>
          <button type="reset" name="btn_limpar" id="limpa">Limpar</button>
          </div>
        </div>
      </fieldset>
    </form>
  </div>

  <?php
        include_once "../rodape/rodape.html";
  ?>
  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<script>
			function previewImagem(){
				var imagem = document.querySelector('input[name=imagem]').files[0];
       
				var preview = document.querySelector('img#imgprod');
       

				var reader = new FileReader();
				
				reader.onloadend = function () {
					preview.src = reader.result;
        
				}
				
				if(imagem){
					reader.readAsDataURL(imagem);
         
				}else{
					preview.src = "";
       
				}
			}


      function previewImagem2(){
				
        var imagem2 = document.querySelector('input[name=imagem2]').files[0];
			
        var preview2 = document.querySelector('img#imgprod2');

				var reader = new FileReader();
				
				reader.onloadend = function () {
				
          preview2.src = reader.result;
				}
				
				if(imagem2){
				
          reader.readAsDataURL(imagem2);
				}else{
				
          preview2.src = "";
				}
			}


		</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
<script src="https://plentz.github.io/jquery-maskmoney/javascripts/jquery.maskMoney.min.js" type="text/javascript"></script>



<script>
jQuery(function() {

    
  $(".inseredoisd").maskMoney({prefix:'R$ ', allowNegative: true, decimal:',',thousands:"", affixesStay: false});



});
</script>

</body>
</html>

