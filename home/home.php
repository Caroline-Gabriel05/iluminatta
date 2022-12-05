<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="../cabecalho/rodape.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/pag_inicial.css" />
    <link rel="stylesheet" type="text/css" href="home.css" />
</head>
<body>

    <!-- ------------menu------------- -->
    <?php
        include_once "../cabecalho/index.php";
    ?>

    <!-- ------------slide------------- -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <div class="div-slider">
        <ul class="slides-front">
            <input type="radio" name="radio-btn" id="img-1" checked="">
            <li class="slide-container">
                <div class="slide">
                    <a href="../categorias/marca.php?categ=3,4"><img src="../img/banner/oculos_sol.jpg"></a>
                </div>
                <div class="nav">
                    <label for="img-3" class="prev">‹</label>
                    <label for="img-2" class="next">›</label>
                </div>
            </li>

            <input type="radio" name="radio-btn" id="img-2">
            <li class="slide-container">
                <div class="slide">
                    <a href="../categorias/marca.php?categ=7,8,9,10,11,12,13"><img src="../img/banner/joias.jpg"></a>
                </div>
                <div class="nav">
                    <label for="img-1" class="prev">‹</label>
                    <label for="img-3" class="next">›</label>
                </div>
            </li>

            <input type="radio" name="radio-btn" id="img-3">
            <li class="slide-container">
                <div class="slide">
                    <a href="../categorias/marca.php?categ=5,6"><img src="../img/banner/relogio.jpg"></a>
                </div>
                <div class="nav">
                    <label for="img-2" class="prev">‹</label>
                    <label for="img-1" class="next">›</label>
                </div>
            </li>

            <li class="nav-dots">
                <label for="img-1" class="nav-dot" id="img-dot-1"></label>
                <label for="img-2" class="nav-dot" id="img-dot-2"></label>
                <label for="img-3" class="nav-dot" id="img-dot-3"></label>
            </li>
        </ul>
    </div>

    <!-- ------------nav-categoria------------- -->
    <div id="container-categ">
        <div class="categ-tit">
            <h1>Navegue por Categoria</h1>
            <hr size="2" color="rgb (28,28,28)">
        </div>
        <div class="categorias">
            <div class="categ-box">
                <a class="categ" href="../categorias/marca.php?categ=9">
                    <img src="../img/categorias/anel.jpg">
                    <h2>Anel</h2>
                </a>
            </div>
            <div class="categ-box">
                <a class="categ" href="../categorias/marca.php?categ=10,13">
                    <img src="../img/categorias/pulseira.jpg">
                    <h2>Bracelete e Pulseira</h2>
                </a>
            </div>
            <div class="categ-box">
                <a class="categ" href="../categorias/marca.php?categ=8">
                    <img src="../img/categorias/brinco.jpg">
                    <h2>Brinco</h2>
                </a>
            </div>
            <div class="categ-box">
                <a class="categ" href="../categorias/marca.php?categ=11">
                    <img src="../img/categorias/colar.jpg">
                    <h2>Colar</h2>
                </a>
            </div>
            <div class="categ-box">
                <a class="categ" href="../categorias/marca.php?categ=7,12">
                    <img src="../img/categorias/pingente.jpg">
                    <h2>Pendente e Pingente</h2>
                </a>
            </div>
            <div class="categ-box">
                <a class="categ" href="../categorias/marca.php?categ=1,2,3,4">
                    <img src="../img/categorias/oculos_sol.jpg">
                    <h2>Óculos de Grau e de Sol</h2>
                </a>
            </div>
            <div class="categ-box">
                <a class="categ" href="../categorias/marca.php?categ=5,6">
                    <img src="../img/categorias/relogio.jpg">
                    <h2>Relógio</h2>
                </a>
            </div>
        </div>
    </div>

    <!-- ------------vitrine------------- -->
    <?php
        include_once "conecta.php";
    ?>


    <div class="prod-tit">
        <hr>
        <h2>Produtos mais recentes</h2>
        <hr id="hr_2">
    </div>

    <!-- ------------rodapé------------- -->
    <?php
        include_once "../cabecalho/rodape.html";
    ?>
        
</body>
</html>

<script>
    $(document).ready(function(){
   
   var slids = $(".div-slider [type=radio]"); // busca os radios na div
   var slids_len = slids.length; // conta o número de radios
   var intervalo = 5; // intervalo em segundos
   
   function rodar(){
      var slids_ativo = $(".div-slider [type=radio]:checked")
      .attr("id")
      .match(/\d+/)[0]; // pega o valor numérico do id do radio checado

      if(slids_ativo == slids_len) slids_ativo = 0; // se estiver no último slide, volta pro primeiro

      slids.eq(slids_ativo).prop("checked", true); // checa o radio da vez
   }
   
   var tempo = setInterval(rodar, intervalo*1000); // inicia o temporizador
   
   $(".div-slider").hover(
      function(){ // função quando entra o mouse
         clearInterval(tempo); // cancela o temporizador
      },
      function(){ // função quando retira o mouse
         tempo = setInterval(rodar, intervalo*1000); // reinicia o temporizador
      }
   );
   
});
</script>