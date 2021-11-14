$(document).ready(function() {
    $('#comprobar-mail-usuario').on('submit', function(e) {
        e.preventDefault();
        //disableScreen();
        const datos = $(this).serializeArray();
        console.log(datos);
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
                        window.location.href = `registrando.php?correo=${datos[0].value}`
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
        //disableScreen();
        if (validarCampos()) {
            const direccion = window.location.href;
            const correo = direccion.substring(direccion.indexOf('=') + 1, direccion.length);
            let datos = $(this).serializeArray();
            const object = { name: 'correo', value: correo };
            datos.push(object);
            $.ajax({
                type: $(this).attr('method'),
                data: datos,
                url: $(this).attr('action'),
                dataType: 'json',
                success: function(data) {
                    const resultado = data;
                    console.log(data);
                    if (resultado.respuesta == "correcto") {
                        $(".overlay").remove();
                        swal.fire(
                            'Correcto',
                            `Se registró con éxito </br>
                            su usuario es ${correo} </br>
                            recuerde jamás revelar su contraseña`,
                            'success'
                        );
                        setTimeout(() => {
                            window.location.href = 'user/index.php'
                        }, 2000);
                    }
                }
            });
        }

    });
    $('#login-user').on('submit', function(e) {
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
                console.log(resultado);
                $(".overlay").remove();

                if (resultado.respuesta == "exito") {
                    swal.fire(
                        'Login Correcto',
                        'Bienvenid@ ' + resultado.usuario + '!!',
                        'success'
                    );
                    setTimeout(function() {
                        window.location.href = 'user/index.php';
                    }, 2000);
                } else {
                    swal.fire(
                        'Ops!',
                        'Usuario o password incorrecto',
                        'error'
                    );
                }
            }
        });
    });

    $('.btn-login-redes').on("click", function(e) {
        swal.fire(
            'Próximamente',
            'Proximamente estaremos habilitando el inicio de usuario por medio de su red social favorita',
            'warning'
        );
    });


    function validarCampos() {
        const nombre = document.getElementById('nombre-apellido').value;
        const nombreUsuario = document.getElementById('nombre-usuario').value;
        const provincia = document.getElementById('provincia').value;
        const pais = document.getElementById('country').value;
        const fechaNacimiento = document.getElementById('fecha-nacimiento').value;
        const password = document.getElementById('password').value;
        console.log(fechaNacimiento);
        if (nombre.length <= 2) {
            swal.fire(
                'Ops!',
                'Ingrese un nombre y apellido valido',
                'error'
            );
            return false;
        }
        if (fechaNacimiento == "") {
            swal.fire(
                'Ops!',
                'Seleccione una fecha',
                'error'
            );
            return false;
        } else {
            if (!validarEdad(fechaNacimiento)) {
                swal.fire(
                    'Ops!',
                    'Usted es menor de edad',
                    'error'
                );
                return false;
            }

        }
        if (provincia == "") {
            swal.fire(
                'Ops!',
                'Seleccione una provincia',
                'error'
            );
            return false;
        }
        if (pais == "") {
            swal.fire(
                'Ops!',
                'Seleccione un pais',
                'error'
            );
            return false;
        }
        if (nombreUsuario.length <= 5) {
            swal.fire(
                'Ops!',
                'El nombre de usuario debe tener más de 5 letras',
                'error'
            );
            return false;
        }
        if (password.length <= 7) {
            swal.fire(
                'Ops!',
                'Su password debe tener un mínimo de 8 caracteres',
                'error'
            );
            return false;
        }

        return true;
    }

    function validarEdad(fecha) {
        //
        const anio = parseInt(fecha.substring(0, 4));
        const mes = parseInt(fecha.substring(5, 7));
        const dia = parseInt(fecha.substring(8, 10));
        // Obtenemos fecha actual
        const today = new Date();
        const anioToday = today.getFullYear();
        const mesToday = today.getMonth() + 1;
        const diaToday = today.getDate();
        //comprobamos
        let edad = (anioToday - anio);
        if (mes > mesToday) {
            edad = edad - 1;
        } else if (mes == mesToday) {
            if (dia > diaToday) {
                edad = edad - 1;
            }
        }
        if (edad < 18) {
            return false;
        }
        return true;
    }

    function disableScreen() {
        // creates <div class="overlay"></div> and 
        // adds it to the DOM
        var div = document.createElement("div");
        div.className += "overlay";
        document.body.appendChild(div);
    }
});