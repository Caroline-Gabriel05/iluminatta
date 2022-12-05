<?php
 session_start();
    unset ($_SESSION['id_logado']);
    header('location:../login/index.php');

    unset ($_SESSION['carrinho']);

  ?>