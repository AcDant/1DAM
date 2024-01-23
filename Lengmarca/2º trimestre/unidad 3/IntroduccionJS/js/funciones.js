// Aqui no hay que poner el let con num1 y num2 porque las variables ya se declararon por la forma en la que javascript lee el script

num1 = 10
num2 = 20

let numero88 = 4;

numero88 = Number(numero88);
console.log(numero88);

let numero33 = "23";
// numero33 = numero33.Number();
// console.log(numero33);

resultado2 = sumar(2,4); //Se puede llamar antes por el hoisting
console.log(resultado2);

function sumar(num1, num2){
   return num1+num2;
}

const sumar2 = function(num1,num2){
    console.log(num1+num2);
}
sumar2(num1,num2); //se tiene que llamar despues, no se aplica el hoisting

