const productos1 = {
  nombre: "Pantalla 27'",
  precio: 140,
  caracteristicas: "Pantalla 4k",
};
const productos2 = {
  nombre: "Torre guapa'",
  precio: 2000,
  caracteristicas: "Grafica  3070",
};

productos1.imagen = "IMG-jpg";

console.log(productos1.nombre);
console.log(productos1.imagen);
console.log(productos1);

// nombres = productos1.nombre;
// console.log(nombres)
// console.log(productos1.nombre)

// Destucturing

// const {nombre, price } = productos1

console.log(nombre);

// Union de objetos

const medidas = {
  peso: "2kg",
  medidas: "1200x900",
};

const nProducto = { ...productos1, ...medidas };
