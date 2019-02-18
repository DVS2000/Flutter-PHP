<?php
include_once('connect.php');

# VARIÁVEIS DO USUÁRIO
$id         = $_POST['id'];
$nome       = $_POST['nome'];
$email      = $_POST['email'];
$telefone   = $_POST['telefone'];
$senha      = $_POST['senha'];

# CRIPTOGRÁFIA DA SENHA
$senha = md5($senha);

# QUERY (UPDATE)
$query = "UPDATE user SET
          nome      = '$nome',
          email     = '$email',
          telefone  = '$telefone',
          senha     = '$senha'
          WHERE id  =  $id; 
        ";

# EXECUTAR A QUERY
$exe = mysqli_query($connect, $query);



?>