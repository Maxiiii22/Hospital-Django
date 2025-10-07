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

document.addEventListener("DOMContentLoaded", function () {

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













