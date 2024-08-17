document.addEventListener('DOMContentLoaded', function() {
    const apiUrl = 'http://localhost:3000'; // Cambia esto según tu configuración

    // Obtener la cantidad de usuarios y mostrar en la pestaña "Inicio"
    function updateUserCount() {
        axios.get(`${apiUrl}/getAll`)
            .then(response => {
                const count = response.data.length;
                document.getElementById('userCount').textContent = `Número total de usuarios: ${count}`;
            })
            .catch(error => console.error('Error fetching user count:', error));
    }

    // Obtener la lista de usuarios y mostrar en la pestaña "Lista de Usuarios"
    function loadUserList() {
        axios.get(`${apiUrl}/getAll`)
            .then(response => {
                const tableBody = document.querySelector('#dataTable tbody');
                tableBody.innerHTML = ''; // Limpiar el contenido previo
                response.data.forEach(user => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${user.id}</td>
                        <td>${user.nombre}</td>
                        <td>${user.identificacion}</td>
                        <td>${user.correo}</td>
                        <td>${user.telefono}</td>
                        <td>${user.username}</td>
                        <td>${user.rol}</td>
                        <td>
                            <button class="btn btn-danger btn-sm" onclick="deleteUser(${user.id})">Eliminar</button>
                        </td>
                    `;
                    tableBody.appendChild(row);
                });
            })
            .catch(error => console.error('Error fetching user list:', error));
    }

    // Agregar un nuevo usuario
    document.getElementById('userForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(event.target);
        const userData = {
            nombre: formData.get('nombre'),
            identificacion: formData.get('identificacion'),
            correo: formData.get('correo'),
            telefono: formData.get('telefono'),
            username: formData.get('username'),
            password: formData.get('password'),
            rol: formData.get('rol')
        };
        
        axios.post(`${apiUrl}/add_contact`, userData)
            .then(response => {
                document.getElementById('formResult').textContent = response.data.informacion;
                loadUserList(); // Actualizar la lista después de agregar
                updateUserCount(); // Actualizar el conteo después de agregar
            })
            .catch(error => console.error('Error adding user:', error));
    });

    // Actualizar un usuario
    document.getElementById('updateForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(event.target);
        const userData = {
            nombre: formData.get('nombre'),
            identificacion: formData.get('identificacion'),
            correo: formData.get('correo'),
            telefono: formData.get('telefono'),
            username: formData.get('username'),
            password: formData.get('password'),
            rol: formData.get('rol')
        };
        const userId = formData.get('id');
    
        axios.put(`${apiUrl}/update/${userId}`, userData)
            .then(response => {
                document.getElementById('updateResult').textContent = response.data.informacion;
                loadUserList(); // Función para cargar la lista de usuarios después de actualizar
            })
            .catch(error => console.error('Error actualizando usuario:', error));
    });
    
    

    // Eliminar un usuario
    window.deleteUser = function(userId) {
        axios.delete(`${apiUrl}/delete/${userId}`)
            .then(response => {
                document.getElementById('deleteResult').textContent = response.data.informacion;
                loadUserList(); // Actualizar la lista después de eliminar
                updateUserCount(); // Actualizar el conteo después de eliminar
            })
            .catch(error => console.error('Error eliminando usuario:', error));
    };
    
    
    

    // Editar un usuario (Cargar datos en el formulario de actualización)
    window.editUser = function(userId) {
        axios.get(`${apiUrl}/getAllById/${userId}`)
            .then(response => {
                if (response.data.length > 0) {
                    const user = response.data[0];
                    document.getElementById('updateId').value = user.id;
                    document.getElementById('updateNombre').value = user.nombre;
                    document.getElementById('updateIdentificacion').value = user.identificacion;
                    document.getElementById('updateCorreo').value = user.correo;
                    document.getElementById('updateTelefono').value = user.telefono;
                    document.getElementById('updateUsername').value = user.username;
                    document.getElementById('updatePassword').value = ''; // No se debe prellenar la contraseña
                    document.getElementById('updateRol').value = user.rol;
                }
            })
            .catch(error => console.error('Error fetching user details:', error));
    }

    // Inicializar la página
    updateUserCount();
    loadUserList();
});
