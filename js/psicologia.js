document.addEventListener('DOMContentLoaded', function() {
    const apiUrl = 'http://127.0.0.1:3000'; // URL base para el API

    // Inicializar la tabla como un DataTable
    const table = $('#dataTable').DataTable({
        "paging": true,        // Habilita la paginación
        "searching": true,     // Habilita la barra de búsqueda
        "ordering": true,      // Habilita la ordenación de columnas
        "info": true           // Muestra información sobre los registros
    });

    // Función para cargar la lista de usuarios
    function loadUserList() {
        axios.get(`${apiUrl}/getAll_psi`)
            .then(response => {
                console.log("Datos recibidos:", response.data); // Log de datos recibidos

                // Limpiar el contenido previo de la tabla
                table.clear();

                // Agregar los nuevos datos a la tabla
                response.data.forEach(user => {
                    table.row.add([
                        user.nombre_apellidos,
                        user.correo,
                        user.genero,
                        user.motivo,
                        user.fecha_reserva,
                        user.hora_reserva,
                        user.sede,
                        user.user_id,
                        `
                         <button class="btn btn-danger btn-sm" onclick="deleteUser(${user.user_id})">Eliminar</button>`
                    ]).draw(false);
                });
            })
            .catch(error => {
                console.error('Error fetching user list:', error);
            });
    }

    // Función para redirigir a la página de recomendación
    window.redirectToRecommendation = function(userId) {
        console.log(`Redirigiendo a recomendación con userId: ${userId}`);
        // Corregir la ruta para que sea relativa desde la ubicación de los archivos JS
        window.location.href = `recom_psicologo.html`;
    };

    // Función para eliminar un usuario
    window.deleteUser = function(userId) {
        if (confirm('¿Estás seguro de que deseas eliminar este usuario?')) {
            axios.delete(`${apiUrl}/delete/${userId}`)
                .then(response => {
                    alert(response.data.informacion);
                    loadUserList(); // Actualizar la lista después de eliminar
                })
                .catch(error => {
                    console.error('Error eliminando usuario:', error);
                    alert('Error al eliminar el usuario');
                });
        }
    };

    // Cargar la lista de usuarios al iniciar la página
    loadUserList();

    // Opcional: Agregar un botón de recarga manual
    const reloadButton = document.getElementById('reloadButton');
    if (reloadButton) {
        reloadButton.addEventListener('click', loadUserList);
    }

    // Opcional: Configurar recarga automática cada cierto tiempo
    // setInterval(loadUserList, 60000); // Recarga cada 60 segundos
});

// Función para cerrar sesión
function cerrarSesion() {
    fetch(`${apiUrl}/api/cerrar-sesion`, {
        method: 'POST',
        credentials: 'include'
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            localStorage.clear();
            sessionStorage.clear();
            window.location.href = '../index.html';
        } else {
            console.error('Error al cerrar sesión');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

// Asignar el evento de cierre de sesión al botón correspondiente
document.addEventListener('DOMContentLoaded', function() {
    const cerrarSesionBtn = document.getElementById('cerrarSesionBtn');
    if (cerrarSesionBtn) {
        cerrarSesionBtn.addEventListener('click', cerrarSesion);
    }

    // Prevenir navegación hacia atrás después de cerrar sesión
    history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };
});

