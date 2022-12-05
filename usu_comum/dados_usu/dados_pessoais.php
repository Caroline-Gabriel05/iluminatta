<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="imagex/png" href="../../img/logo.png">
    <title>Iluminatta - Otica e Joalheria</title>
    <link rel="stylesheet" type="text/css" href="dados_pessoais.css" />
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
        $query ="SELECT NOME, SOBRENOME, GENERO, DATE_FORMAT(NASCIMENTO, '%d/%m/%Y') AS NASCIMENTO, CPF  FROM tb_cliente WHERE CODIGO=$cliente";
        $dados = mysqli_query( $conn, $query);
        $linha = mysqli_fetch_assoc($dados);

        $query_log ="SELECT*FROM tb_usuario WHERE COD_CLIENTE=$cliente";
        $log = mysqli_query( $conn, $query_log);
        $linha_log = mysqli_fetch_assoc($log);
    
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
        <div class="mostra_dados">
            <div class="tipo">      
                <h4>Usuário
                <?php echo "<a href='dados_edit.php'>";?><img class="edit" src="../../img/icone/editar.png" align="right"></a></h4>
            </div>                
            <div class="nome inf">
                <label>Nome</label>
                <p><?= $linha['NOME']?></p>
            </div>
            <div class="sobr inf">
                <label>Sobrenome</label>
                <p><?= $linha['SOBRENOME']?></p>
            </div>
            <div class="cpf inf">
                <label>CPF</label>
                <p><?php echo mask($linha['CPF'],'###.###.###-##');?></p>
            </div>
            <div class="gene inf">
                <label>Gênero</label>
                <p><?php if($linha['GENERO']=='fem'){echo "Feminino";} else if($linha['GENERO']=='masc'){echo "Masculino";} else{echo "Outro";}?></p>
            </div>
            <div class="data inf">
                <label>Data de Nascimento</label>
                <p><?= $linha['NASCIMENTO']?></p>
            </div>
            <div class="emai inf">
                <label>Email</label>
                <p><?= $linha_log['LOGINUSU']?></p>
            </div>   
            <div class="senha inf">
                <label>Senha</label>
                <p><input type="password" class="form-input" id="passwo" name="password" value="<?php echo $linha_log['SENHA'];?>" disabled="" required />
                    <button type="button" class="ver" onclick="mostrarSenha()"><img id="ver_img" src="../../img/icone/olho.png"></button></p>
            </div>   
        </div>
    </div>  
    <?php
        include_once "../rodape/rodape.html";
    ?>

</body>
</html>



<script>
    function mostrarSenha(){
        var tipo = document.getElementById("passwo");
        var imagem = document.getElementById("ver_img");

        if(tipo.type == "password"){
            tipo.type = "text";
            imagem.src= "../../img/icone/escondido.png";
        }else{
            tipo.type = "password";
            imagem.src= "../../img/icone/olho.png";
        }
    }
</script>


