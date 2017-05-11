<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
	<html>
		<head><title>Lista de Partes Mensual</title></head>
	<style>
		table, th, td {
			border: 1px solid black;
			padding: 5px;
		}
		table {
			border-spacing: 15px;
		}
	</style>
			
	<body>
		<h1>Lista de Partes Mensual</h1>
		<div style="width:100%">
		<table border="1">
			<xsl:for-each select="partes/partes">
						<tr>
							<th>ID Parte</th>
							<th>KM Inicio</th> 
							<th>KM Fin</th>
							<th>Gasto</th>
							<th>Incidencia</th>
							<th>Estado</th>
						</tr>
						<tr>
							<td><xsl:value-of select="idParte"/></td>
							<td><xsl:value-of select="kmInicio"/></td>
							<td><xsl:value-of select="kmFin"/></td>
							<td><xsl:value-of select="gasto"/></td>
							<td><xsl:value-of select="incidencia"/></td>
							<td><xsl:value-of select="estado"/></td>
						</tr>
					</xsl:for-each>
		</table>
		</div>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>