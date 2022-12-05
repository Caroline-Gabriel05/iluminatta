<!DOCTYPE html>
<html>
  <head>
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="shortcut icon" type="imagex/png" href="../img/logo/logo.png">
    <link rel="stylesheet" type="text/css" href="css/cad_usu.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/pag_inicial.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/rodape.css" />
    <meta charset="UTF-8"/>
  </head>
  <body>
    <?php include_once "../cabecalho/index.php";?>
    <div class="container">
      <div class="box">
        <form action="cadastro.php" method="post">
          <legend><b>Cadastro</b></legend>
            <div class="form-campo">
              <label for="Nome">Nome</label>
              <input type="text"class="form-input" id="Nome" name="Nome"/>
            </div>
            <div class="form-campo">
              <label for="sobr">Sobrenome</label>
              <input type="text"class="form-input" id="sobre" name="sobr"/>
            </div>
            <div class="form-campo">
              <div class="form-camp gene">
                <label for="Genero">Gênero</label>
                <div>
                  <label for="Masculino" class="radio-inline">
                    <input type="radio"name="Genero" value="masc" id="Masculino"/>
                    Masculino
                  </label>
                  <label for="Feminino" class="radio-inline">
                    <input type="radio" name="Genero" value="fem" id="Feminino"/>
                    Feminino
                  </label>
                  <label for="Outro" class="radio-inline">
                    <input type="radio" name="Genero" value="out" id="Outro"/>
                    Outro
                  </label>
                </div>
              </div>
              <div class="form-camp data">
                <label for="Nasc">Data de Nascimento</label><br/>
                <input type="date" id="NASCIMENTO" name="NASCIMENTO" min="1500-01-01" max="2100-12-30"> </br> </br>
              </div>
            </div></br>
            <div class="form-campo">
              <label for="CPF">CPF</label>
              <input type="text" class="form-input" id="CPF" name="CPF"/>
            </div>
            <div class="form-campo">
              <div class="form-camp cep">
                <label for="CEP">CEP</label>
                <input type="text" class="form-input" id="CEP" name="CEP" />
              </div>
              <div class="form-camp city">
                <label for="cidade">Cidade</label>
                <input type="text" class="form-input" id="cidade" name="cidade" />
              </div>
            </div></br>
            <div class="form-campo">
              <label for="bairro">Bairro</label>
              <input type="text" class="form-input" id="bairro" name="bairro" />
            </div>
            <div class="form-campo">
              <div class="form-camp rua">
                <label for="rua">Rua</label>
                <input type="text" class="form-input" id="rua" name="rua" />
              </div>
              <div class="form-camp num">
                <label for="numero">Número</label>
                <input type="number" class="form-input" id="numero" name="numero" />
              </div>
            </div>
            <div class="form-campo">
              <label for="email">Email</label>
              <input type="text" class="form-input" id="email" name="email" />
            </div>
            <div class="form-campo">
              <label class="password" for="password">Senha</label>
              <input type="password" class="form-input senha" id="password" maxLength="12" name="password" required />
              <button type="button" class="ver" onclick="mostrarSenha()"><img id="ver_img" src="../img/icone/olho.png"></button>
            </div>
            <div class="botao">
              <input type="submit" class="btn-cadastrar" name="btn_enviar" value="Criar Conta"/>
            </div>  
        </form>
      </div>
    </div>
    <?php include_once "../cabecalho/rodape.html";?>
  </body>
</html>

<script type="text/javascript" src="cep.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
<script>
 $(document).ready(function () { 
        var $CPF = $("#CPF");
        $CPF.mask('000.000.000-00', {reverse: true});
});

</script>

<script type="text/javascript" src="jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="jquery.maskedinput-1.1.4.pack.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  var $CEP = $("#CEP");
	$("#CEP").mask("99999-999");
});
</script>


<script>
    function mostrarSenha(){
        var tipo = document.getElementById("password");
        var imagem = document.getElementById("ver_img");

        if(tipo.type == "password"){
            tipo.type = "text";
            imagem.src= "../img/icone/escondido.png";
        }else{
            tipo.type = "password";
            imagem.src= "../img/icone/olho.png";
        }
    }
</script>
