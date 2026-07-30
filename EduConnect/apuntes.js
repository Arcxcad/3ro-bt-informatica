// Oculta los aputes privados si el usuario no está logueado
/*const usuarioLogueado = false;

document.querySelectorAll(".privado").forEach(div => {
  if (!usuarioLogueado) {
    div.style.display = "none";
  }
});*/

function crearApunte(texto, contenedorId) {
  const contenedor = document.getElementById(contenedorId);

  // Crear div para el apunte
  const div = document.createElement("div");
  div.className = "item";

  // Crear párrafo con el texto
  const p = document.createElement("p");
  p.textContent = texto;

  // Botón editar
  const editarBtn = document.createElement("button");
  editarBtn.textContent = "Editar";
  editarBtn.onclick = () => {
    const nuevoTexto = prompt("Editar apunte:", p.textContent);
    if (nuevoTexto) {
      p.textContent = nuevoTexto;
    }
  };

  // Botón borrar
  const borrarBtn = document.createElement("button");
  borrarBtn.textContent = "Borrar";
  borrarBtn.onclick = () => div.remove();

  // Agregar todo al div
  div.appendChild(p);
  div.appendChild(editarBtn);
  div.appendChild(borrarBtn);

  // Insertar en el contenedor correcto
  contenedor.appendChild(div);
}

