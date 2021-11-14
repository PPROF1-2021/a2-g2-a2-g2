<?php 
    session_start();
    if(isset($_GET['cerrar_sesion'])){
         $cerrar_sesion = $_GET['cerrar_sesion'];
         if($cerrar_sesion){
              session_destroy();
         }
    } elseif(isset($_SESSION['nombre-usuario'])){
         header('Location:index.php');
    }
    if(isset($_SESSION['usuario'])){
        header('Location:../user/index.php');
        exit();
    }
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ProjectAPP</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,600;1,300&family=Roboto:wght@400;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="css/estilos.css">
    <link rel="shortcut icon" href="favicon.ico">
</head>

<body>
    <header>
        <nav class="barra-navegador">
            <div class="contenedor">
                <div class="logo">
                    <a href="index.php"><img src="img/logo.jpg" alt="Logo ProjectAPP"></a>
                    <a href="index.php">
                         ProjectAPP
                    </a>
                </div>

                <div>
                    <ul class="nav-menu">
                        <li>
                            <a href="login.php">Iniciá Sesión</a>
                        </li>
                        <li>
                            <a href="registrar.php">Registrarse</a>
                        </li>
                        <li>
                            <a href="soporte.php">Soporte</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--Fin de barra nav-->
    </header>