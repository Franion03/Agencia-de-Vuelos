<!DOCTYPE HTML>
<!-- #include file=conexion.asp --> 
<html>
	<head>
		<title>Fran Quiles</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--Import Google Icon Font-->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      
		<!-- Compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	</head>
	<body>
	<div class="container">
		
		<%
			ciudad_origen = request.form("origen")
			ciudad_destino = request.form("Destino")
			If not ciudad_origen = 0 then
				Set datos = Conexion.Execute("select CIUDAD from CIUDAD where IDCIUDAD= " & ciudad_origen)
			end if
			
			If not ciudad_destino = 0 then 
				Set consulta = Conexion.Execute("select CIUDAD from CIUDAD where IDCIUDAD= " & ciudad_destino)
			end if
			
		%>
		
		<h1> Sitio de Administradores </h1>
		<table class="striped">
		<tr>
			<th> IDVUELO </th>
			<th> CIUDAD_ORIGEN </th>
			<th> CIUDAD_DESTINO </th>
			<th> FECHA </th>
			<th> COMPANIA </th>
			<th> IDAVION </th>
			<th> AVION </th>
			<th> N_PLAZAS </th>
			<th> N_PLAZAS_DISPONIBLES </th>
			<th> DURACION </th>
			<th> PRECIO </th>
		</tr>

		<% 
			If ciudad_origen = 0 and ciudad_destino = 0 then
				Sentencia = " select * from LISTA_VUELOS_PRECIO"
				Set origen = Conexion.Execute(Sentencia)				
				do while not origen.EOF
					Response.Write("<tr><td><center><a href=reservar_vuelo.asp?idavion=" & origen("IDVUELO") & ">" & origen("IDVUELO") & "</a></center></td><td>" & origen("CIUDAD_ORIGEN") & "</td><td><center> " & origen("CIUDAD_DESTINO") & "</center></td><td><center> " & origen("FECHA") & "</center></td><td><center> " & origen("COMPANIA") & "</center></td><td><center> " & origen("IDAVION") & "</center></td><td><center> " & origen("AVION") & "</center></td><td><center> " & origen("N_PLAZAS") & "</center></td><td><center> " & origen("N_PLAZAS_DISPONIBLES") & "</center><td><center> " & origen("DURACION") & "</center></td><td><center> " & origen("PRECIO") & "</center></td></td></tr>")
					origen.MoveNext
				loop
			
			ElseIf ciudad_origen = 0 then 
				Sentencia = " select * from LISTA_VUELOS_PRECIO where CIUDAD_DESTINO = '" & consulta("CIUDAD") & " ' "
				Set origen = Conexion.Execute(Sentencia)
				do while not origen.EOF
					Response.Write("<tr><td><center><a href=reservar_vuelo.asp?idavion=" & origen("IDVUELO") & ">" & origen("IDVUELO") & "</a></center></td><td>" & origen("CIUDAD_ORIGEN") & "</td><td><center> " & origen("CIUDAD_DESTINO") & "</center></td><td><center> " & origen("FECHA") & "</center></td><td><center> " & origen("COMPANIA") & "</center></td><td><center> " & origen("IDAVION") & "</center></td><td><center> " & origen("AVION") & "</center></td><td><center> " & origen("N_PLAZAS") & "</center></td><td><center> " & origen("N_PLAZAS_DISPONIBLES") & "</center><td><center> " & origen("DURACION") & "</center></td><td><center> " & origen("PRECIO") & "</center></td></td></tr>")
					origen.MoveNext
				loop
			
			ELseIf ciudad_destino = 0 then 
				Sentencia = " select * from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN = '" & datos("CIUDAD") & " ' "
				Set origen = Conexion.Execute(Sentencia)
				do while not origen.EOF
					Response.Write("<tr><td><center><a href=reservar_vuelo.asp?idavion=" & origen("IDVUELO") & ">" & origen("IDVUELO") & "</a></center></td><td>" & origen("CIUDAD_ORIGEN") & "</td><td><center> " & origen("CIUDAD_DESTINO") & "</center></td><td><center> " & origen("FECHA") & "</center></td><td><center> " & origen("COMPANIA") & "</center></td><td><center> " & origen("IDAVION") & "</center></td><td><center> " & origen("AVION") & "</center></td><td><center> " & origen("N_PLAZAS") & "</center></td><td><center> " & origen("N_PLAZAS_DISPONIBLES") & "</center><td><center> " & origen("DURACION") & "</center></td><td><center> " & origen("PRECIO") & "</center></td></td></tr>")
					origen.MoveNext
				loop
			Else
				Sentencia = " select * from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN = '" & datos("CIUDAD") & " '  AND CIUDAD_DESTINO='" & consulta("CIUDAD") & " '"
				Set origen = Conexion.Execute(Sentencia)
				do while not origen.EOF
					Response.Write("<tr><td><center><a href=reservar_vuelo.asp?idavion=" & origen("IDVUELO") & ">" & origen("IDVUELO") & "</a></center></td><td>" & origen("CIUDAD_ORIGEN") & "</td><td><center> " & origen("CIUDAD_DESTINO") & "</center></td><td><center> " & origen("FECHA") & "</center></td><td><center> " & origen("COMPANIA") & "</center></td><td><center> " & origen("IDAVION") & "</center></td><td><center> " & origen("AVION") & "</center></td><td><center> " & origen("N_PLAZAS") & "</center></td><td><center> " & origen("N_PLAZAS_DISPONIBLES") & "</center><td><center> " & origen("DURACION") & "</center></td><td><center> " & origen("PRECIO") & "</center></td></td></tr>")
					origen.MoveNext
				loop
			end if
		%>

		</table>
		
	</div>
	</body>
</html>