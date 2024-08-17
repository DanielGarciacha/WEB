function cerrarSesion(event) {
    event.preventDefault();
    
    fetch('http://127.0.0.1:3000/api/cerrar-sesion', {
        method: 'POST',
        credentials: 'include'  // Importante para incluir cookies en la solicitud
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Limpiar datos locales
            localStorage.clear();
            sessionStorage.clear();
            
            // Redirigir a la página de inicio
            window.location.href = '../index.html';
        } else {
            console.error('Error al cerrar sesión');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

// Asegúrate de que este código se ejecute cuando la página se cargue
document.addEventListener('DOMContentLoaded', function() {
    const cerrarSesionBtn = document.getElementById('cerrarSesionBtn');
    if (cerrarSesionBtn) {
        cerrarSesionBtn.addEventListener('click', cerrarSesion);
    }

    // Prevenir navegación hacia atrás
    history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };
});