$(document).ready(function() {
    //carga las notificaciones
    $('.toast').addClass('show');
    //elimina las notificaciones
    $('.btn-close').click(function(e) {
        var id = e.target.id;
        $("#" + id).parent().parent().hide();
    });
});