// Cerrar modal al hacer clic en el botón de cerrar "X"
function openModal(imgElement) {
  const modal = document.getElementById("modal");
  const modalImg = document.getElementById("modal-img");
  const caption = document.getElementById("modal-caption");

  modal.style.display = "flex";
  modal.classList.add("show");
  modalImg.src = imgElement.src;
  caption.innerText = imgElement.alt;
}

function closeModal() {
  const modal = document.getElementById("modal");
  modal.classList.remove("show");
  setTimeout(() => {
    modal.style.display = "none";
    document.getElementById("modal-caption").innerText = "";
  }, 300);
}

// Cerrar modal si se hace clic en el fondo oscuro
document.getElementById("modal").addEventListener("click", function(e) {
  const modalImg = document.getElementById("modal-img");
  const closeBtn = document.querySelector(".close");

  if (e.target === this) {
    closeModal();
  }
});
