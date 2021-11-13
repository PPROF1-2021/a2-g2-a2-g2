<?php 
    include_once '../funciones/sessiones.php';
    include_once 'templates/header.php';
    include_once 'templates/sidebar.php';
    include_once 'templates/barra.php';
?>

<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col p-0 m-2">
                <div class="card">
                    <div class="card-header">
                        <h3>Proyecto 1</h3>
                    </div>
                    <div class="card-body">
                        <h5>Descripción:</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem repellat cumque, laudantium delectus deserunt at odio officiis molestias consequuntur recusandae autem ratione iure quasi totam animi enim quaerat corporis
                            quis.
                        </p>
                        <h5>Tareas:</h5>
                        <ul class="list-unstyled tareas">
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 1</li>
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 2</li>
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 3</li>
                            <li><i class="fas fa-sync-alt text-warning"></i>Tarea 4</li>
                            <li><i class="fas fa-times text-danger"></i>Tarea 5</li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 70%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <a href="proyecto.html" class="btn btn-dark">Ver Más</a>
                    </div>
                </div>
            </div>
            <div class="col p-0 m-2">
                <div class="card">
                    <div class="card-header">
                        <h3>Proyecto 2</h3>
                    </div>
                    <div class="card-body">
                        <h5>Descripción:</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem repellat cumque, laudantium delectus deserunt at odio officiis molestias consequuntur recusandae autem ratione iure quasi totam animi enim quaerat corporis
                            quis.
                        </p>
                        <h5>Tareas:</h5>
                        <ul class="list-unstyled tareas">
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 1</li>
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 2</li>
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 3</li>
                            <li><i class="fas fa-sync-alt text-warning"></i>Tarea 4</li>
                            <li><i class="fas fa-times text-danger"></i>Tarea 5</li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 70%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <a href="proyecto.html" class="btn btn-dark">Ver Más</a>
                    </div>
                </div>
            </div>
            <div class="col p-0 m-2">
                <div class="card">
                    <div class="card-header">
                        <h3>Proyecto 3</h3>
                    </div>
                    <div class="card-body">
                        <h5>Descripción:</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem repellat cumque, laudantium delectus deserunt at odio officiis molestias consequuntur recusandae autem ratione iure quasi totam animi enim quaerat corporis
                            quis.
                        </p>
                        <h5>Tareas:</h5>
                        <ul class="list-unstyled tareas">
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 1</li>
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 2</li>
                            <li><i class="fas fa-check-circle text-success"></i>Tarea 3</li>
                            <li><i class="fas fa-sync-alt text-warning"></i>Tarea 4</li>
                            <li><i class="fas fa-times text-danger"></i>Tarea 5</li>
                        </ul>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 70%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <a href="proyecto.html" class="btn btn-dark">Ver Más</a>

                    </div>
                </div>
            </div>
        </div>

    </section>
</div>

</main>
</div>


    <div class="position-fixed bottom-0 start-0 p-3" style="z-index:11;">
        <div class="toast-container">
            <div class="toast fade" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <img src="img/logo.jpg" class="rounded me-2" width="30" alt="...">
                    <strong class="me-auto">ProjectApp</strong>
                    <small class="text-muted">Ahora</small>
                    <button type="button" id="toast2" class="btn-close" data-bs-dismiss="toast" aria-label="Close" value=0></button>
                </div>
                <div class="toast-body">
                    Entrega de tarea próximo a vencer
                </div>
            </div>

            <div class="toast fade" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <img src="img/logo.jpg" class="rounded me-2" width="30" alt="...">
                    <strong class="me-auto">ProjectApp</strong>
                    <small class="text-muted">Hace 30 min</small>
                    <button type="button" id="toast1" class="btn-close" data-bs-dismiss="toast" aria-label="Close" value=1></button>
                </div>
                <div class="toast-body">
                    Usuario 1 te ha agregado en un proyecto
                </div>
            </div>
        </div>
    </div>

<?php 
    include_once 'templates/footer.php';
?>