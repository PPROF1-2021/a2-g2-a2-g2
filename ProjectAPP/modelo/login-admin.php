<?php
    if(isset($_POST["login-user"])){
        include_once '../funciones/funciones.php';
        if($_POST["login-user"] == "comprobar-correo"){
            $correo = $_POST["correo"];
            try {
                include_once '../funciones/funciones.php';
                //die(json_encode($respuesta));
                
                $stmt = $conex->prepare("SELECT email FROM usuarios WHERE email = ?");
                $stmt->bind_param("s", $correo);

                $stmt->execute();
                if($stmt->fetch()){
                    $respuesta = array(
                        'respuesta' => 'existe'
                    );
                }else{
                    $respuesta = array(
                        'respuesta' => 'no-existe'
                    );
                }
            } catch (Exception $e) {
                $respuesta = array(
                    'respuesta' => 'error',
                    'error' => "Error: " . $e->getMessage
                );
            }
            die(json_encode($respuesta));
        }
        if($_POST["login-user"] == "registrar-usuario"){

            $nombre_usuario = strtolower($_POST["nombre-usuario"]);
            $email = strtolower($_POST["correo"]);
            
            $password = $_POST["password"];

            //hashear constraseña
            $opciones = array(
                'cost' => 12
            );
            $password_hasheado = password_hash($password, PASSWORD_BCRYPT, $opciones);

            try {
                $stmt = $conex->prepare("INSERT INTO usuarios (nombre,email,fecha_registro,contrasena,idTipo) VALUES(?,?,NOW(),?,'usuario')");
                $stmt->bind_param("sss",$nombre_usuario,$email,$password_hasheado);
                $stmt->execute();
                $id_insertado = $stmt->insert_id;
                $error = $stmt->errno;
                if($id_insertado > 0){
                    $respuesta = array(
                        'respuesta' => 'correcto',
                        'id_admin' => $id_insertado
                   );
                   session_start();
                   $_SESSION['id'] = $id_insertado;
                   $_SESSION['usuario'] = $nombre_usuario;
                   $_SESSION['tipo'] = 'usuario';
                }else{
                    $respusta = array(
                        'respuesta' => 'error',
                        'error' => $error
                    );
                }
                $stmt->close();
                $conex->close();
            } catch (Exception $e) {
                $respuesta  = array(
                    'respuesta' => 'error',
                    'error' => "Error: " . $e->getMessage()
                );
            }
            die(json_encode($respuesta));
        }
        if($_POST["login-user"] == "ingresar"){
            $correo = strtolower($_POST["usuario"]);
            $password = $_POST["password"];
            try {
                $stmt = $conex->prepare("SELECT idUsuario, nombre, email, contrasena FROM usuarios where email = ?");
                $stmt->bind_param("s", $correo);

                $stmt->execute();
                $stmt->bind_result($idUsuario,$nombreUsuario,$correoUsuario,$passwordUsuario);

                if($stmt->affected_rows){
                    if($stmt->fetch()){
                        if(password_verify($password,$passwordUsuario)){
                            session_start();
                            $_SESSION['id'] = $idUsuario;
                            $_SESSION['usuario'] = $nombreUsuario;
                            $_SESSION['tipo'] = 'usuario';
                            $respuesta = array(
                                'respuesta' => 'exito',
                                'usuario' => $nombreUsuario
                            );
                        }else{
                            $respuesta = array(
                                'respuesta' => 'error'
                            );
                        }
                    }else{
                        $respuesta = array(
                            'respuesta' => 'error'
                        );
                    }
                }
                $stmt->close();
                $conex->close();
            } catch (Exception $e) {
                $respuesta = array(
                    'respuesta' => 'error',
                    'error' => "Error: " . $e->getMessage()
                );
            }
            die(json_encode($respuesta));
        }
    }
?>
