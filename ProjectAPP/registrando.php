<?php 
    include_once 'templates/header.php';
 ?>

<main>
    <section class="login contenedor">

        <form method="post" action="" name="signup-form">
            <div class="form-element">
                <label>Nombre y Apellido</label>
                <input type="text" name="nombre y apellido" pattern="[a-zA-Z0-9]+" required placeholder="Nombre y Apellido" />
            </div>
            <div class="form-element">
                <label>Fecha de Nacimiento</label>
                <input type="date" id="fecha de nacimiento" name="trip-start" value="2018-07-22" min="1920-01-01">
            </div>
            <div class="form-element">
                <label>Provincia </label>
                <select id="provincia" name="provincia">
                <?php 
                    include_once 'templates/provincias.php'
                ?>
                </select>
            </div>
            <div class="form-element">
                <label>Pais</label>
                <select id="country" name="country">
                <?php 
                    include_once 'templates/paises.php'
                ?>
                </select>
            </div>
            <div class="form-element">
                <label>Nombre de Usuario</label>
                <input type="text" name="nombre de usuario" pattern="[a-zA-Z0-9]+" required placeholder="Nombre de Usuario" />
            </div>
            <div class="form-element">
                <label>Email</label>
                <input type="email" name="email" required placeholder="Email" />
            </div>
            <div class="form-element">
                <label>Clave</label>
                <input type="password" name="password" required placeholder="Ingresa clave de 8 digitos" />
            </div>
            <a href="dashboard.html" class="btn">Continuar</a>
        </form>
        </form>

    </section>
</main>

<?php 
include_once 'templates/footer.php';
?>