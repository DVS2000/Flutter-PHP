<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$db_name = 'systemlogin';

$connect = mysqli_connect($servername, $username, $password, $db_name);
mysqli_set_charset($connect, "utf8");

if(mysqli_connect_error($connect)) {

    echo 'Erro '.mysqli_connect_error($connect);
}


?>