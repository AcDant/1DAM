<ul>
{
for $x in doc("libros.xml")/bib/libro
where $x[@anyo < 2000]
order by $x/anyo
return <li>{$x/titulo/data()} </li>
}
</ul>
