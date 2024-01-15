const roll = "VISITANTE";

if(roll==="ADMINISTRADOR"){
    console.log("acceso a todo el sistema");
}else if(roll==="EDITOR"){
    console.log("Eres editor");
} else{
    console.log("visitante, no tienes acceso a nada");
}