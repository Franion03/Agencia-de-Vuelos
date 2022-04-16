<!DOCTYPE html>
<!-- #include file=conexion.asp --> 
<!-- #include file=seguridad.asp -->
<html>
<body> 
<%
	idavion=request.form("idavi")
	avion=request.form("avi")
	n_plazas=request.form("plazas")
	precio_base=request.form("precio")

	SentenciaSQL = "Update AVION set AVION = '" & avion & "', N_PLAZAS=" & n_plazas & ", PRECIO_BASE=" & precio_base & " where IDAVION=" & idavion
	
	Set rs = Conexion.Execute(SentenciaSQL)
	
	response.write("El avion fue modificado con exito")
	
	Conexion.Close
	Set Conexion = nothing

%>
</body>
</html>