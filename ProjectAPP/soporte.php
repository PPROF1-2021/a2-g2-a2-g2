<?php 
    include_once 'templates/header.php';
?>
<main>
    <section class="login contenedor">
        <form name="contacto" method="post" action="" class="needs-validation" novalidate>
            <h3 class="centrado">¡¡Comúnicate con nosotros!!</h3>
            <p>Si tienes alguna duda o quieres contactar con nosotros dejanos tu comentarios y nos estaremos comunicando contigo</p>
            <hr>
            <input type="email" name="email" id="email" placeholder="Ingresá tu correo" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
            <input type="tel" name="tel" id="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" placeholder="Ingresá tu teléfono" required>
            <textarea name="comentario" id="comentarios" required cols="30" rows="10"></textarea>
            <button type="submit" style="width: 100%;" class="btn btn-dark">Enviar</button>
        </form>

    </section>
</main>

<?php 
    include_once 'templates/footer.php';
?>