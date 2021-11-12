<?php 
    include_once 'templates/header.php';
 ?>

    <main>
        <section class="login contenedor">
            <form action="">
                <h3 class="centrado">Iniciar sesión en tu cuenta</h3>
                <a href="#" id="btn-login-google" class="btn"><i class="fab fa-google"></i>Iniciar sesión con Google</a>
                <a href="#" id="btn-login-facebook" class="btn"><i class="fab fa-facebook-square"></i>Iniciar sesión con Facebook</a>
                <hr>
                <input type="text" name="usuario" id="user" placeholder="Ingresá tu correo">
                <input type="password" name="password" id="pass" placeholder="Ingresá tu contraseña">
                <a href="user/dashboard.html" class="btn">Ingresar</a>
                <p class="centrado">¿No tenés una cuenta? <a href="registrar.html" class="">Registrarse</a></p>
            </form>

        </section>
    </main>

    <?php 
    include_once 'templates/footer.php';
 ?>