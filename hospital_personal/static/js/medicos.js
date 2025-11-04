const modal = document.getElementById("editModal");
const formDelModal = document.getElementById("editForm");
const closeModalBtn = document.getElementById("closeEditModal");

function decodeNewlines(text) {
    return text
        .replace(/\\u000D\\u000A/g, '\n')   // reemplaza \u000D\u000A por salto de línea
        .replace(/\\n/g, '\n')              // reemplaza \n por salto de línea
        .replace(/\\r/g, '\r')              // reemplaza \r si existiera
        .replace(/\\u002D/g, '-')           // reemplaza \u002D por guion
        .replace(/\\u002E/g, '.')           // (opcional) reemplaza \u002E por punto
        .replace(/\\u002C/g, ',');          // (opcional) reemplaza \u002C por coma
}

function abrirDetalle(btn) {
    modal.classList.add("show");
    document.body.style.overflow = "hidden";
    document.documentElement.style.overflow = "hidden"; 
    document.getElementById("modalProfesional").textContent = btn.dataset.profesional;
    document.getElementById("modalPaciente").textContent = btn.dataset.paciente;
    document.getElementById("modalFecha").textContent = btn.dataset.fecha;
    document.getElementById("modalDiagnostico").textContent = decodeNewlines(btn.dataset.diagnostico);
    document.getElementById("modalObservaciones").textContent = decodeNewlines(btn.dataset.observaciones);
    document.getElementById("modalTratamiento").textContent = decodeNewlines(btn.dataset.tratamiento);
    document.getElementById("modalEstudios").innerHTML = btn.dataset.estudios;
    document.getElementById("modalMedicaciones").textContent = decodeNewlines(btn.dataset.medicaciones);
}



function agregarFilaFormset(prefix, tbodySelector) {
    // Ej: prefix = 'estudios' o 'medicaciones'
    const totalFormsInput = document.getElementById(`id_${prefix}-TOTAL_FORMS`);
    const formNum = parseInt(totalFormsInput.value, 10);
    const tbody = document.querySelector(tbodySelector);
    const lastRow = tbody.querySelector('tr:last-child');
    const newRow = lastRow.cloneNode(true);

    // Reemplazar todos los name/id "prefix-<n>-" por el nuevo índice
    const regex = new RegExp(`${prefix}-(\\d+)-`, 'g');

    // Limpia valores y reindexa
    newRow.querySelectorAll('input, select, textarea, label').forEach(el => {
        // Reindexar name
        if (el.name) el.name = el.name.replace(regex, `${prefix}-${formNum}-`);
        // Reindexar id
        if (el.id) el.id = el.id.replace(regex, `${prefix}-${formNum}-`);
        // Reindexar for (labels)
        if (el.htmlFor) el.htmlFor = el.htmlFor.replace(regex, `${prefix}-${formNum}-`);

        // Limpiar valores (excepto opciones <select> sin selección)
        if (el.tagName === 'INPUT') {
            if (el.type === 'checkbox' || el.type === 'radio') {
                el.checked = false;
            } 
            else {
                el.value = '';
            }
        } 
        else if (el.tagName === 'TEXTAREA') {
            el.value = '';
            el.textContent = '';
        }
        else if (el.tagName === 'SELECT') {
            el.selectedIndex = 0; // primera opción (placeholder)
        }
    });
    // Agregar la fila y actualizar el TOTAL_FORMS
    tbody.appendChild(newRow);
    totalFormsInput.value = formNum + 1;
}

function abrirDetalleEstudios(btn) {
    modal.classList.add("show");
    document.getElementById("parte-medicamentos").style.display = "none";
    document.getElementById("parte-estudios").style.display = "block";
    document.getElementById("modal-title").textContent = "Detalles del estudio";
    document.body.style.overflow = "hidden";
    document.documentElement.style.overflow = "hidden"; 
    document.getElementById("modalTipoEstudio").textContent = btn.dataset.tipoEstudio;
    document.getElementById("modalMotivo").innerHTML = btn.dataset.motivo;
    document.getElementById("modalIndicaciones").textContent = btn.dataset.indicaciones;
    document.getElementById("modalEstado").innerHTML = btn.dataset.estado;
}

function abrirDetalleMedicamento(btn) {
    modal.classList.add("show");
    document.getElementById("parte-estudios").style.display = "none";
    document.getElementById("parte-medicamentos").style.display = "block";
    document.getElementById("modal-title").textContent = "Detalles del medicamento";
    document.body.style.overflow = "hidden";
    document.documentElement.style.overflow = "hidden"; 
    document.getElementById("modalMedicamento").textContent = btn.dataset.medicamento;
    document.getElementById("modalDosis").innerHTML = btn.dataset.dosis;
    document.getElementById("modalFrecuencia").textContent = btn.dataset.frecuencia;
    document.getElementById("modalTiempoUso").textContent = btn.dataset.tiempoUso;
}



document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll('.btn-modal').forEach(btn => {
            btn.addEventListener("click", async () => {
                const id_turno = btn.dataset.idTurno; 
    
                if (id_turno){
                    try {
                        const response = await fetch(`/personal/turnos/reprogramar/1/?id=${id_turno}`, {
                            headers: {
                                "X-Requested-With": "XMLHttpRequest"
                            }
                        });
            
                        if (!response.ok) throw new Error("Error al obtener datos");
            
                        const data = await response.json();


                        const btnReprogramar = document.querySelector(".btn-form-reprogramar");
                        btnReprogramar.disabled = true;
                        let currentDate = new Date();
                        let monthOffset = 0;
                
                        // Convertir las fechas disponibles a un array de fechas para fácil comparación
                        const fechasDisponibles = data.dias_disponibles.flatMap(profesional => 
                            profesional.disponibilidad.map(dia => dia.fecha)
                        );
                
                
                        const nombreMes = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                                           "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                
                        let botonSeleccionado = null;
                
                        // Función para crear el calendario con todos los días del mes
                        function crearCalendario() {
                            const calendar = document.getElementById('calendar');
                            calendar.innerHTML = '';  // Limpiar el calendario antes de volver a generarlo
                
                            // Fecha de inicio (primer día del mes)
                            const fechaInicio = new Date(currentDate);
                            fechaInicio.setMonth(currentDate.getMonth() + monthOffset);
                            fechaInicio.setDate(1);
                
                            // Fecha límite (último día del mes)
                            const fechaLimite = new Date(fechaInicio);
                            fechaLimite.setMonth(fechaInicio.getMonth() + 1);
                            fechaLimite.setDate(0);
                
                            // Mostrar el nombre del mes actual
                            const mesActual = nombreMes[fechaInicio.getMonth()];
                            const header = document.createElement('div');
                            header.classList.add('header');
                            header.textContent = `${mesActual} ${fechaInicio.getFullYear()}`;
                            calendar.appendChild(header);
                
                            // Generar celdas para los días de la semana
                            const diasDeLaSemana = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];
                            for (let i = 0; i < 7; i++) {
                                const diaSemana = document.createElement('div');
                                diaSemana.textContent = diasDeLaSemana[i];
                                diaSemana.style.fontWeight = 'bold';
                                calendar.appendChild(diaSemana);
                            }
                
                            // Generar los días del mes
                            const diaDeLaSemanaInicio = fechaInicio.getDay();
                            let dia = 1;
                
                            // Rellenar con días vacíos al principio
                            for (let i = 0; i < diaDeLaSemanaInicio; i++) {
                                const diaVacio = document.createElement('button');
                                diaVacio.disabled = true;
                                calendar.appendChild(diaVacio);
                            }
                
                            // Mostrar todos los días del mes
                            while (dia <= fechaLimite.getDate()) {
                                const botonDia = document.createElement('button');
                                botonDia.type = "button";
                                botonDia.textContent = dia;
                
                                const fechaDia = new Date(fechaInicio.getFullYear(), fechaInicio.getMonth(), dia);
                                const fechaFormateada = fechaDia.toISOString().split('T')[0];  // Obtener la fecha en formato YYYY-MM-DD
                
                                // Verificar si el día está en la lista de días disponibles
                                if (fechasDisponibles.includes(fechaFormateada)) {
                                    botonDia.classList.add('valid');
                                    botonDia.addEventListener('click', function() {
                                        if (botonSeleccionado) {
                                            botonSeleccionado.classList.remove('seleccionado');
                                        }
                                        const fecha = document.getElementById("fecha_seleccionada");
                                        const fechaSeleccionada = `${fechaDia.getFullYear()}-${fechaDia.getMonth() + 1}-${fechaDia.getDate()}`;
                                        fecha.value = fechaSeleccionada;
                                        botonDia.classList.add('seleccionado');
                                        botonSeleccionado = botonDia;
                                        btnReprogramar.disabled = false;
                                    });
                                } else {
                                    botonDia.disabled = true;
                                    botonDia.classList.add('no-seleccionable');
                                }
                
                                calendar.appendChild(botonDia);
                                dia++;
                            }
                
                            // Rellenar con días vacíos al final si es necesario
                            const diaDeLaSemanaFin = fechaLimite.getDay();
                            if (diaDeLaSemanaFin !== 6) {
                                for (let i = diaDeLaSemanaFin + 1; i < 7; i++) {
                                    const diaVacio = document.createElement('button');
                                    diaVacio.disabled = true;
                                    calendar.appendChild(diaVacio);
                                }
                            }
                        }
                
                        // Función para ir al mes anterior
                        document.getElementById('prevMonth').addEventListener('click', function() {
                            monthOffset--;
                            crearCalendario();
                        });
                
                        // Función para ir al mes siguiente
                        document.getElementById('nextMonth').addEventListener('click', function() {
                            monthOffset++;
                            crearCalendario();
                        });
                
                        // Inicializar el calendario
                        crearCalendario();        
                        
                        modal.classList.add("show");
                        document.body.style.overflow = "hidden"; 
                        document.documentElement.style.overflow = "hidden";
    
    
                        document.getElementById("editForm").action = `/personal/turnos/reprogramar/${id_turno}/`;
                        
                    } catch (err) {
                        alert("Error al cargar los datos");
                        console.error(err);
                    }
                }
            });
        });


    if(closeModalBtn){
        closeModalBtn.addEventListener("click", () => {
            modal.classList.remove("show");
            document.body.style.overflow = "auto";
            document.documentElement.style.overflow = "auto";
        });
    }

    window.addEventListener("click", (e) => {
        if (e.target === modal) {
            modal.classList.remove("show");
            document.body.style.overflow = "auto";
            document.documentElement.style.overflow = "auto";
        }
    });


});













