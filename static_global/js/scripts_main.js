const menuItemsDesplegables = document.querySelectorAll(".menu-item-desplegable");
const sidebar = document.getElementById("sidebar");
const btnSidebar = document.getElementById("menu-btn");
const sidebarBtn = document.getElementById("sidebar-btn");

sidebarBtn.addEventListener("click",()=>{
  document.body.classList.toggle("sidebar-hidden");
})

btnSidebar.addEventListener("click",()=>{
  sidebar.classList.toggle("minimizado")
})


menuItemsDesplegables.forEach(menuItem => {
  menuItem.addEventListener("click",()=>{
    const subMenu = menuItem.querySelector(".sub-menu")
    const isMinimizado = sidebar.classList.contains("minimizado")
    if (!isMinimizado){
      const isActive = menuItem.classList.toggle("sub-menu-toggle")
      if (subMenu){
          if(isActive){
            subMenu.style.height = `${subMenu.scrollHeight + 6}px`;
            subMenu.style.padding = "0.2rem 0";
          }
          else{
            subMenu.style.height = "0";
            subMenu.style.padding = "0";
          }
        }
      
      menuItemsDesplegables.forEach((item) => {
        if(item !== menuItem){
          const otroSubMenu = item.querySelector(".sub-menu")
          if(otroSubMenu){
            item.classList.remove("sub-menu-toggle");
            otroSubMenu.style.height = "0";
            otroSubMenu.style.padding = "0";
          }
        }
      });
    }
  })
});

function checkWindowsSize() {
  if (window.matchMedia("(max-width: 700px), (max-height: 683px)").matches) {
      sidebar.classList.remove("minimizado");
  }
}
checkWindowsSize();
window.addEventListener("resize",checkWindowsSize)


document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll('.sub-menu-link.selectEspecialidad').forEach(opt => {
      opt.addEventListener("click", async () => {
          const id_especialidadSeleccionada = opt.dataset.idEspecialidad; 
  
          if (id_especialidadSeleccionada){
              try {
                  const response = await fetch(`/personal/?id=${id_especialidadSeleccionada}`, {
                      headers: {
                          "X-Requested-With": "XMLHttpRequest"
                      }
                  });
      
                  if (!response.ok) throw new Error("Error al obtener datos");
      
                  window.location.reload();
              } 
              catch (err) {
                  alert("Error al cargar los datos");
              }
          }
      })
  })
});

window.addEventListener('DOMContentLoaded', (event) => {
  const currentPath = window.location.pathname;
  const menuItems = document.querySelectorAll('.menu-link, .sub-menu-link');
  
  menuItems.forEach(item => {
    if (item.getAttribute('href') === currentPath) {
      father = item.closest('.menu-item');
      father.classList.add('active');  // Añadir clase active al item
    }
    else {
      father = item.parentNode;
      father.classList.remove('active');
    }
  });
});
          