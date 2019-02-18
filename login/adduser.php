<?php
include_once('connect.php');

# VARIÁVEIS DO USUÁRIO
$nome       = $_POST['nome'];
$email      = $_POST['email'];
$telefone   = $_POST['telefone'];
$senha      = $_POST['senha'];

# CRIPTOGRÁFIA DA SENHA
$senha = md5($senha);

# QUERY (INSERT)
$query = "INSERT INTO user(nome,email,telefone,senha)
         VALUES('$nome', '$email', '$telefone', '$senha')";

# EXECUTAR A QUERY
$exe = mysqli_query($connect, $query);

?>