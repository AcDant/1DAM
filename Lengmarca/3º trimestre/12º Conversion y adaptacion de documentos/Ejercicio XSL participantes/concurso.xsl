<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Participantes</title>
                <link rel="stylesheet" href="estilos.css" />
            </head>
            <body>
                <div class="header">
                    <h1>Información del concurso</h1>
                </div>
                
                <main>
                    <h2>Listado de Participantes</h2>
                    <ol class="participantes">
                        <!-- Lista de participantes EJERCICIO 1-->
                        <!-- <xsl:for-each select="//participante">
                             <xsl:sort select="apellidos" order="ascending"/>   
                             <li>
                             <xsl:value-of select="apellidos"/>
                             <xsl:text>, </xsl:text>
                             <xsl:value-of select="nombre" />
                             <xsl:text>. (</xsl:text>
                             <xsl:value-of select="@codigo"/>
                             <xsl:text>) - </xsl:text>
                             <xsl:value-of select="puntos" />
                             <xsl:text> puntos </xsl:text>
                             </li>
                             
                             </xsl:for-each> -->
                        <!-- MODO ALTERNATIVO EJERCICIO 1-->
                        <xsl:apply-templates select="//participante" mode="lista">
                            <xsl:sort select="apellidos" order="ascending">
                            </xsl:sort>
                        </xsl:apply-templates>
                    </ol>
                    <!-- TABLA EJERCICIO 2-->
                    
                    <h2>5 - Mejores participantes con más de 20 puntos</h2>
                    <table class="participantes-t ancho">
                        <thead>
                            <tr>
                                <th>Posición</th>
                                <th>Participante</th>
                                <th>Puntos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Tabla de participantes-->
                            <!-- MODO 1 -->
                            <!-- <xsl:for-each select="//participante[puntos]">
                                 <xsl:sort select="puntos" order="descending"/>
                                 <xsl:if test="position()&lt;=5">
                                 <tr>
                                 <td> <xsl:value-of select="position()"/> </td>
                                 <td><xsl:value-of select="apellidos"/>
                                 <xsl:text>, </xsl:text>
                                 <xsl:value-of select="nombre" /></td>
                                 <td><xsl:value-of select="puntos" /></td>
                                 </tr>
                                 </xsl:if>                        
                                 </xsl:for-each> -->
                            <!-- MODO ALTERNATIVO EJERCICO 2 -->
                            <xsl:apply-templates select="//participante" mode="tabla">
                                <xsl:sort select="puntos" order="descending">
                                </xsl:sort>
                            </xsl:apply-templates>
                        </tbody>
                    </table>
                </main>
            </body>
        </html>
    </xsl:template>
    <!-- MODO ALTERNATIVO EJERCICIO 1-->
    <xsl:template match="participante" mode="lista">
        <li>
            <xsl:value-of select="apellidos"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="nombre" />
            <xsl:text>. (</xsl:text>
            <xsl:value-of select="@codigo"/>
            <xsl:text>) - </xsl:text>
            <xsl:value-of select="puntos" />
            <xsl:text> puntos </xsl:text>
        </li>
    </xsl:template>
    <!-- MODO ALTERNATIVO EJERCICO 2 -->
    <xsl:template match="participante" mode="tabla">
        <xsl:if test="position()&lt;=5">
            <tr>
                <td> <xsl:value-of select="position()"/> </td>
                <td><xsl:value-of select="apellidos"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="nombre" /></td>
                <td><xsl:value-of select="puntos" /></td>
            </tr>
        </xsl:if> 
    </xsl:template>
    
    
</xsl:stylesheet>