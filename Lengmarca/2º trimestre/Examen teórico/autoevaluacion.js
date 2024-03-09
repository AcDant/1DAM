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
    // console.log(7*i)
  }
}

function suma(numero) {
  console.log("Tabla sumar " + numero);
  for (i = 0; i <= 10; i++) {
    let elemento = document.createElement("p");
    let calculo = numero + i;
    elemento.innerHTML = numero + " + " + i + "= " + calculo;
    sumar.appendChild(elemento);
    //   console.log(8 + i);
  }
}

function division(numero) {
  console.log("Tabla dividir " + numero);
  for (i = 1; i <= 9; i++) {
    let elemento = document.createElement("p");
    elemento.innerHTML = numero + " / " + i + "= " + numero / i;
    dividir.appendChild(elemento);
    //   console.log(9 / i);
  }
}

function eliminarHTML() {

  const element = document.querySelectorAll(".section");
  const element1 = document.querySelector(".section1");
  const element2 = document.querySelector(".section2");
  const element3 = document.querySelector(".section3");

  for (i=0;element.length;i++){
    while (element[i].firstChild){
      element[i].removeChild(element[i].firstChild)
    }
    // element[i].removeChild(element1)
  }
  console.log(element1);
  // const pepe = element.removeChild(element1)
//  element.removeChild(element1)
    // const element = document.getElementById("idOfParent");
    // while (element.firstChild) {
      // element.removeChild(element.firstChild);
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
