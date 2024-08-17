document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('login-form');
    const messageDiv = document.getElementById('message');
    const limpiarBtn = document.getElementById('limpiarBtn');

    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        
        axios.post('http://127.0.0.1:3000/login', {
            username: username,
            password: password
        })
        .then(function (response) {
            if (response.data.success) {
                localStorage.setItem('token', response.data.token); // Guardar el token
                messageDiv.innerHTML = `<div class="alert alert-success">Bienvenido, ${response.data.username}. Tu rol es: ${response.data.role}</div>`;
                
                switch(response.data.role) {
                    case 'admin':
                        window.location.href = 'html/admin.html';
                        break;
                    case 'estudiante':
                        window.location.href = 'html/estudiantes.html';
                        break;
                    case 'estudiante2':
                        window.location.href = 'html/estudiantes2.html';
                        break;
                    case 'enfermeria':
                        window.location.href = 'html/enfermeria.html';
                        break;
                    case 'psicologo':
                        window.location.href = 'html/psicologos.html';
                        break;
                    default:
                        messageDiv.innerHTML += '<div class="alert alert-warning">Rol no reconocido. Contacte al administrador.</div>';
                }
            } else {
                messageDiv.innerHTML = '<div class="alert alert-danger">Usuario o contraseña incorrectos</div>';
            }
        })
        .catch(function (error) {
            console.error('Error:', error);
            messageDiv.innerHTML = '<div class="alert alert-danger">Error al intentar iniciar sesión</div>';
        });
    });

    limpiarBtn.addEventListener('click', function() {
        loginForm.reset();
        messageDiv.innerHTML = '';
    });
});

function togglePassword() {
    const passwordInput = document.getElementById('password');
    const togglePasswordIcon = document.getElementById('togglePassword');
    
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        togglePasswordIcon.classList.replace('fa-eye', 'fa-eye-slash');
    } else {
        passwordInput.type = 'password';
        togglePasswordIcon.classList.replace('fa-eye-slash', 'fa-eye');
    }
}


