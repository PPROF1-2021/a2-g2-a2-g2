$(document).ready(function() {
    $('#comprobar-mail-usuario').on('submit', function(e) {
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

                $(".overlay").remove();
                if (resultado.respuesta == 'existe') {
                    swal.fire(
                        'Ops!',
                        'correo ya registrado',
                        'error'
                    );
                }
            }
        });
    });

    function disableScreen() {
        // creates <div class="overlay"></div> and 
        // adds it to the DOM
        console.log("bloqueado");
        var div = document.createElement("div");
        div.className += "overlay";
        document.body.appendChild(div);
    }
});