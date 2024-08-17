document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('PSIFORM');
    form.addEventListener('submit', function(event) {
        event.preventDefault();

        const motivo = document.getElementById('MC').value;
        const fecha = document.getElementById('rc').value;
        const hora = document.getElementById('hora').value;
        const sede = document.getElementById('AR').value;
        const identificacion = document.getElementById('identificacion').value;

        if (!motivo || !fecha || !hora || !sede || !identificacion) {
            document.getElementById('response').innerText = "Todos los campos son necesarios";
            return;
        }

        console.log('Datos a enviar:', {
            motivo: motivo,
            fecha: fecha,
            hora: hora,
            sede: sede,
            identificacion: identificacion
        });

        axios.post('http://127.0.0.1:3000/citas', {
            motivo: motivo,
            fecha: fecha,
            hora: hora,
            sede: sede,
            identificacion: identificacion
        })
        .then(response => {
            document.getElementById('response').innerText = response.data.informacion;
            form.reset();
        })
        .catch(error => {
            console.error('Error en la solicitud:', error);
            let errorMessage = "Error al guardar los datos";

            if (error.response && error.response.data && error.response.data.informacion) {
                errorMessage = error.response.data.informacion;
            } else if (error.message) {
                errorMessage = error.message;
            }

            document.getElementById('response').innerText = errorMessage;
        });
    });
});

