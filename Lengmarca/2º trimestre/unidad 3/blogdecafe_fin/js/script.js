const textoHeading = document.querySelector(".header_texto");
// console.log(textoHeading);
textoHeading.textContent = " Estoy en el contacto";
console.log(textoHeading);

const enlaces = document.querySelectorAll(".navegacion a");
console.log(enlaces);

const alerta = (event) =>{
    event.preventDefault();
    console.log("entra");
    window.alert("Seguro?");
};

enlaces[0].textContent="Login clica aqui";
enlaces[0].addEventListener("click", alerta);
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


let imagen = document.querySelector(".contacto-bg");
console.log(imagen);
imagen.style.display = "none";

let formulario = document.querySelector(".formulario");
console.log(formulario);

const datos = {
    nombre:'',
    email:'',
    mensaje:''
}
const nombre = document.querySelector('#nombre');
const email = document.querySelector('#email');
const mensaje = document.querySelector('#mensaje');

nombre.addEventListener('input', function(e){
    console.log(e.target.value);
})
email.addEventListener('input', function(e){
    console.log(e.target.value);
})
mensaje.addEventListener('input', function(e){
    console.log(e.target.value);
})

formulario.addEventListener('submit',function(e){
    e.preventDefault();
})



let naveli = document.querySelectorAll(".navegacion__enlace");
console.log(naveli);

naveli.forEach((li)=>{
    li.classList.remove('navegacion__enlace');
    li.classList.add('rojo');
    // li.style.color ="red";
})

// let contadorcito=0;
// const contador = () =>{
//     contadorcito++;
//     console.log(contadorcito);
//     contador();
// }
// contador();