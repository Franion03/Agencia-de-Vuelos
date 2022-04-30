<!DOCTYPE html>
<!-- #include file=seguridad.asp --> 
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
    <div id="bg">
		<canvas></canvas>
		<canvas></canvas>
		<canvas></canvas>
	</div>
	<h1> Administradores </h1>
	<table class="fa-table">
		<tr>
			<th> IDAVION </th>
			<th> AVION </th>
			<th> N_PLAZAS </th>
			<th> PRECIO_BASE </th>
		</tr>

	<% 
		Set origen = Conexion.Execute("select IDAVION, AVION, N_PLAZAS, PRECIO_BASE from AVION")
		do while not origen.EOF
			Response.Write("<tr><td><center><a href=Modificar_vuelo.asp?idavion=" & origen("IDAVION") & ">" & origen("IDAVION") & "</a></center></td><td>" & origen("AVION") & "</td><td><center> " & origen("N_PLAZAS") & "</center></td><td><center> " & origen("PRECIO_BASE") & "</center></td></tr>")
			origen.MoveNext
		loop
	%>
	</table>
    <a class="waves-effect waves-light btn" href="http://localhost/Agencia-de-Vuelos/Proyecto/Añadir_aviones.asp"><input type="button" value="Anyadir"></a>
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
</html>