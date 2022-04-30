<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html lang="zxx">

<head>
	<title>Fran Quiles</title>
	<!-- Meta tag Keywords -->
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
	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<!-- //web-fonts -->
</head>

<body>
		<div class="container">
			<h1> Agencia de vuelos</h1>
				<div class="row">
					<div class="col s6"></div>
					<div class="col s6">
						<a href= "http://localhost/Agencia-de-Vuelos/Proyecto/login.html"><p><center> Login </center></p></a> 
					</div>
				<div>
			
			</br>
			</br>
			<a class="waves-effect waves-light btn" href="http://localhost/Agencia-de-Vuelos/Proyecto/Consultar_reservas.asp"><input type="button" value="Consultar reserva"></a> 
			</br>
			</br>
			<form method="POST" action="Consulta_de_vuelos.asp">
			
				<div class="input-field col s12">
				Origen: <select name="origen" id="origen">
							<option value="0"> Todos los origenes</option>
							<%
								Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
								do while not origen.EOF
									Response.Write("<option value='" & origen("IDCIUDAD") & "'> " & origen("CIUDAD") & "</option>")
									origen.MoveNext
								loop
							%>
						</select>
				</div>
				<div class="input-field col s12">
				Destino: <select name="Destino" id="Destino">
							<option value="0"> Todos los destinos</option>
							<%
								' Ejecutamos el select e imprimimos todos los resultados en el while
								Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
								
								'Mientras hayan datos continua el while
								do while not destino.EOF
									Response.Write("<option value='" & destino("IDCIUDAD") & "'> " & destino("CIUDAD") & "</option>")
									destino.MoveNext
								loop
							%>
						</select>
				</div>
				<input class="waves-effect waves-light btn" type="submit" value="Buscar">
			</form>
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