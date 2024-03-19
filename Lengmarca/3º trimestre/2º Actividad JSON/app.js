let user = {
    name: "John",
    age: 30,
  
    toString() {
      return `{name: "${this.name}", age: ${this.age}}`;
    }
  };
  
  alert(user); // {name: "John", age: 30}



//   Ejercicio 2


  let student = {
    name: 'John',
    age: 30,
    isAdmin: false,
    courses: ['html', 'css', 'js'],
    spouse: null
  };
  
  let json = JSON.stringify(student);
  
  alert(typeof json); // ¡obtenemos un string!
  
  alert(json);
  /* Objeto JSON-codificado:
  {
    "name": "John",
    "age": 30,
    "isAdmin": false,
    "courses": ["html", "css", "js"],
    "spouse": null
  }
  */


  let user2 = {
    sayHi() { // ignorado
      alert("Hello");
    },
    [Symbol("id")]: 123, // ignorado
    something: undefined // ignorado
  };
  
  alert( JSON.stringify(user2) ); // {} (objeto vacío)
  
// La limitación importante: no deben existir referencias circulares.
// Por ejemplo:

  let room = {
    number: 23
  };
  
  let meetup = {
    title: "Conference",
    participants: ["john", "ann"]
  };
  
  meetup.place = room;       // meetup tiene referencia a room
  room.occupiedBy = meetup; // room hace referencia a meetup
  
  JSON.stringify(meetup); // Error: Convirtiendo estructura circular a JSON
//   Aquí, la conversión falla debido a una referencia circular: room.occupiedBy hace referencia a meetup, y meetup.place hace referencia a room:

