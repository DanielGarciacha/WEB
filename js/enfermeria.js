document.addEventListener('DOMContentLoaded', function(){
    const apiUrl = 'http://127.0.0.1:3000';

    // Inicializar la tabla como un DataTable
    const table = $('#dataTable').DataTable({
        "paging": true,        // Habilita la paginación
        "searching": true,     // Habilita la barra de búsqueda
        "ordering": true,      // Habilita la ordenación de columnas
        "info": true           // Muestra información sobre los registros
    });

    // Función para cargar la lista de usuarios
    function loadUserList() {
        axios.get(`${apiUrl}/getAll_enfer`)
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

    // Llama a la función para cargar la lista de usuarios al cargar la página
    loadUserList();
});
