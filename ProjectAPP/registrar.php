<?php 
    include_once 'templates/header.php';
?>

<main>
    <section class="login contenedor">
        <form 
        name="comprobar-mail-usuario"
        id="comprobar-mail-usuario"
        action="modelo/login-admin.php"
        method="post">
            <h3 class="centrado">Crear tu cuenta</h3>

            <input type="email" name="correo" id="correo" placeholder="Introduzca el correo electrónico" required>
            <p>Al registrarse confirma que ha leido y aceptado nuestras <a href="">Condiciones del Servicio</a> y nuestra <a href="">Politica de Privacidad</a>.</p>
            <input type="hidden" name="login-user" value="comprobar-correo">
            <button type="submit" class="btn" style="width: 100%;">Continuar</button>
            <br>
            <p class="centrado">O</p><br>
            <a href="" class="btn"><i class="fab fa-google"></i>Continuar con Google</a>
            <a href="" class="btn"><i class="fab fa-facebook-square"></i>Continuar con Facebook</a>
            <hr>
            <p class="centrado">¿Ya tenés una cuenta? <a href="login.php" class="">Iniciá sesión</a></p>
        </form>

    </section>
</main>

<?php 
    include_once 'templates/footer.php';
 ?>