<?php 
    include_once 'templates/header.php';
 ?>

<main>
    <section class="login contenedor">

        <form
            class="needs-validation"
            name="registrar-usuario"
            id="registrar-usuario"
            action="modelo/login-admin.php"
            method="post" novalidate>  
            <div class="form-element">
                <label>Nombre y Apellido</label>
                <input type="text" id="nombre-apellido" name="nombre-apellido" class="form-control" placeholder="Nombre y Apellido"required>
            </div>
            <div class="form-element">
                <label>Fecha de Nacimiento</label>
                <input type="date" id="fecha-nacimiento" name="fecha-nacimiento" min="1920-01-01" class="form-control" required>
            </div>
            <div class="form-element">
                <label>Provincia </label>
                <select class="form-select" id="provincia" name="provincia" required>
                <?php 
                    include_once 'templates/provincias.php'
                ?>
                </select>
            </div>
            <div class="form-element">
                <label>Pais</label>
                <select class="form-select" id="country" name="country" required>
                <?php 
                    include_once 'templates/paises.php'
                ?>
                </select>
            </div>
            <div class="form-element">
                <label>Nombre de Usuario</label>
                <input class="form-control" type="text" id="nombre-usuario" name="nombre-usuario" placeholder="Nombre de Usuario" required/>
            </div>
            <div class="form-element">
                <label>Clave</label>
                <input class="form-control" type="password" name="password"
                id="password" placeholder="Ingresa clave de 8 digitos" required/>
            </div>
            <input type="hidden" name="login-user" value="registrar-usuario">

            <button type="submit" class="btn" style="width: 100%;">Continuar</button>
        </form>
        </form>

    </section>
</main>

<?php 
include_once 'templates/footer.php';
?>