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
        <form name="cadastro" id="cadastro" action="dados_atualiza.php" method="POST" enctype="multipart/form-data">
            <div class="mostra_dados">
                <div class="tipo">      
                    <h4>Usuário</h4>
                </div>                
                <div class="nome inf">
                    <label>Nome</label>
                    <input type="text" name="nome" class="insere" value="<?php echo $linha['NOME'];?>" required >
                </div>
                <div class="sobr inf">
                    <label>Sobrenome</label>
                    <input type="text" name="sobrenome" class="insere" value="<?php echo $linha['SOBRENOME'];?>" required >
                </div>
                <div class="cpf inf">
                    <label>CPF</label>
                    <input type="text" id="cpf" class="insere" name="cpf" value="<?php echo mask($linha['CPF'],'###.###.###-##');?>"> 
                </div>
                <div class="data inf">
                    <label>Data de Nascimento</label><br/>
                    <input type="date" id="NASCIMENTO" name="nascimento" value="<?=$linha['NASCIMENTO'];?>" min="1900-01-01" max="2100-12-30"> 
                </div>
                <div class="gene inf">
                    <label for="Genero">Gênero</label>
                    <div>
                        <?php
                            if ( $linha["GENERO"] == 'masc')
                            {
                            echo "<label for='Masculino' class='radio-inline'>
                                    <input type='radio' name='Genero' value='masc' id='Masculino' checked>
                                    Masculino
                                </label>";
                            }
                            else
                            {
                            echo "<label for='Masculino' class='radio-inline'>
                                    <input type='radio' name='Genero' value='masc' id='Masculino'>
                                    Masculino
                                </label>";
                            }					  
    
                            if ( $linha["GENERO"] == 'fem')
                            {
                            echo "<label for='Feminino' class='radio-inline'>
                                    <input type='radio' name='Genero' value='fem' id='Feminino' checked>
                                    Feminino
                                </label>";
                            }
                            else
                            {
                            echo "<label for='Feminino' class='radio-inline'>
                                    <input type='radio' name='Genero' value='fem' id='Feminino'>
                                    Feminino
                                </label>";
                            }		

                            if ( $linha["GENERO"] == 'out')
                            {
                            echo "<label for='Outro' class='radio-inline'>
                                    <input type='radio' name='Genero' value='out' id='Outro' checked>
                                    Outro
                                </label>";
                            }
                            else
                            {
                            echo "<label for='Outro' class='radio-inline'>
                                    <input type='radio' name='Genero' value='out' id='Outro'>
                                    Outro
                                </label>";
                            }	
                        ?>
                    </div>
                </div>
                <div class="emai inf">
                    <label>Email</label>
                    <input type="text" name="email" class="insere" value="<?php echo $linha_log['LOGINUSU'];?>" required >
                </div>   
                <div class="senha inf">
                    <label for="passwor">Senha</label></br>
                    <input type="password" class="form-input" id="passwor" name="password" value="<?php echo $linha_log['SENHA'];?>" maxLength="12" required />
                    <button type="button" class="ver" onclick="mostrarSenha()"><img id="ver_img" src="../../img/icone/olho.png"></button>
                </div> 
                <center><button type="submit" name="btn_salvar" class="salva">Salvar Edição</button><br/><br/></center>
            </div>
        </form>
    </div>  
    <?php
        include_once "../rodape/rodape.html";
    ?>
</body>
</html>

<script>
    function mostrarSenha(){
        var tipo = document.getElementById("passwor");
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
<script>
 $(document).ready(function () { 
        var $CPF = $("#cpf");
        $CPF.mask('000.000.000-00', {reverse: true});
});

</script>