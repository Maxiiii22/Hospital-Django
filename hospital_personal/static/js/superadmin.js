const modal = document.getElementById("editModal");
const formDelModal = document.getElementById("editForm");
const closeModalBtn = document.getElementById("closeEditModal");
const btnGuardar = document.querySelector(".btn-guardar");
const btnNewTipoUsuario = document.getElementById("newTipoUsuario");
const btnNewRolProfesional = document.getElementById("newRolProfesional");
const btnNewDepartamento = document.getElementById("newDepartamento");
const btnNewEspecialidad = document.getElementById("newEspecialidad");
const btnNewLugarTrabajo = document.getElementById("newLugarTrabajo");
const btnNewAsignacion = document.getElementById("newAsignaciones");
const btnNewServicio= document.getElementById("newServicio");
const btnNewEstudio= document.getElementById("newEstudio");
const btnNewLugar= document.getElementById("newLugar");
const btnPlantillaEstudio= document.getElementById("newPlantillaEstudio");

function resaltarElementoDesdeHash() {
    const hash = window.location.hash;
    if (hash) {
        const targetRow = document.querySelector(hash);
        if (targetRow) {
            targetRow.classList.add('resaltar');
            
            setTimeout(() => {
                targetRow.classList.remove('resaltar');
                history.replaceState(null, null, window.location.pathname + window.location.search);  // Quitar el hash de la URL sin recargar la página
            }, 3000);
        }
    }
}
window.addEventListener('hashchange', resaltarElementoDesdeHash); // // Ejecutar también cuando el hash cambie sin recargar la página

/* Esto es solo efecto de scroll */
const scrollable = document.querySelector('.box-multipleCheck');
if (scrollable){
const fade = document.querySelector('.fade-bottom');
scrollable.addEventListener('scroll', () => {
    const scrolledToBottom = scrollable.scrollTop + scrollable.clientHeight >= scrollable.scrollHeight - 1;

    fade.style.opacity = scrolledToBottom ? '0' : '1';
});
}


function abrirDetalle(btn) {
    modal.classList.add("show");
    document.body.style.overflow = "hidden";
    document.documentElement.style.overflow = "hidden"; 
    document.getElementById("modalTipoPaciente").innerHTML = btn.dataset.tipoPaciente;
    document.getElementById("modalPaciente").textContent = btn.dataset.paciente;
    document.getElementById("modalDni").textContent = btn.dataset.dni;
    document.getElementById("modalFechaNacimiento").textContent = btn.dataset.fechaNacimiento;
    document.getElementById("modalSexo").textContent = btn.dataset.sexo;
    document.getElementById("modalEmail").textContent = btn.dataset.email;
    document.getElementById("modalTelefono").textContent = btn.dataset.telefono;
    document.getElementById("modalDireccion").textContent = btn.dataset.direccion;
    document.getElementById("modalFechaRegistro").textContent = btn.dataset.fechaRegistro;
    document.getElementById("modalUltimoAcceso").textContent = btn.dataset.ultimoAcceso;
    document.getElementById("modalEstado").textContent = btn.dataset.estado;
}


async function obtenerDisponibilidadLugar(){
    const id_lugar = document.getElementById("id_lugar").value;
    const usuario_id = document.getElementById("identificadorUsuario").value;
    const container = document.querySelector("#seccion-lugarTrabajo");

    if (id_lugar === "") {
        const checkboxes = container.querySelectorAll('input[type="checkbox"][name="jornada"]');
        checkboxes.forEach(checkbox => {
            const label = checkbox.closest("label");
            if (label) {
            const originalText = label.getAttribute('data-original-text');
            if (originalText) {
                label.innerHTML = '';
                label.appendChild(checkbox);
                label.append(` ${originalText}`);
            }
            }
        });
        return; // No seguimos al fetch si el valor es vacío
    }
    try {
        const response = await fetch(`/personal/get-lugarTrabajoDisponibilidad/?id=${id_lugar}&usuario_id=${usuario_id}`, {
            headers: {
                "X-Requested-With": "XMLHttpRequest"
            }
        });

        if (!response.ok) throw new Error("Error al obtener datos");

        const data = await response.json();
        console.log(data)
        const disponibilidad = data.disponibilidad;

        const container = document.querySelector("#seccion-lugarTrabajo");

        for (const jornadaId in disponibilidad) {
            if (disponibilidad.hasOwnProperty(jornadaId)) {
                const jornadas = disponibilidad[jornadaId];
    
                jornadas.forEach(jornada => {
                    const checkbox = container.querySelector(`input[type="checkbox"][value="${jornada.id}"]`);
                    if (checkbox) {
                        const label = checkbox.closest("label");
                        if (label) {
                            const originalText = label.getAttribute('data-original-text') || label.innerText.trim();
                            label.setAttribute('data-original-text', originalText);
                
                            // Limpiar el contenido y restaurar
                            checkbox.disabled = false;
                            checkbox.style.cursor = "pointer";
                            label.innerHTML = '';
                            label.appendChild(checkbox);
                            label.append(` ${originalText} - ${jornada.estado} (${jornada.cantidad}/${jornada.maxCantidad})${jornada.Disponible != null ? ' - ' + jornada.Disponible : ''}`);

                            if (jornada.Disponible != null || jornada.cantidad == jornada.maxCantidad ){
                                checkbox.disabled = true;
                                checkbox.style.cursor = "not-allowed"
                                checkbox.checked = false
                            }
                        }
                    }
                });
            }
        }
    } 
    catch (err) {
        alert("Error al cargar los datos");
        console.error(err);
    }
}


document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.btn-masDetalles').forEach(btn => {
        btn.addEventListener("click", async () => {
            const id_especialidad = btn.dataset.idEspecialidad; 
            const id_departamento = btn.dataset.idDepartamento; 
            const id_tipo_usuario = btn.dataset.idTipoUsuario; 
            const id_rol_profesional = btn.dataset.idRolProfesional; 
            const id_consulta = btn.dataset.idConsulta; 
            const id_servicio = btn.dataset.idServicio; 
            const id_estudio = btn.dataset.idEstudio; 
            const id_lugar = btn.dataset.idLugar; 
            const id_plantilla_estudio = btn.dataset.idPlantillaEstudio; 
    
            if (id_especialidad){
                document.querySelectorAll('.error-message').forEach(errorDiv => {
                    errorDiv.remove();
                });
                try {
                    const response = await fetch(`/personal/gestion-especialidades/?id=${id_especialidad}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
                    
                    document.getElementById("id_especialidad").value = data.id;
                    document.getElementById("id_nombre_especialidad").value = data.nombre_especialidad;
                    if(data.permite_turno){
                        document.getElementById("id_permite_turno").checked = true;
                    }
                    else{
                        document.getElementById("id_permite_turno").checked = false;
                    }
                    document.getElementById("id_descripcion").value = data.descripcion;
                    document.getElementById("id_departamento").value = data.departamento;
        
                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";

                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            else if (id_departamento){
                document.querySelectorAll('.error-message').forEach(errorDiv => {
                    errorDiv.remove();
                });
                document.getElementById("modal-title").textContent = "Editar departamento";
                try {
                    const response = await fetch(`/personal/gestion-departamentos/?id=${id_departamento}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
        
                    document.getElementById("id_departamento").value = data.id_departamento;
                    document.getElementById("id_nombre_departamento").value = data.nombre_departamento;
                    document.getElementById("id_tipo").value = data.tipo;
                    document.getElementById("id_descripcion").value = data.descripcion;
        
                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";
                    
                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            else if (id_rol_profesional){
                document.getElementById("modal-title").textContent = "Editar rol profesional";
                try {
                    const response = await fetch(`/personal/gestion-roles/?id_rol_profesional=${id_rol_profesional}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
                    
                    document.querySelectorAll('.error-message').forEach(errorDiv => {
                        errorDiv.remove();
                    });                    
                    document.querySelector(".seccion-rol-profesional").style.display = "block";
                    document.querySelector(".seccion-tipo-usuario").style.display = "none";
                    document.getElementById("id_rol_profesional").value = data.id_rol_profesional;
                    document.getElementById("id_nombre_rol_profesional").value = data.nombre_rol_profesional;
                    document.getElementById("id_tipoUsuario").value = data.tipo_usuario;
                    document.getElementById("id_especialidad").value = data.id_especialidad;
                    document.getElementById("id_servicio_diagnostico").value = data.id_servicio;
                    toggleFields();
        
                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";
                    
                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            else if (id_tipo_usuario){
                document.getElementById("modal-title").textContent = "Editar tipo de usuario";
                try {
                    const response = await fetch(`/personal/gestion-roles/?id_tipo_usuario=${id_tipo_usuario}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
        
                    document.querySelectorAll('.error-message').forEach(errorDiv => {
                        errorDiv.remove();
                    });                    
                    document.querySelector(".seccion-rol-profesional").style.display = "none";
                    document.querySelector(".seccion-tipo-usuario").style.display = "block";
                    document.getElementById("id_tipo_usuario").value = data.id_tipo_usuario;
                    document.getElementById("id_nombre_tipoUsuario").value = data.nombre_tipo_usuario;
        
                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";

                }
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            else if (id_servicio){
                document.getElementById("modal-title").textContent = "Editar servicio de diagnostico";
                try {
                    const response = await fetch(`/personal/gestion-servicios-diagnosticos/?id=${id_servicio}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
                    
                    document.querySelectorAll('.error-message').forEach(errorDiv => {
                        errorDiv.remove();
                    });                    
                    document.getElementById("id_servicio").value = data.id_servicio;
                    document.getElementById("id_nombre_servicio").value = data.nombre_servicio;
                    document.getElementById("id_descripcion").value = data.descripcion_servicio;
                    document.getElementById("id_departamento").value = data.departamento_servicio;

                    const lugaresIds = data.lugar_servicio;
                    const checkboxes = document.querySelectorAll('input[name="lugar"]');
                    checkboxes.forEach((checkbox) => {
                        checkbox.checked = lugaresIds.includes(parseInt(checkbox.value));
                    });     
                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";

                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            else if (id_estudio){
                document.getElementById("modal-title").textContent = "Editar estudio de diagnostico";
                try {
                    const response = await fetch(`/personal/gestion-estudios-diagnosticos/?id=${id_estudio}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
                    
                    document.querySelectorAll('.error-message').forEach(errorDiv => {
                        errorDiv.remove();
                    });                    
                    document.querySelector(".modal-content").style.width = "fit-content";
                    document.getElementById("id_estudio").value = data.id_estudio;
                    document.getElementById("id_nombre_estudio").value = data.nombre_estudio;
                    document.getElementById("id_servicio_diagnostico").value = data.servicio_estudio;
                    document.getElementById("id_tipo_resultado").value = data.tipo_resultado; 

                    const especialidadesIds = data.especialidad_estudio;
                    const checkboxes = document.querySelectorAll('input[name="especialidad"]');
                    checkboxes.forEach((checkbox) => {
                        checkbox.checked = especialidadesIds.includes(parseInt(checkbox.value));
                    });                    

                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";

                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            else if (id_lugar){
                document.getElementById("modal-title").textContent = "Editar lugar";
                try {
                    const response = await fetch(`/personal/gestion-lugares/?id=${id_lugar}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
                    
                    document.querySelectorAll('.error-message').forEach(errorDiv => {
                        errorDiv.remove();
                    });                    
                    document.getElementById("id_lugar").value = data.id_lugar;
                    document.getElementById("id_nombre").value = data.nombre_lugar;
                    document.getElementById("id_tipo").value = data.tipo_lugar;
                    document.getElementById("id_piso").value = data.piso_lugar;
                    document.getElementById("id_sala").value = data.sala_lugar;
                    document.getElementById("id_abreviacion").value = data.abreviacion_lugar;
                    document.getElementById("id_capacidad").value = data.capacidad_lugar;
                    document.getElementById("id_departamento").value = data.departamento_lugar;
                    document.getElementById("id_descripcion").value = data.descripcion_lugar;
                    if(data.isCritico_lugar){
                        document.getElementById("id_es_critico").checked = true;
                    }
                    else{
                        document.getElementById("id_es_critico").checked = false;
                    }

                    if(data.isActivo_lugar){
                        document.getElementById("id_activo").checked = true;
                    }
                    else{
                        document.getElementById("id_activo").checked = false;
                    }
                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";

                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }
            else if (id_plantilla_estudio){
                document.getElementById("modal-title").textContent = "Editar plantilla estudio";
                try {
                    const response = await fetch(`/personal/gestion-plantillas-estudios/?id=${id_plantilla_estudio}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
        
                    if (!response.ok) throw new Error("Error al obtener datos");
        
                    const data = await response.json();
                    
                    document.querySelectorAll('.error-message').forEach(errorDiv => {
                        errorDiv.remove();
                    });                    
                    document.getElementById("id_plantilla").value = data.id_plantilla;
                    document.getElementById("id_estudio").value = data.estudio_plantilla;
                    document.getElementById("id_estructura").value = JSON.stringify(data.estructura_estudio, null, 2);
                    document.querySelector(".modal-content").style.width = "fit-content";
                    modal.classList.add("show");
                    document.body.style.overflow = "hidden"; 
                    document.documentElement.style.overflow = "hidden";

                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }
            }

        });
    });

    if (btnNewTipoUsuario){
        btnNewTipoUsuario.addEventListener("click",() => {
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });         
            document.querySelector(".seccion-rol-profesional").style.display = "none";
            document.querySelector(".seccion-tipo-usuario").style.display = "block";
            document.getElementById("id_tipo_usuario").value = "";
            document.getElementById("id_nombre_tipoUsuario").value = "";
            document.getElementById("modal-title").textContent = "Nuevo tipo de usuario";
            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })

        document.querySelector("#editForm.formTipoUsuario").addEventListener("submit", function(event) {
            event.preventDefault();
    
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
    
            // Seleccionar todos los inputs, select y textarea
            const allinputsModal = document.querySelectorAll("#editForm.formTipoUsuario .campo-input input, #editForm.formTipoUsuario select, #editForm.formTipoUsuario textarea");
    
            let hayErrores = false;
    
            allinputsModal.forEach(input => {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('error-message');
    
                if (!input.value.trim()) {
                    hayErrores = true;
                    let mensajeError = '';
    
                    // Verifica el campo y muestra un mensaje de error específico
                    if (input.id === 'id_nombre_tipoUsuario') {
                        mensajeError = 'El nombre del tipo de usuario es obligatorio.';
                    }
    
                    errorDiv.innerHTML = `<p>${mensajeError}</p>`;
                    input.parentElement.appendChild(errorDiv); 
                }
            });
    
            if (!hayErrores) {
                document.querySelector("#editForm.formTipoUsuario").submit();
            }
        });
    }

    if (btnNewRolProfesional){
        btnNewRolProfesional.addEventListener("click",() => {
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });      
            document.querySelector(".seccion-rol-profesional").style.display = "block";
            document.querySelector(".seccion-tipo-usuario").style.display = "none";
            document.getElementById("id_rol_profesional").value = "";
            document.getElementById("id_nombre_rol_profesional").value = "";
            document.getElementById("id_tipoUsuario").value = "";
            document.getElementById("modal-title").textContent = "Nuevo rol profesional";
            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })
    
        document.querySelector("#editForm.formRolProfesional").addEventListener("submit", function(event) {
            event.preventDefault();
    
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
    
            // Seleccionar todos los inputs, select y textarea
            const allinputsModal = document.querySelectorAll("#editForm.formRolProfesional .campo-input input, #editForm.formRolProfesional select, #editForm.formRolProfesional textarea");
    
            let hayErrores = false;
    
            allinputsModal.forEach(input => {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('error-message');
    
                if (!input.value.trim() && !input.disabled) {
                    hayErrores = true;
                    console.log(input)
                    let mensajeError = '';
    
                    if (input.id === 'id_nombre_rol_profesional') {
                        mensajeError = 'El nombre del rol profesional es obligatorio.';
                    } 
                    else if (input.id === 'id_tipoUsuario') {
                        mensajeError = 'Por favor, seleccione un tipo de usuario.';
                    }
                    else if (input.id === 'id_especialidad') {
                        mensajeError = 'Por favor, seleccione una opcion.';
                    }
                    else if (input.id === 'id_servicio_diagnostico') {
                        mensajeError = 'Por favor, seleccione una opcion.';
                    }
    
                    errorDiv.innerHTML = `<p>${mensajeError}</p>`;
                    input.parentElement.appendChild(errorDiv); 
                }
            });
    
            if (!hayErrores) {
                document.querySelector("#editForm.formRolProfesional").submit();
            }
        });
    }

    if (btnNewDepartamento){
        btnNewDepartamento.addEventListener("click",() => {
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
            document.getElementById("id_departamento").value = "";
            document.getElementById("id_nombre_departamento").value = "";
            document.getElementById("id_tipo").value = "";
            document.getElementById("id_descripcion").value = "";
            document.getElementById("modal-title").textContent = "Nuevo departamento";
            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })

        formDelModal.addEventListener("submit", function(event) {
            event.preventDefault();
    
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
    
            // Seleccionar todos los inputs, select y textarea
            const allinputsModal = document.querySelectorAll(".campo-input input,select,textarea");
            let hayErrores = false;
    
            allinputsModal.forEach(input => {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('error-message');
    
                if (!input.value.trim()) {
                    hayErrores = true;
                    let mensajeError = '';
    
                    // Verifica el campo y muestra un mensaje de error específico
                    if (input.id === 'id_nombre_departamento') {
                        mensajeError = 'El nombre de la departamento es obligatorio.';
                    } else if (input.id === 'id_tipo') {
                        mensajeError = 'El tipo es obligatorio.';
                    } else if (input.id === 'id_descripcion') {
                        mensajeError = 'La descripción es obligatoria.';
                    }
    
                    errorDiv.innerHTML = `<p>${mensajeError}</p>`;
                    input.parentElement.appendChild(errorDiv); 
                }
            });
    
            if (!hayErrores) {
                formDelModal.submit();
            }
        });
    }

    if (btnNewEspecialidad){
        btnNewEspecialidad.addEventListener("click",() => {
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
            document.getElementById("id_especialidad").value = "";
            document.getElementById("id_nombre_especialidad").value = "";
            document.getElementById("id_permite_turno").checked = false;
            document.getElementById("id_departamento").value = "";
            document.getElementById("id_descripcion").value = "";
            document.getElementById("modal-title").textContent = "Nueva especialidad";
            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })

        formDelModal.addEventListener("submit", function(event) {
            event.preventDefault();
    
            // Limpiar errores previos
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
    
            // Seleccionar todos los inputs, select y textarea
            const allinputsModal = document.querySelectorAll(".campo-input input,select,textarea");
    
            let hayErrores = false;
    
            allinputsModal.forEach(input => {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('error-message');
    
                if (!input.value.trim()) {
                    hayErrores = true;
                    let mensajeError = '';
    
                    // Verifica el campo y muestra un mensaje de error específico
                    if (input.id === 'id_nombre_especialidad') {
                        mensajeError = 'El nombre de la especialidad es obligatorio.';
                    } else if (input.id === 'id_departamento') {
                        mensajeError = 'Por favor, seleccione un departamento.';
                    } else if (input.id === 'id_descripcion') {
                        mensajeError = 'La descripción es obligatoria.';
                    }
    
                    errorDiv.innerHTML = `<p>${mensajeError}</p>`;
                    input.parentElement.appendChild(errorDiv); // Agrega el mensaje de error debajo del campo
                }
            });
    
            if (!hayErrores) {
                formDelModal.submit();
            }
        });
    }

    if (btnNewServicio){
        btnNewServicio.addEventListener("click",() => {
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
            document.getElementById("id_servicio").value = "";
            document.getElementById("id_nombre_servicio").value = "";
            document.getElementById("id_descripcion").value = "";
            document.getElementById("id_departamento").value = "";

            const checkboxes = document.querySelectorAll('input[name="lugar"]');
            checkboxes.forEach((checkbox) => {
                checkbox.classList.add('selected'); 
                checkbox.checked = false
            });     

            document.getElementById("modal-title").textContent = "Nuevo servicio de diagnostico";
            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })

        formDelModal.addEventListener("submit", function(event) {
            event.preventDefault();
    
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
    
            // Seleccionar todos los inputs, select y textarea
            const allinputsModal = document.querySelectorAll(".campo-input input,select,textarea");
            let hayErrores = false;
    
            allinputsModal.forEach(input => {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('error-message');
    
                if (!input.value.trim()) {
                    hayErrores = true;
                    let mensajeError = '';
    
                    // Verifica el campo y muestra un mensaje de error específico
                    if (input.id === 'id_nombre_servicio') {
                        mensajeError = 'El nombre del servicio es obligatorio.';
                    } 
                    else if (input.id === 'id_departamento') {
                        mensajeError = 'Por favor, seleccione un departamento.';
                    }
                    else if (input.id === 'id_descripcion') {
                        mensajeError = 'La descripción es obligatoria.';
                    }
                    else if (input.id === 'id_lugar') {
                        mensajeError = 'Por favor, seleccione por lo menos un lugar.';
                    }
    
                    errorDiv.innerHTML = `<p>${mensajeError}</p>`;
                    input.parentElement.appendChild(errorDiv); 
                }
            });
    
            if (!hayErrores) {
                formDelModal.submit();
            }
        });
    }

    if (btnNewEstudio){
        btnNewEstudio.addEventListener("click",() => {
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
            document.querySelector(".modal-content").style.width = "fit-content";
            document.getElementById("id_estudio").value = "";
            document.getElementById("id_nombre_estudio").value = "";
            document.getElementById("id_servicio_diagnostico").value = "";
            document.getElementById("id_tipo_resultado").value = "";

            const checkboxes = document.querySelectorAll('input[name="especialidad"]');
            checkboxes.forEach((checkbox) => {
                checkbox.checked = false
            });  

            document.getElementById("modal-title").textContent = "Nuevo estudio de diagnostico";
            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })

        formDelModal.addEventListener("submit", function(event) {
            event.preventDefault();
    
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
    
            // Seleccionar todos los inputs, select y textarea
            const allinputsModal = document.querySelectorAll(".campo-input input,select,textarea");
    
            let hayErrores = false;
    
            allinputsModal.forEach(input => {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('error-message');
    
                if (!input.value.trim()) {
                    hayErrores = true;
                    let mensajeError = '';
    
                    // Verifica el campo y muestra un mensaje de error específico
                    if (input.id === 'id_nombre_estudio') {
                        mensajeError = 'El nombre del estudio es obligatorio.';
                    } 
                    else if (input.id === 'id_servicio_diagnostico') {
                        mensajeError = 'Por favor, seleccione un servicio de diagnostico.';
                    }
                    else if (input.id === 'id_especialidad') {
                        mensajeError = 'Por favor, seleccione una especialidad.';
                    }
                    else if (input.id === 'id_tipo_resultado') {
                        mensajeError = 'Por favor, seleccione el tipo de resultado del estudio';
                    }
    
                    errorDiv.innerHTML = `<p>${mensajeError}</p>`;
                    input.parentElement.appendChild(errorDiv);
                }
            });
    
            if (!hayErrores) {
                formDelModal.submit();
            }
        });
    }

    if (btnNewLugar){
        btnNewLugar.addEventListener("click",() => {
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
            document.getElementById("id_lugar").value = "";
            document.getElementById("id_nombre").value = "";  
            document.getElementById("id_tipo").value = "";
            document.getElementById("id_piso").value = "";
            document.getElementById("id_sala").value = "";
            document.getElementById("id_abreviacion").value = "";
            document.getElementById("id_capacidad").value = "";
            document.getElementById("id_departamento").value = "";
            document.getElementById("id_descripcion").value = "";
            document.getElementById("id_es_critico").checked = false;
            document.getElementById("id_activo").checked = false;
            document.getElementById("modal-title").textContent = "Nuevo lugar";

            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })

        formDelModal.addEventListener("submit", function(event) {
            event.preventDefault();
    
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
    
            // Seleccionar todos los inputs, select y textarea
            const allinputsModal = document.querySelectorAll(".campo-input input,select,textarea");
    
            let hayErrores = false;
    
            allinputsModal.forEach(input => {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('error-message');
    
                if (!input.value.trim()) {
                    hayErrores = true;
                    let mensajeError = '';
    
                    // Verifica el campo y muestra un mensaje de error específico
                    if (input.id === 'id_nombre') {
                        mensajeError = 'El nombre del lugar es obligatorio.';
                    } 
                    else if (input.id === 'id_tipo') {
                        mensajeError = 'Por favor, seleccione un tipo de lugar.';
                    }
                    else if (input.id === 'id_piso') {
                        mensajeError = 'Por favor, ingrese el n° del piso del lugar.';
                    }
                    else if (input.id === 'id_codigo') {
                        mensajeError = 'Por favor, ingrese el codigo del lugar';
                    }
                    else if (input.id === 'id_capacidad') {
                        mensajeError = 'Por favor, ingrese la capacidad del lugar.';
                    }
                    
                    errorDiv.innerHTML = `<p>${mensajeError}</p>`;
                    input.parentElement.appendChild(errorDiv);
                }
            });
    
            if (!hayErrores) {
                formDelModal.submit();
            }
        });
    }

    if (btnPlantillaEstudio){
        btnPlantillaEstudio.addEventListener("click",() => {
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
            document.getElementById("id_plantilla").value = "";
            document.getElementById("id_estudio").value = "";
            document.getElementById("id_estructura").value = "";

            document.getElementById("modal-title").textContent = "Nueva plantilla de estudio";
            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })

        formDelModal.addEventListener("submit", function(event) {
            event.preventDefault();
    
            // Limpiar errores previos
            document.querySelectorAll('.error-message').forEach(errorDiv => {
                errorDiv.remove();
            });
    
            // Seleccionar todos los inputs, select y textarea
            const allinputsModal = document.querySelectorAll(".campo-input input,select,textarea");
    
            let hayErrores = false;
    
            allinputsModal.forEach(input => {
                const errorDiv = document.createElement('div');
                errorDiv.classList.add('error-message');
    
                if (!input.value.trim()) {
                    hayErrores = true;
                    let mensajeError = '';
    
                    // Verifica el campo y muestra un mensaje de error específico
                    if (input.id === 'id_estudio') {
                        mensajeError = 'Por favor, seleccione un estudio.';
                    } 
                    else if (input.id === 'id_estructura') {
                        mensajeError = 'Por favor, ingrese la estructura en formato JSON del estudio';
                    }
                    
                    errorDiv.innerHTML = `<p>${mensajeError}</p>`;
                    input.parentElement.appendChild(errorDiv); 
                }
            });
    
            if (!hayErrores) {
                formDelModal.submit();
            }
        });
    }

    if (btnNewLugarTrabajo){
        btnNewLugarTrabajo.addEventListener("click",() => { 
            document.querySelectorAll(".error-message").forEach(elemento => elemento.remove());
            document.getElementById("modal-title").textContent = "Asignar nuevo lugar de trabajo";
            document.getElementById("seccion-editarLugarTrabajo").style.display ="none"
            document.getElementById("seccion-asignaciones").style.display ="none"
            document.getElementById("seccion-lugarTrabajo").style.display ="block"
            modal.classList.add("show");
            document.body.style.overflow = "hidden"; 
            document.documentElement.style.overflow = "hidden";
        })

        obtenerDisponibilidadLugar();
        document.getElementById("id_lugar").addEventListener('change', obtenerDisponibilidadLugar);
    }     
    

    if (btnNewAsignacion){
        btnNewAsignacion.addEventListener("click",async () => {
                document.getElementById("id_asignacion").value = "";
                document.getElementById("id_rol_profesional").value = "";
                document.getElementById("id_input-mostrar-dato").style.display = "none";
                document.querySelectorAll(".error-message").forEach(elemento => elemento.remove());
                document.getElementById("modal-title").textContent = "Asignar nuevo rol profesional";
                document.getElementById("seccion-editarLugarTrabajo").style.display ="none"
                document.getElementById("seccion-lugarTrabajo").style.display ="none"
                document.getElementById("seccion-asignaciones").style.display ="block"
                modal.classList.add("show");
                document.body.style.overflow = "hidden"; 
                document.documentElement.style.overflow = "hidden";

        });

        document.getElementById("id_rol_profesional").addEventListener('change', async () =>{
            const id_rolProfesional = document.getElementById("id_rol_profesional").value
            if(id_rolProfesional){
                try {
                    const response = await fetch(`/personal/gestion-roles/?id_rol_profesional=${id_rolProfesional}`, {
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        }
                    });
            
                    if (!response.ok) throw new Error("Error al obtener datos");
            
                    const data = await response.json();
                    document.getElementById("id_input-mostrar-dato").style.display = "block";
                    console.log(data.nombre_especialidad)
                    if(data.nombre_especialidad){                    
                        document.getElementById("label-input-mostrar-dato").textContent = "Rol profesional asociado a la especialidad medica de:";
                        document.getElementById("id_input-mostrar-dato").value = data.nombre_especialidad;
                    }
                    else if(data.nombre_servicio){                    
                        document.getElementById("label-input-mostrar-dato").textContent = "Rol profesional asociado al servicio de diagnostico:";
                        document.getElementById("id_input-mostrar-dato").value = data.nombre_servicio;
                    }
    
                } 
                catch (err) {
                    alert("Error al cargar los datos");
                    console.error(err);
                }  
            }
            else{
                document.getElementById("id_input-mostrar-dato").style.display = "none";
            }          
        });


    }

    const especialidad = document.getElementById('id_especialidad');
    const servicio = document.getElementById('id_servicio_diagnostico');
    const boxEspecialidad = document.getElementById("seccion-especialidad")
    const boxServicio = document.getElementById("seccion-servicio_diagnostico")
    function toggleFields() {
        if (especialidad && servicio) {
            if (especialidad.value) {
                servicio.disabled = true;
                if (boxServicio){
                    boxServicio.style.display = 'none';
                }
            } 
            else {
                servicio.disabled = false;
                if (boxServicio){
                    boxServicio.style.display = 'block';
                }
            }

            if (servicio.value) {
                especialidad.disabled = true;
                if (boxEspecialidad){
                    boxEspecialidad.style.display = 'none';
                }
            } 
            else {
                especialidad.disabled = false;
                if (boxEspecialidad){
                    boxEspecialidad.style.display = 'block';
                }
            }
        }
    }
        
    if (especialidad) {
        especialidad.addEventListener('change', toggleFields);
    }
    if (servicio) {
        servicio.addEventListener('change', toggleFields);
    }
    
    toggleFields(); // Ejecutar al cargar la página



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



    /*  #### Esto es parte de la seccion de "Alta de personal"  ###### */
    const tipoUsuarioSeleccionado = document.getElementById("id_tipoUsuarioForm");
    const boxCampoMatricula = document.querySelector(".box-campo-matricula");
    const inputMatricula = document.getElementById("id_numero_matricula");

    const usuariosConMatricula = [3,4,5];

    function toggleCampoMatricula(){
        const tipoUsuarioSelect = parseInt(tipoUsuarioSeleccionado.value)

        if(usuariosConMatricula.includes(tipoUsuarioSelect)){
            boxCampoMatricula.style.display="flex";
        }
        else{
            boxCampoMatricula.style.display ="none";
            inputMatricula.value="";
        }
    }

    if(tipoUsuarioSeleccionado){
        toggleCampoMatricula();
        tipoUsuarioSeleccionado.addEventListener("change",toggleCampoMatricula);
    }
    /*  #### Fin parte de la seccion de "Alta de personal"  ###### */

});


/*  #### Esta funcion pertenece a la vista de "Editar Personal"  ###### */
function toggleLugar(id) {
    const boxLugar = document.getElementById("boxLugar-" + id);
    const div = document.getElementById("items-lugar-" + id);
    const icon = document.getElementById("icon-arrow-" + id);

    const estaOculto = div.classList.contains("hidden-linea");

    if (estaOculto) {
        boxLugar.classList.add("visible-box");
        div.classList.remove("hidden-linea");
        div.classList.add("visible-linea");
        icon.classList.add("darVuelta");
    } 
    else {
        boxLugar.classList.remove("visible-box");
        div.classList.add("hidden-linea");
        div.classList.remove("visible-linea");
        icon.classList.remove("darVuelta");
    }
}

async function modalEditarRolProfesional(id) {
    document.querySelectorAll(".error-message").forEach(elemento => elemento.remove());
    document.getElementById("modal-title").textContent = "Editar rol profesional";
    document.getElementById("seccion-lugarTrabajo").style.display ="none"
    document.getElementById("seccion-editarLugarTrabajo").style.display ="none"
    document.getElementById("seccion-asignaciones").style.display ="block"

    try {
        const response = await fetch(`/personal/get-lugarTrabajoORolProfesional/?id_rolProfesional=${id}`, {
            headers: {
                "X-Requested-With": "XMLHttpRequest"
            }
        });

        if (!response.ok) throw new Error("Error al obtener datos");

        const data = await response.json();


        document.getElementById("id_asignacion").value = data.id_instancia;
        if(document.getElementById("id_especialidad")){
            document.getElementById("id_especialidad").value = data.id_especialidad;
        }
        if(document.getElementById("id_servicio_diagnostico")){
            document.getElementById("id_servicio_diagnostico").value = data.id_servicio_diagnostico;
        }
        
        modal.classList.add("show");
        document.body.style.overflow = "hidden"; 
        document.documentElement.style.overflow = "hidden";
        
    } 
    catch (err) {
        alert("Error al cargar los datos");
        console.error(err);
    }

}

async function modalEditarLugarTrabajo(id) {
    document.querySelectorAll(".error-message").forEach(elemento => elemento.remove());
    document.getElementById("modal-title").textContent = "Editar lugar de trabajo";
    document.getElementById("seccion-lugarTrabajo").style.display ="none"
    document.getElementById("seccion-asignaciones").style.display ="none"
    document.getElementById("seccion-editarLugarTrabajo").style.display ="block"

    try {
        const response = await fetch(`/personal/get-lugarTrabajoORolProfesional/?id_lugarTrabajo=${id}`, {
            headers: {
                "X-Requested-With": "XMLHttpRequest"
            }
        });

        if (!response.ok) throw new Error("Error al obtener datos");

        const data = await response.json();


        document.getElementById("id_instancia").value = data.id_instancia;
        document.getElementById("id_lugar_edit").value = data.id_lugar;
        document.getElementById("id_jornada_edit").value = data.id_jornada;
        document.getElementById("id_rol_edit").value = data.id_rolProfesionalAsignado;

        modal.classList.add("show");
        document.body.style.overflow = "hidden"; 
        document.documentElement.style.overflow = "hidden";
        
    } 
    catch (err) {
        alert("Error al cargar los datos");
        console.error(err);
    }

}
/*  #### Fin funcion que pertenece a la vista de "Editar Personal"  ###### */















