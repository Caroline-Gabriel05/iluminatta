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
  <link rel="stylesheet" type="text/css" href="cad_prod.css" />
</head>
<body>
 
  <?php
                 session_start(); // abre a sessão
      include_once "../cabecalho/cabecalho_adm.php";
  ?>

  <?php
      include_once "../conta/conta.php";
  ?>

  <!--cadastro de produto-->
  <div class="box_cad">
    <form name="cadastro" id="cadastro" action="cadastro_prod.php" method="POST" enctype="multipart/form-data">
        <div id="inputform">
        <h3>Cadastro de Produtos</h3>
          <div class="inputcampoimg"> 
              <div class="insereimg">
                <label>Imagem 1:</label> 
                <label for="imagem" id="image">Selecione</label> 
                  <input type="file" name="imagem" id="imagem" class="insere" onchange="previewImagem()"/><br>
                <div class="imgprod">
                  <img id="imgprod" style="width: 150px; height: 150px;">
                </div>
              </div>
              <div class="insereimg">
                  <label>Imagem 2:</label>
                  <label for="imagem2" id="image">Selecione</label> 
                    <input type="file" name="imagem2" id="imagem2" class="insere" onchange="previewImagem2()"/></br>
                  <div class="imgprod">
                    <img id="imgprod2" style="width: 150px; height: 150px;">
                  </div>
              </div>
          </div>
          </br>
          <div class="inputcampo">
              <input type="text" name="nome_prod" class="insere" required >
              <label for="nome_prod" class="labelInput">Nome:</label> <br/>
          </div>
          <div class="inputcampo">
            <label>Marca:</label>
            <select name="marca" id="marca" required> <br/>
            <option value="" disabled selected>Selecione</option>
              <option value="1">Ana Hickamann</option>
              <option value="2">Carolina Herrera</option>
              <option value="3">Chilli Beans </option>
              <option value="4">Colcci</option>
              <option value="5">Dolce&Gabbana</option>
              <option value="6">Gucci</option>
              <option value="7">Guess</option>
              <option value="8">Lacoste</option>
              <option value="9">Olivia Burtonby</option>
              <option value="10">Polaroid</option>
              <option value="11">Tommy Hilfiger</option>
              <option value="12">Versace</option>
              <option value="13">Vivara</option>
              <option value="14">Cartier</option>
              <option value="15">Pandora</option>
              <option value="16">Monte Carlo</option>
              <option value="17">Tiffany&Co</option>
              <option value="18">Cassio</option>
              <option value="19">Puma</option>
              <option value="20">Diesel</option>
              <option value="21">Nike</option>
              <option value="22">Oakley</option>
              <option value="23">Prada</option>
              <option value="24">Ray Ban</option>
              <option value="25">Louis Vuitton</option>
              <option value="26">Tom Wood</option>
            </select><br/><br/>
          </div>  
          <div class="inputcampo catego"> 
            <label>Categorias: <br/></label>
            <table cellspacing=4>
              <tr>
                <td><input type="radio" name="categTeste" value="1" id="1"><label for="1"> Óculos de Grau Masculino</label><br/></td>
                <td> <input type="radio" name="categTeste" value="8" id="8"><label for="8"> Brinco</label> <br/></td>
              </tr>
              <tr>
                <td><input type="radio" name="categTeste" value="2" id="2"><label for="2"> Óculos de Grau Feminino</label><br/></td>
                <td><input type="radio" name="categTeste" value="9" id="9"><label for="9"> Anel</label> <br/></td>
              </tr>
              <tr>
                <td><input type="radio" name="categTeste" value="3" id="3"><label for="3"> Óculos de Sol Masculino</label> <br/></td>
                <td><input type="radio" name="categTeste" value="10" id="10"><label for="10"> Pulseira</label> <br/></td>
              </tr>
              <tr>
                <td><input type="radio" name="categTeste" value="4" id="4"><label for="4"> Óculos de Sol Feminino</label> <br/></td>
                <td><input type="radio" name="categTeste" value="11" id="11"><label for="11"> Colar</label> <br/></td>
              </tr>
              <tr>
                <td><input type="radio" name="categTeste" value="5" id="5"><label for="5"> Relógio Masculino</label> <br/></td>
                <td><input type="radio" name="categTeste" value="12" id="12"><label for="12"> Pingente</label> <br/></td>
              </tr>
              <tr>
                <td><input type="radio" name="categTeste" value="6" id="6"><label for="6"> Relógio Feminino</label> <br/></td>
                <td><input type="radio" name="categTeste" value="13" id="13"><label for="13"> Bracelete</label> <br/></td>
              </tr>
              <tr>
                <td><input type="radio" name="categTeste" value="7" id="7"><label for="7"> Pendente</label> <br/></td>
              </tr> 
            </table><br/>
          </div>  
          <div class="inputgrupodois">  
            <div class="inputdois">  
              <label for="mod_prod" class="labelInputdois">Modelo: </label>
              <input type="text" name="mod_prod" class="inseredois" required>
            </div>
            <div class="inputdois">
              <label for="preco" class="labelInputdois">Preço: </label> 
              <input type="text" name="preco" class="inseredoisd" >
            </div>
          </div>
          <div class="inputcampo"> 
            <textarea id="msg" name="det_prod" rows="4" cols="50" class="insere" required></textarea>
            <label for="det_prod" class="labelInput">Detalhes: </label><br/>
          </div> 
          <div class="inputcampo">
              <input type="number" name="estoq_prod" class="insere" required >
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

