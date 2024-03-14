function cambioColor() {
  const selection = document.querySelector("#color");
  const valor = selection.value;
  document.querySelector(".contenedor").style.backgroundColor = valor;
}
