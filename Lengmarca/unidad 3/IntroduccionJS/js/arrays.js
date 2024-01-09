const numeros = [20, 5, 6, 10, 200];

console.log(numeros[0]);
console.log(numeros.length);
// numeros.forEach()

numeros.push(80, 43, 56, 21);
console.log(numeros);

numeros.unshift(50, 96);
console.table(numeros);
console.log(numeros);

const meses = ["enero", "febrero", "marzo"];

// Quita el ultimo
meses.pop();
console.log(meses);
// Quita el primero
meses.shift();
console.log(meses);

const nuevoArray = ["enero", ...meses, "marzo"];
console.log(nuevoArray);
