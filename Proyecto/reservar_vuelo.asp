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
	'Aqui estamos recibiendo el id del avion < modificar mediante un GET'
	id_avion_recibido=request.querystring("idavion")
	
	'Seleccionamos el avion que tiene dicho id'
	Sentencia = " select IDVUELO, AVION, DURACION, PRECIO, CIUDAD_ORIGEN, CIUDAD_DESTINO from LISTA_VUELOS_PRECIO where IDVUELO= " & id_avion_recibido
	Set origen = Conexion.Execute(Sentencia)

	'variables
	idvuelo=origen("IDVUELO")
	avion=origen("AVION")
	precios=origen("PRECIO")
	ciudad_origen=origen("CIUDAD_ORIGEN")
	ciudad_destino=origen("CIUDAD_DESTINO")
	
	Set consulta = Conexion.Execute("select max(IDRESERVA) as ultimo_id from RESERVA")
	id_reserve = consulta("ultimo_id")+1
	
	
%>
<div id="bg">
		<canvas></canvas>
		<canvas></canvas>
		<canvas></canvas>
		
	</div>

<div class="container">

	<h1> Deseas reservar una reserva en el vuelo <% response.write(avion) %>? </h1>

	<form class="col s12" name="formulario_aviones" action="insert_booking_fly.asp" method="post">
		<table>
			<tr>
				<td> IDAVION </td>
				<td><input type=text name=idavi readonly value= <% response.write(idvuelo) %>></td>
			</tr>
			<tr>
				<td> IDRESERVA </td>
				<td><input type=text name=idreserva readonly value= <% response.write(id_reserve) %>></td>
			</tr>
			<tr>
				<td> AVION </td>
				<td><input type=text name=avi readonly value=" <% response.write(avion) %>"></td>
			</tr>
			<tr>
				<td> DNI</td>
				<td><input type=text name=dni ></td>
			</tr>
			<tr>
				<td> Nombre </td>
				<td><input type=text name=Nombre></td>
			</tr>
			<tr>
				<td> Apellidos </td>
				<td><input type=text name=Apellidos></td>
			</tr>
			<tr>
				<td> N_Asientos </td>
				<td><input type=text name=N_Asientos></td>
			</tr>
			<tr>
				<td> Precio por Asiento </td>
				<td><input type=text name=precio readonly value= <% response.write(precios) %>></td>
			</tr>
			<tr>
				<td><input type=hidden name=ciudad_oriden readonly value= <% response.write(ciudad_origen) %>></td>
			</tr>
			<tr>
				<td><input type=hidden name=ciudad_destino readonly value= <% response.write(ciudad_destino) %>></td>
			</tr>
		</table>

	<input class="waves-effect waves-light btn" type="submit" value="RESERVAR">

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
</html>