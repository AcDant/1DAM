"A partir del fichero artistas.xml, escribe consultas XQuery que devuelvan:",

"1 Nombre y país de todos los artistas.",

for $x in doc("artistas.xml")/artistas/artista
return ($x/nombreCompleto/data(), $x/pais/data()),
" ",
"2 El nombre (sin etiquetas) de los artistas que nacieron antes de 1500.",
for $x in doc("artistas.xml")/artistas/artista
where $x/nacimiento < 1500
return $x/nombreCompleto/data(),
" ",
"3 Nombre de los artistas para los que no hay año de fallecimiento.",
for $x in doc("artistas.xml")/artistas/artista
where not($x/fallecimiento)
return $x/nombreCompleto/data(),
" ",

"4 Una lista HTML con el nombre de los artistas nacidos en España.",
<ul>{
for $x in doc("artistas.xml")/artistas/artista
where $x/pais = 'España'
return <li><artista>{$x/nombreCompleto}</artista></li> 
}</ul>,
" ",

"5 El número de artistas nacidos antes de 1600.",
count(for $x in doc("artistas.xml")/artistas/artista
where $x/nacimiento < 1600
return$x),
" ",
"6 A partir del fichero impresoras.xml, escribe consultas XQuery que devuelvan:",

"7 Modelo de las impresoras de tipo “láser”.",
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/@tipo = 'láser'
return $x/modelo/data(),
" ",
"8 Marca y modelo de las impresoras con más de un tamaño .",
for $x in doc("impresoras.xml")/impresoras/impresora
where count($x/tamaño)>1
return ("Marca", $x/marca/data(),"Modelo", $x/modelo/data()),
" ",
"9 Marca y modelo de las impresoras con tamaño A3 (pueden tener otros).",
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/tamaño = 'A3'
return ("Marca", $x/marca/data(),"Modelo", $x/modelo/data()),
" ",
"10 Marca y modelo de las impresoras con tamaño A3 como único tamaño .",
for $x in doc("impresoras.xml")/impresoras/impresora
where count($x/tamaño) = 1 and $x/tamaño = 'A3'
return ("Marca", $x/marca/data(),"Modelo", $x/modelo/data()),
" ",
"11 Modelo de las impresoras en red.",
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/enred
return ("Modelo", $x/modelo/data())