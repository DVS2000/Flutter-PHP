<?php

include_once('connect.php');

# ID do USUÁRIO
$id = $_POST['id'];

# QUERY (DELETE)
$query = "DELETE FROM user WHERE id = $id";


# EXECUTAR A QUERY
$exe = mysqli_query($connect, $query);


?>