document.querySelector('body').addEventListener('mousemove',eyeball);

function eyeball(){
    const eye = document.querySelectorAll('.eye');
    eye.forEach(function (eye) {
      let x = (eye.getBoundingClientRect().left) + (eye.clientWidth / 2);
      let y = (eye.getBoundingClientRect().top) + (eye.clientHeight / 2);
      let radian = Math.atan2(event.pageX - x, event.pageY - y);
      let rotation = (radian * (180 / Math.PI) * -1) + 270;
      eye.style.transform = "rotate(" + rotation + "deg)";
    });
}

// Cerrando ojos
document.querySelector('.box-front').addEventListener('mouseover',eyecloset);
// document.querySelector('.box').addEventListener('mouseover',eyecloset);
function eyecloset(){
  const eyeclosetop = document.querySelector('.box-t');
  eyeclosetop.style.transform = "translate(0rem, 5rem)";

  const eyeclosebot = document.querySelector('.box-b');
  eyeclosebot.style.transform = "translate(0rem, -5rem)";

  console.log("cierra")
}

// Abriendo ojos

document.querySelector('.box-front').addEventListener('mouseout',eyeopent);
// document.querySelector('.box').addEventListener('mouseout',eyeopent);

function eyeopent(){
  const eyeopentop = document.querySelector('.box-t');
  eyeopentop.style.transform = "translate(0rem, 0rem)";

  const eyeopenbot = document.querySelector('.box-b');
  eyeopenbot.style.transform = "translate(0rem, 0rem)";
  console.log("abierto")



  // alert("holi")
}

// function eyeopenb(){
//   const eyeopenbot = document.querySelector('.box-b');
//   eyeopenbot.style.transform = "translate(0rem, 0rem)";
//   alert("holi")
// }