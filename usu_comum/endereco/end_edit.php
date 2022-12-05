<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="endereco2.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="conta.css" />
    <link rel="stylesheet" type="text/css" href="../conta/conta.css" />

</head>
<body>
    <?php
        include_once "../conta/conta.php";
        if(!isset ($_SESSION['id_logado']) == true){
            header ('location: ../../login/index.php');
        }
        $cliente= $_SESSION['id_logado'];

    ?>
    <!-- ------------menu------------- -->
    <?php
        include_once "../cabecalho/cabecalho_adm.php";
    ?>

    <!-- ------------menu adm------------- -->
    <?php
        include_once "../conta/conta.php";
        include_once "conecta.php";
        $query ="SELECT*FROM tb_cliente WHERE CODIGO=$cliente";
        $dados = mysqli_query( $conn, $query);
        $linha = mysqli_fetch_assoc($dados);

        $cep= $linha['CEP'];

        function mask($val, $mask)
        {
        $maskared = '';
        $k = 0;
        for($i = 0; $i<=strlen($mask)-1; $i++)
        {
        if($mask[$i] == '#')
        {
            if(isset($val[$k]))
            $maskared .= $val[$k++];
        }
        else
        {
            if(isset($mask[$i]))
            $maskared .= $mask[$i];
            }
        }
        return $maskared;
        }
    
    ?>

    <div class="dados">
        <h3>Dados Pessoais</h3>
        <form name="cadastro" id="cadastro" action="end_atualiza.php" method="POST" enctype="multipart/form-data">
            <div class="mostra_dados">
                <div class="tipo">      
                    <h4>Usuário</h4>
                </div>                
                <div class="cep inf">
                    <label for="CEP">CEP</label>
                    <input type="text" class="insere" id="CEP" name="CEP"  VALUE="<?=$cep?>" />
                </div>
                <div class="cidade inf">
                    <label for="cidade">Cidade</label>
                    <input type="text" class="insere" id="cidade" name="cidade" value="<?=$linha['CIDADE'];?>" />
                </div>
                <div class="bairro inf">
                    <label for="bairro">Bairro</label>
                    <input type="text" class="insere" id="bairro" name="bairro" value="<?=$linha['BAIRRO'];?>" />
                </div>
                <div class="rua inf">
                    <label for="rua">Rua</label>
                    <input type="text" class="insere ru" id="rua" name="rua" value="<?=$linha['RUA'];?>" />
                </div>
                <div class="numero inf">
                <label for="numero">Número</label>
                <input type="number" class="insere num" id="numero" name="numero" value="<?=$linha['NUMERO'];?>" />
                </div>   <br/><br/>
                <center><button type="submit" name="btn_salvar" class="salva">Salvar Edição</button><br/><br/></center>
            </div>
        </form>
    </div>  
    <?php
        include_once "../rodape/rodape.html";
    ?>
</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  var $CEP = $("#CEP");
	$("#CEP").mask("99999-999");
});
</script>

<script type="text/javascript" src="cep.js"></script>