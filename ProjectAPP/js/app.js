$(document).ready(function() {
    $('#comprobar-mail-usuario').on('submit', function(e) {
        e.preventDefault();
        disableScreen();
        const datos = $(this).serializeArray();
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function(data) {
                const resultado = data;
                if (resultado.respuesta == 'existe') {
                    $(".overlay").remove();
                    swal.fire(
                        'Ops!',
                        'correo ya registrado',
                        'error'
                    );
                } else if (resultado.respuesta == 'no-existe') {
                    setTimeout(() => {
                        window.location.href = 'registrando.php'
                    }, 2000);
                } else if (resultado.respuesta == 'error') {
                    $(".overlay").remove();
                    console.log(resultado.error);
                }
            }
        });

    });
    $('#registrar-usuario').on('submit', function(e) {
        e.preventDefault();
        disableScreen();
        const datos = $(this).serializeArray();
        console.log(datos);
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function(data) {
                const resultado = data;
                console.log(resultado);
                if (resultado.respuesta == "correcto") {
                    $(".overlay").remove();
                    swal.fire(
                        'Correcto',
                        'Se registró con éxito',
                        'success'
                    );
                    setTimeout(() => {
                        window.location.href = 'user/index.php'
                    }, 2000);
                }
            }
        });
    });

    function disableScreen() {
        // creates <div class="overlay"></div> and 
        // adds it to the DOM
        var div = document.createElement("div");
        div.className += "overlay";
        document.body.appendChild(div);
    }
});