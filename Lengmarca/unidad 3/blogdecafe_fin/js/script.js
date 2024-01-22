const textoHeading = document.querySelector(".header_texto");
// console.log(textoHeading);
textoHeading.textContent = " Estoy en el contacto";
console.log(textoHeading);

const enlaces = document.querySelectorAll(".navegacion a");
console.log(enlaces);

enlaces[0].textContent="Login";
enlaces[3].href="https://www.google.es";
enlaces[0].classList.add("nueva_clase");
enlaces[0].classList.remove("nueva_clase");


// const fondo = querySelector(".contacto-bg");
// fondo.style.backgroundImage = "url('img_tree.png')";

document.addEventListener("DOMContentLoaded", function(){
    console.log("Documento cargado");
});

window.onscroll = function(){
    console.log("Haciendo scroll")
}




let contadorcito=0;
const contador = () =>{
    contadorcito++;
    console.log(contadorcito);
    contador();
}
// contador();