(: 1.- Título y editorial de todos los librosPara devolver varios campos, los envolvemos en un elemento. :)

(: for $x in doc("libros.xml")/biblioteca/libros/libro
return <libro>{$x/titulo, $x/editorial}</libro> :)



(: 2.- El título (sin etiquetas) de todos los libros de menos de 100 páginas.Para hacer comparaciones con números, lo mejor es convertir los datos con la función number para evitar problemas de tipo de dato o que los compare como cadenas. :)

(:
for $x in doc("libros.xml")/biblioteca/libros/libro
where number($x/paginas) < 100
return data($x/titulo) :)



(: 3.- El número de  libros de menos de 100 páginas.Utilizamos la función count() :)

(:Como lo hice yo:)
(: for $x in doc("libros.xml")/biblioteca/libros/libro
where number($x/paginas)<100
return count($x)
 :)

(: Como lo hace la corrección :)
(: for $x in doc("libros.xml")/biblioteca/libros
let $y := $x/libro[number(paginas) < 100]
return count($y) :)



(: 4.- Una lista HTML con el título de los libros de la editorial “O'Reilly” ordenados por título.Podemos mezclar etiquetas HTML y XQuery y obtener HTML como resultado de una consulta. :)

(:<ul>
{
for $x in doc("libros.xml")/biblioteca/libros/libro
where $x/editorial = "O'Reilly"
order by $x/titulo
return <li>{data($x/titulo)}</li>
}
</ul> :)



(: 5.- Título y editorial de los libros de 2002 :)

(:for $x in doc("libros.xml")/biblioteca/libros/libro
where $x[@publicacion=2002]
return <libro>{$x/titulo, $x/editorial}</libro> :)



(: 6.- Título y editorial de los libros con más de un autor. :)

(:for $x in doc("libros.xml")/biblioteca/libros/libro
where count($x/autor)>1
return <libro>{$x/titulo, $x/editorial}</libro>:)



(: 7.- Título y editorial de los libros que tienen versión electrónica. :)

(:for $x in doc("libros.xml")/biblioteca/libros/libro
where $x/versionElectronica
return <libro>{$x/titulo, $x/editorial}</libro> :)



(: 8.- Título de los libros que no tienen versión electrónica. :)

for $x in doc("libros.xml")/biblioteca/libros/libro
where not($x/versionElectronica)
return$x/titulo























