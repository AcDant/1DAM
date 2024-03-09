const numero = document.querySelector("#numero");
numero.addEventListener("click", operar);
let valor = document.querySelector("#valor").value;
const multiplicar = document.querySelector(".section1");
const sumar = document.querySelector(".section2");
const dividir = document.querySelector(".section3");


// Apartado 2

const botonBin = document.getElementById("binario")
const botonBin2 = document.getElementById("binario2") 


// Fin apartado 2

function multiplica(numero) {
  console.log("Tabla multiplicar " + numero);
  for (i = 1; i <= 10; i++) {
    let elemento = document.createElement("p");
    elemento.innerHTML = numero + " * " + i + "= " + i * numero;
    multiplicar.appendChild(elemento);
  }
}

function suma(numero) {
  console.log("Tabla sumar " + numero);
  for (i = 0; i <= 10; i++) {
    let elemento = document.createElement("p");
    let calculo = numero + i;
    elemento.innerHTML = numero + " + " + i + "= " + calculo;
    sumar.appendChild(elemento);
  }
}

function division(numero) {
  console.log("Tabla dividir " + numero);
  for (i = 1; i <= 9; i++) {
    let elemento = document.createElement("p");
    elemento.innerHTML = numero + " / " + i + "= " + numero / i;
    dividir.appendChild(elemento);
  }
}

function eliminarHTML() {
  const element = document.querySelectorAll(".section");
  const element1 = document.querySelector(".section1");
  const element2 = document.querySelector(".section2");
  const element3 = document.querySelector(".section3");

  while (element1.firstChild) {
    element1.removeChild(element1.firstChild);
  }
  while (element2.firstChild) {
    element2.removeChild(element2.firstChild);
  }
  while (element3.firstChild) {
    element3.removeChild(element3.firstChild);
  }

  // for (i=0;element.length;i++){
  //   while (element[i].firstChild){
  //     element[i].removeChild(element[i].firstChild)
  //   }
  // }
}

function operar() {
  eliminarHTML();
  valor = document.querySelector("#valor").value;
  numeroValor = Number(valor);
  console.log(numeroValor);
  multiplica(numeroValor);
  suma(numeroValor);
  division(numeroValor);
}


// Apartado 2
// let pvalorBin = "77"
// let valorBinNumero;
// let valorOnBin;
// valorOnBin = Number(pvalorBin).toString(2);
// console.log(valorOnBin)

// const botonBin = document.getElementById("binario3")
// const botonBin2 = document.getElementById("binario2") 
// const botonBin4 = document.getElementById("binario4") 
console.log(botonBin);
console.log(botonBin2);
console.log(botonBin4);
console.log(numero);
let valorBin = document.querySelector("#num-bin"); 


if(botonBin != null){
  // Adding a click event script to null object
  botonBin.addEventListener('click', calcula)
}else{
  console.warn(`#SampleEl Object or Element Does not exists or not yet loaded.`)
}

// botonBin.addEventListener("click", calcula);


function calcula(){
  console.log(valorOnBin)
  valorBin = document.querySelector("#num-bin").value;
  let valorBinNumero;
  let valorOnBin;
  valorOnBin = Number(valorBin).toString(2);
}