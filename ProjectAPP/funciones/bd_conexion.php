<?php 
    //$conex = new mysqli('localhost:3307', 'root', '321232A.a', 'projectapp_bd');
    $conex = new mysqli('localhost:3306', 'david', '321232A.a', 'projectapp_bd');

    //$conex = new mysqli('localhost','id17587743_root','Dq=kv7SU~k*Fd|l%','id17587743_projectapp_bd');
    $conex-> query("SET NAMES 'UTF8'");

    if($conex->connect_error){
        echo $error ->$conex->connect_error;
    }
?>