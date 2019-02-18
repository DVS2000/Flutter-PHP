<?php
# CONEXÃO
include_once('connect.php');

# VARIAVÉL DE PESQUISA
$search = $_GET['search'];

# QUERY (SELECT)
$query = "SELECT * FROM user WHERE nome LIKE '$search%' OR telefone LIKE '%$search%' ORDER BY nome";

# EXECUTAR A QUERY
$exe = mysqli_query($connect, $query);
$getUsers = array();

while($row = mysqli_fetch_array($exe)) {
    $getUsers[] = $row;
}

 echo json_encode($getUsers);
?>