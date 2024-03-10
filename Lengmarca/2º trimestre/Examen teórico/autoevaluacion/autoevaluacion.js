const numero = document.querySelector("#numero");
numero.addEventListener("click", operar);
let valor = document.querySelector("#valor").value;
const multiplicar = document.querySelector(".section1");
const sumar = document.querySelector(".section2");
const dividir = document.querySelector(".section3");

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
  // const element = document.querySelectorAll(".section");
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
 
// console.log(numero);
let boton2 = document.querySelector("#binario");
boton2.addEventListener("click", calcula)
let valorBin = document.querySelector("#num-bin").value; 
let valorBin2 = document.querySelector("#num-bin2").value; 
let resultadoBin = document.querySelector(".resultado");
// console.log(valorBin)


// numero.addEventListener("click", operar);
// let valor = document.querySelector("#valor").value;
// const multiplicar = document.querySelector(".section1");
// const sumar = document.querySelector(".section2");
// const dividir = document.querySelector(".section3");


function calcula(){
  // console.log(valorOnBin)
  resultadoBin.removeChild(elemento1)
  valorBin = document.querySelector("#num-bin").value;
  valorBin2 = document.querySelector("#num-bin2").value;
  let dividendo = Number(valorBin).toString(2);
  let mostrarDivision;
  let mostrarMultiplicacion;
   let divisor =  Number(valorBin2);
  dividendo = dividendo.toString();
  mostrarDivision = dividendo.slice(0,-(divisor/2))
  mostrarMultiplicacion = dividendo.slice()
  let elemento1 = document.createElement("p");
  elemento1.innerHTML = mostrarDivision;
  resultadoBin.appendChild(elemento1)


  console.log(mostrarDivision)

  let valorOnBin;
  valorOnBin = Number(valorBin).toString(2);
}

// Sabiendo que cuando desplazamos 1 bit a la derecha dividimos un entero por 2 y cuando lo desplazamos a la izquierda estamos multiplicando por 2.
// Tu aplicación también debe imprimir el resultado de las siguientes operaciones empleando desplazamiento de bits:

// 125 / 8 =
// 40 x 4 =
// 25 / 2 =
// 10 x 16 =

// primerOperando = 125;
// segundoOperando = 8;

// binario1 = primerOp.toString(2);
// console.log(binario1);