<?php

    include_once 'templates/header.php';
 ?>

    <main>
        <section class="login contenedor">
            <form name="login-user" id="login-user" action="modelo/login-admin.php" method="post">
                <h3 class="centrado">Iniciar sesión en tu cuenta</h3>
                <a href="#" class="btn btn-login-redes"><i class="fab fa-google"></i>Iniciar sesión con Google</a>
                <a href="#" class="btn btn-login-redes"><i class="fab fa-facebook-square"></i>Iniciar sesión con Facebook</a>
                <hr>
                <input type="text" name="usuario" id="user" placeholder="Ingresá tu correo">
                <input type="password" name="password" id="pass" placeholder="Ingresá tu contraseña">
                <input type="hidden" name="login-user" value="ingresar">
                <button type="submit" class="btn" style="width: 100%;">Ingresar</button>
                <p class="centrado">¿No tenés una cuenta? <a href="registrar.php" class="">Registrarse</a></p>
            </form>

        </section>
    </main>

    <?php 
    include_once 'templates/footer.php';
 ?>