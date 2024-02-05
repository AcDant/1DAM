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


// Eventos input
// nombre.addEventListener('input', function(e){
//     console.log(e.target.value);
// })
// email.addEventListener('input', function(e){
//     console.log(e.target.value);
// })
// mensaje.addEventListener('input', function(e){
//     console.log(e.target.value);
// })

// nombre.addEventListener('input', function(e){
//     datos['nombre'] = e.target.value;
//     console.log(datos);
// })

// email.addEventListener('input', function(e){
//     datos['email'] = e.target.value;
//     console.log(datos);
// })
// mensaje.addEventListener('input', function(e){
//     datos['mensaje'] = e.target.value;
//     console.log(datos);
// })



nombre.addEventListener('input',leerTexto)
email.addEventListener('input',leerTexto)
mensaje.addEventListener('input',leerTexto)

function leerTexto (e){
    datos[e.target.id] = e.target.value;
    console.log(e)
}



formulario.addEventListener('submit',function(e){
    e.preventDefault();

    // Comprobar que no haya campos de datos vacios

    const {nombre, email, mensaje} = datos;

    // Si un campo esta vacio, mostrar error
if(nombre === "" || email === "" ||mensaje === ""){
    // const hayError= true;
    // mostrarError("Todos los campos son obligatorios");
    mensajeEnviar("tODOS LOS CAMPOS SON OBLIGATORIOS", 'error')
    return;
}
    // Si todo esta correcto enviar y mostrar mensaje de enviado
    // const hayError= false;
    // mostrarMensaje("Mensaje enviado correctamente")
    mensajeEnviar("Mensaje enviado correctamente", 'ok')
})

// const mostrarMensaje = (mensaje) =>{
//     const todoOk = document.createElement('p')
//     todoOk.textContent=mensaje;
//     todoOk.classList.add('ok');
//     formulario.appendChild(todoOk);
//     setTimeout(()=>{
//         todoOk.remove()
//     },2000)
//     // console.log(mensaje)   
// }

// const mostrarError = (mensaje) =>{

//     const alerta = document.createElement('p')
//     alerta.textContent=mensaje;
//     alerta.classList.add('error');
//     formulario.appendChild(alerta);
//     setTimeout(()=>{
//         alerta.remove()
//     },2000)
//     // console.log(mensaje)
// }


const mensajeEnviar = (hayError) =>{
    const mensaje = document.createElement('p')
}




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