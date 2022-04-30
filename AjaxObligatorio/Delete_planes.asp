<!DOCTYPE html>
<!-- #include file=seguridad.asp --> 
<!-- #include file=conexion.asp --> 
<html>
<body> 

<%

	id_avion_recibido=request.querystring("id")

	SentenciaSQL = "delete from AVION where IDAVION=" & id_avion_recibido
	
	Set rs = Conexion.Execute("delete from AVION where IDAVION=" & id_avion_recibido)
	
	if Conexion.Errors.Count>0 then
		for each error in Conexion.Errors
			response.write(Error.Number & " = " & Error.Description)
			next
	else
		response.write("El avion fue borrado con exito")
	end if
	
	Conexion.Close
	Set Conexion = nothing


%>


</body>
</html>