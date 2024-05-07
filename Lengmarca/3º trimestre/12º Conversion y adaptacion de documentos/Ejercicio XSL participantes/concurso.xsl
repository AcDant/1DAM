<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <title>Participantes</title>
                <link rel="stylesheet" href="estilos.css"/>
            </head>
            <body>
                <div class="header">
                    <h1>Información del concurso</h1>
                </div>

                <main>
                    <h2>Listado de Participantes</h2>
                    <ol class="participantes">
                        <!-- Lista de participantes-->
                        <li>Apellidos, nombre. (código) - X puntos</li>
                        <li>Apellidos, nombre. (código) - X puntos</li>
                        <li>Apellidos, nombre. (código) - X puntos</li>
                    </ol>
                </main>
            </body>
        </html>
    </xsl:template>
    |
</xsl:stylesheet>