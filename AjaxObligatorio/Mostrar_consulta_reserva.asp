<!DOCTYPE html>
<!-- #include file=conexion.asp --> 
<html>
    <head>
	<title>Fran Quiles</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Effect Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/fontawesome-all.css">
	<link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    </head>
<body>
<div class="container">
	<%
		idreserva = request.form("idreserva")
		dni = request.form("dni")
		
		SentenciaSQL = "select COUNT(*) as numero from RESERVA where IDRESERVA= " & idreserva & " AND NIF = '" & dni & "'"
		
		Set prueba = Conexion.Execute(SentenciaSQL)
		If(prueba("numero")<1) then
			response.write("Su consulta no ha sido encontrada")
		
		Else	

			Sentencia = "select IDRESERVA, APELLIDOS, NOMBRE, NIF, IDVUELO, N_ASIENTOS from RESERVA where IDRESERVA= " & idreserva & " AND NIF = '" & dni & "'"
			
			Set origen = Conexion.Execute(Sentencia)
			
			id_reserve = origen("IDRESERVA")
			apellidos = origen("APELLIDOS")
			nombre = origen("NOMBRE")
			dni = origen("NIF")
			idvuelo = origen("IDVUELO")
			N_Asientos = origen("N_ASIENTOS")
			
			Response.Write("<table class='striped'><tr><td><center> IDRESERVA </center></td><td><input type=text name=idreserv readonly value= " & id_reserve & " ></td></tr> <td><center> APELLIDOS </center></td><td><input type=text name=apellidos readonly value= '" & apellidos & "'></td></tr><td><center> NOMBRE </center></td><td><input type=text name=nombre readonly value= '" & nombre & "'></td></tr><td><center> NIF </center></td><td><input type=text name=dni readonly value= '" & dni & "'></td></tr><td><center> IDVUELO </center></td><td><input type=text name=idvuelo readonly value= " & idvuelo & "></td></tr><td><center> N_ASIENTOS </center></td><td><input type=text name=N_Asientos readonly value= " & N_Asientos & "></td></tr></table><br>")
		
			response.write("<a href=http://localhost/Agencia-de-Vuelos/AjaxObligatorio/Cancelar_reserva.asp?idreserva=" & id_reserve & "><input class='waves-effect waves-light btn' type=button value='Cancelar reserva'></a>")
		end if		

	%>

</div>
    <div class="footer">
		
	</div>
	<!-- //copyright -->

	<!-- Jquery -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- //Jquery -->

	<!-- effect js -->
	<script src="js/canva_moving_effect.js"></script>
</body>
</html>