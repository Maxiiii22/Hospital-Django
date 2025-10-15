const modal = document.getElementById("editModal");
const closeModalBtn = document.getElementById("closeEditModal");
const btnGuardar = document.querySelector(".btn-guardar");

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
    document.getElementById("parte-estudios").style.display = "none";
    document.getElementById("parte-medicamentos").style.display = "none";
    document.getElementById("parte-consultas").style.display = "block";
    document.getElementById("modal-title").textContent = "Detalle de la consulta";
    document.getElementById("textProfesional").textContent = "Profesional a cargo:";
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

function abrirDetalleEstudios(btn) {
    modal.classList.add("show");
    document.getElementById("parte-consultas").style.display = "none";
    document.getElementById("parte-medicamentos").style.display = "none";
    document.getElementById("parte-estudios").style.display = "block";
    document.getElementById("modal-title").textContent = "Detalles del estudio";
    document.getElementById("textProfesional").textContent = "Solicitado por:";
    document.body.style.overflow = "hidden";
    document.documentElement.style.overflow = "hidden"; 
    document.getElementById("modalProfesional").textContent = btn.dataset.profesional;
    document.getElementById("modalPaciente").textContent = btn.dataset.paciente;
    document.getElementById("modalFecha").textContent = btn.dataset.fecha;
    document.getElementById("modalTipoEstudio").textContent = btn.dataset.tipoEstudio;
    document.getElementById("modalMotivo").innerHTML = btn.dataset.motivo;
    document.getElementById("modalIndicaciones").textContent = btn.dataset.indicaciones;
}

function abrirDetalleMedicamento(btn) {
    modal.classList.add("show");
    document.getElementById("parte-consultas").style.display = "none";
    document.getElementById("parte-estudios").style.display = "none";
    document.getElementById("parte-medicamentos").style.display = "block";
    document.getElementById("modal-title").textContent = "Detalles del medicamento";
    document.getElementById("textProfesional").textContent = "Recetado por:";
    document.body.style.overflow = "hidden";
    document.documentElement.style.overflow = "hidden"; 
    document.getElementById("modalProfesional").textContent = btn.dataset.profesional;
    document.getElementById("modalPaciente").textContent = btn.dataset.paciente;
    document.getElementById("modalFecha").textContent = btn.dataset.fecha;
    document.getElementById("modalMedicamento").textContent = btn.dataset.medicamento;
    document.getElementById("modalDosis").innerHTML = btn.dataset.dosis;
    document.getElementById("modalFrecuencia").textContent = btn.dataset.frecuencia;
    document.getElementById("modalTiempoUso").textContent = btn.dataset.tiempoUso;
}


let mostrandoFuturos = true;
function toggleTurnos() {
    if (mostrandoFuturos) {
        document.getElementById("titulo").textContent = "Turnos anteriores para especialidades médicas";
        document.getElementById("turnos-futuros").style.display = "none";
        document.getElementById("turnos-anteriores").style.display = "block";
        document.getElementById("toggleBtn").textContent = "Ver turnos futuros";
    } else {
        document.getElementById("titulo").textContent = "Turnos futuros para especialidades médicas";
        document.getElementById("turnos-futuros").style.display = "block";
        document.getElementById("turnos-anteriores").style.display = "none";
        document.getElementById("toggleBtn").textContent = "Ver turnos anteriores";
    }
    mostrandoFuturos = !mostrandoFuturos;
}

// estudios
let mostrandoEstudiosFuturos = true;
function toggleTurnosEstudios() {
    if (mostrandoEstudiosFuturos) {
        document.getElementById("tituloEstudios").textContent = "Turnos anteriores para estudios";
        document.getElementById("turnosEstudios-futuros").style.display = "none";
        document.getElementById("turnosEstudios-anteriores").style.display = "block";
        document.getElementById("toggleBtn2").textContent = "Ver turnos futuros";
    } else {
        document.getElementById("tituloEstudios").textContent = "Turnos futuros para estudios";
        document.getElementById("turnosEstudios-futuros").style.display = "block";
        document.getElementById("turnosEstudios-anteriores").style.display = "none";
        document.getElementById("toggleBtn2").textContent = "Ver turnos anteriores";
    }
    mostrandoEstudiosFuturos = !mostrandoEstudiosFuturos;
}

// mostrar futuros por defecto
if(document.getElementById("turnos-futuros")){
    document.getElementById("turnos-futuros").style.display = "block";
    document.getElementById("turnos-anteriores").style.display = "none";
    document.getElementById("turnosEstudios-futuros").style.display = "block";
    document.getElementById("turnosEstudios-anteriores").style.display = "none";
}


document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.btn-modal').forEach(btn => {
        btn.addEventListener("click", async () => {
            const id_menor = btn.dataset.idMenor; 
            const id_turno = btn.dataset.idTurno; 
            const id_turnoEstudio = btn.dataset.idTurnoEstudio; 
            const id_paciente = btn.dataset.idPaciente; 

            if (id_menor){
                try {
                    const response = await fetch(`/pacientes/gestion-menor/?id=${id_menor}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
        
                    document.getElementById("id_menor").value = data.id;
                    document.getElementById("id_dni").value = data.dni;
                    document.getElementById("id_first_name").value = data.nombre;
                    document.getElementById("id_last_name").value = data.apellido;
                    document.getElementById("id_sexo").value = data.sexo;
                    document.getElementById("id_fecha_nacimiento").value = data.fecha_nacimiento;
                    document.getElementById("id_parentesco").value = data.parentesco;
        
                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";
                } catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            if (id_turno){
                try {
                    const response = await fetch(`/pacientes/turnos/reprogramar/${id_paciente}/?id=${id_turno}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
        
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


                    document.getElementById("editForm").action = `/pacientes/turnos/reprogramar/${id_turno}/`;
                    
                } catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            if (id_turnoEstudio){
                try {
                    const response = await fetch(`/pacientes/turnos/reprogramar-estudio/${id_paciente}/?id=${id_turnoEstudio}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
        
                    let currentDate = new Date();
                    let monthOffset = 0;
            
                    // Convertir las fechas disponibles a un array de fechas para fácil comparación
                    const fechasDisponibles = data.dias_disponibles.map(d => d.fecha);;
                            
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
                                    alert(`Fecha seleccionada: ${fechaSeleccionada}`);
                                    botonDia.classList.add('seleccionado');
                                    botonSeleccionado = botonDia;
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


                    document.getElementById("editForm").action = `/pacientes/turnos/reprogramar-estudio/${id_turnoEstudio}/`;

                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
        });
    })

    document.querySelectorAll('.box-estudio').forEach(box => {
        box.addEventListener("click", async () => {
            console.log("je")
            const id_orden = box.dataset.idOrden; 
            const id_paciente = box.dataset.idPaciente; 
            try {
                const response = await fetch(`/pacientes/turnos/solicitar-estudio/${id_paciente}/?id_orden=${id_orden}`, {
                    headers: {
                        "X-Requested-With": "XMLHttpRequest"
                    }
                });
    
                if (!response.ok) throw new Error("Error al obtener datos");
    
                const data = await response.json();

                document.getElementById("id_orden").value = data.id_orden;
                document.getElementById("servicio").value = data.id_servicio;
                document.getElementById("lugar").value = data.lugar_id;
                document.getElementById("orden").innerHTML = `<strong>N° Orden:</strong> ${data.id_orden}`;
                document.getElementById("p-servicio").innerHTML = `<strong>Realizado por:</strong> ${data.nombre_servicio}`;
                document.getElementById("p-lugar").innerHTML = `<strong>Lugar:</strong> ${data.lugar_nombre} (${data.lugar_tipo}) - <strong>Piso</strong> ${data.lugar_piso} - <strong>Codigo</strong> ${data.lugar_codigo}`;
                document.getElementById("estudio").innerHTML = `<strong>Estudio:</strong> ${data.nombre_estudio}`;
                document.getElementById("horario").innerHTML = `<strong>Horario:</strong> ${data.horario}`;


                let currentDate = new Date();
                let monthOffset = 0;
        
                // Convertir las fechas disponibles a un array de fechas para fácil comparación
                const fechasDisponibles = data.dias_disponibles.map(d => d.fecha);;
        
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
                                alert(`Fecha seleccionada: ${fechaSeleccionada}`);
                                botonDia.classList.add('seleccionado');
                                botonSeleccionado = botonDia;
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

 
                
            } catch (err) {
                alert("Error al cargar los datos");
                console.error(err);
            }
        })
    })


    closeModalBtn.addEventListener("click", () => {
        modal.classList.remove("show");
        document.body.style.overflow = "auto";
        document.documentElement.style.overflow = "auto";

    });

    window.addEventListener("click", (e) => {
        if (e.target === modal) {
            modal.classList.remove("show");
            document.body.style.overflow = "auto";
            document.documentElement.style.overflow = "auto";

        }
    });

});











