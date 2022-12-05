<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="endereco.css" />
    <link rel="stylesheet" type="text/css" href="../cabecalho/cabecalho_adm.css" />
    <link rel="stylesheet" type="text/css" href="../conta/conta.css" />
    <link rel="stylesheet" type="text/css" href="conta.css" />

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
        <h3>Endereço</h3>
        <div class="mostra_dados">
            <div class="tipo">      
                <h4>Usuário
                <?php echo "<a href='end_edit.php'>";?><img class="edit" src="../../img/icone/editar.png" align="right"></a></h4>
            </div>                
            <div class="cep inf">
                <label>CEP</label>
                <p><?php echo mask($cep, '#####-###'); ?></p>
            </div>
            <div class="cid inf">
                <label>Cidade</label>
                <p><?= $linha['CIDADE']?></p>
            </div>
            <div class="bairro inf">
                <label>Bairro</label>
                <p><?= $linha['BAIRRO']?></p>
            </div>
            <div class="rua inf">
                <label>Rua</label>
                <p><?= $linha['RUA']?></p>
            </div>
            <div class="num inf">
                <label>Número</label>
                <p><?= $linha['NUMERO']?></p>
            </div>   
        </div>
    </div>  
    <?php
        include_once "../rodape/rodape.html";
    ?>

</body>
</html>



