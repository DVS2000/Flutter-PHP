<?php
# CONEXÃO
include_once('connect.php');

# VARIAVÉIS DE LOGIN
$telefone = $_GET['telefone'];
$senha = md5($_GET['senha']);

# QUERY (SELECT)
# VALIDAÇÃO
$query = "SELECT * FROM user WHERE telefone='$telefone' AND senha='$senha'";

# EXECUTAR A QUERY
$exe = mysqli_query($connect, $query);
$getUsers = array();

while($row = mysqli_fetch_array($exe)) {
    $getUsers[] = $row;
}

 echo json_encode($getUsers);
?>