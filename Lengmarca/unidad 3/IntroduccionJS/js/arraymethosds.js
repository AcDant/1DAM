// Array methods
const carrito = [
    {nombre:"monitor", precio:23},
    {nombre:"pc", precio:555},
    {nombre:"raton", precio:21},
    {nombre:"teclado", precio:22},
]

console.log(carrito[1]);

const meses2 = ["Enero", "Febrero", "Marzo", "Abril", "Mayo"];

let resultado = meses2.includes("Diciembre");
console.log(resultado);
resultado = carrito.some(function(producto){
    return producto.nombre==="Celular Pro"
});
console.log(resultado);


resultado = carrito.filter(function(producto){
    return producto.nombre==="Celular Pro"
});
console.log(resultado);






