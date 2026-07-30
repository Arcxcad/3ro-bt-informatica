// Oculta los apuntes privados si el usuario no está logueado
/*const usuarioLogueado = false;

document.querySelectorAll(".privado").forEach(div => {
  if (!usuarioLogueado) {
    div.style.display = "none";
  }
});*/

// Función para crear un apunte
function crearApunte(texto, contenedorId) {
  const contenedor = document.getElementById(contenedorId);

  // Crea el div para el apunte
  const div = document.createElement("div");
  div.className = "item";

  // Crea el parrafo con el texto apunte privado o publico
  const p = document.createElement("p");
  p.textContent = texto;

  // Boton editar
  const editarBtn = document.createElement("button");
  editarBtn.textContent = "Editar";
  editarBtn.onclick = () => {
    const nuevoTexto = prompt("Editar apunte:", p.textContent);
    if (nuevoTexto) {
      p.textContent = nuevoTexto;
    }
  };

  // Boton borrar
  const borrarBtn = document.createElement("button");
  borrarBtn.textContent = "Borrar";
  borrarBtn.onclick = () => div.remove();

  // Agrega los apuntes en todo el div correspondiente
  div.appendChild(p);
  div.appendChild(editarBtn);
  div.appendChild(borrarBtn);

  // Insertar el apunte en el contenedor correcto
  contenedor.appendChild(div);
}

