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
 
<%
	idavion=request.form("idavi")
	avion=request.form("avi")
	idreserva=request.form("idreserva")
	dni=request.form("dni")
	Nombre=request.form("Nombre")
	Apellidos=request.form("Apellidos")
	N_Asientos=request.form("N_Asientos")
	PRECIO=request.form("precio")
	ciudad_oriden=request.form("ciudad_oriden")
	ciudad_destino=request.form("ciudad_destino")
	
	SentenciaSQL = "insert into RESERVA values (" & idreserva & ",'" & Apellidos & "','" & Nombre & "','" & dni & "'," & idavion & "," & N_Asientos & ", 0)"
	Set rs = Conexion.Execute(SentenciaSQL)
	
%>
<div class="container">
	<p> Su reserva se ha realizado correctamente. 
	<br> 
	Puede consultar su reserva en el apartado de <a href="http://localhost/Agencia-de-Vuelos/AjaxObligatorio/Consultar_reservas.asp"> consultar reserva </a> 
	<br> 
	Poniendo su dni y su id de reserva. ( <% response.write(idreserva) %> ) 
	<br> 
	PRECIO TOTAL: <% response.write(PRECIO*N_Asientos) %> </p>

	<h2> Posibles vuelos para la vuelta </h2>
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
		Sentencia = " select * from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN='" & ciudad_destino & "'"
		Set origen = Conexion.Execute(Sentencia)				
		do while not origen.EOF
			Response.Write("<tr><td><center><a href=reservar_vuelo.asp?idavion=" & origen("IDVUELO") & ">" & origen("IDVUELO") & "</a></center></td><td><center>" & origen("CIUDAD_ORIGEN") & "</center></td><td><center> " & origen("CIUDAD_DESTINO") & "</center></td><td><center> " & origen("FECHA") & "</center></td><td><center> " & origen("COMPANIA") & "</center></td><td><center> " & origen("IDAVION") & "</center></td><td><center> " & origen("AVION") & "</center></td><td><center> " & origen("N_PLAZAS") & "</center></td><td><center> " & origen("N_PLAZAS_DISPONIBLES") & "</center></td><td><center> " & origen("DURACION") & "</center></td><td><center> " & origen("PRECIO") & "</center></td></td></tr>")
			origen.MoveNext
		loop
	%>

	</table>
</div>
    <div class="footer">
		<div class="container">
				<div class="row">
				  <div class="col l6 s12">
					<h5 class="white-text">Info de la empresa </h5>
					<p class="grey-text text-lighten-4">Empresa disponible para poder consultar vuelos</p>
				  </div>
				  <div class="col l6 s12">
					<h5 class="white-text">Ubicación</h5>
					<p class="grey-text text-lighten-4">Elche</p>
				  </div>
				</div>
			</div>
	</div>
	<!-- //copyright -->

	<!-- Jquery -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- //Jquery -->

	<!-- effect js -->
	<script src="js/canva_moving_effect.js"></script>
</body>
</body>
</html>