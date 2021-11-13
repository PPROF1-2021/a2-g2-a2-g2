<?php 
    $conex = new mysqli('localhost:3307', 'root', '321232A.a', 'projectapp_bd');
    $conex-> query("SET NAMES 'UTF8'");

    if($conex->connect_error){
        echo $error ->$conex->connect_error;
    }
?>