<?php

    include_once "conecta.php";

    if (($_POST["enviado"])){
    $cod= $_POST['enviado'];
    $status = "UPDATE tb_carrinho
    SET STATU='ENTREGUE' WHERE CODIGO = '$cod' ";
  
    mysqli_query($conn, $status)or die( mysqli_error($conn) );

    header("Location: pedidos.php");

    }
?>