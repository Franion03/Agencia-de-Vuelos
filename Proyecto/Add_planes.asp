<!DOCTYPE html>
<!-- #include file=seguridad.asp --> 
<!-- #include file=conexion.asp --> 
<html>
<body> 

<%
	idavion=request.form("idavi")
	avion=request.form("avi")
	n_plazas=request.form("plazas")
	precio_base=request.form("precio")

	SentenciaSQL = "insert into AVION values(" & idavion & ", '" & avion & "', " & n_plazas & ", " & precio_base & ")"
	
	Set rs = Conexion.Execute(SentenciaSQL)
	
	response.write("El avion fue anyadido con exito")
	
	Conexion.Close
	Set Conexion = nothing


%>


</body>
</html>