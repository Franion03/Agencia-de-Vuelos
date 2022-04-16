<!DOCTYPE html>
<!-- #include file=seguridad.asp --> 
<!-- #include file=conexion.asp --> 
<html>
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
	<h1> Sitio de Administradores </h1>
	<table class="striped">
		<tr>
			<th> IDAVION </th>
			<th> AVION </th>
			<th> N_PLAZAS </th>
			<th> PRECIO_BASE </th>
		</tr>

	<% 
		Set origen = Conexion.Execute("select IDAVION, AVION, N_PLAZAS, PRECIO_BASE from AVION")
		do while not origen.EOF
			Response.Write("<tr><td><center><a href=Modificar_vuelos.asp?idavion=" & origen("IDAVION") & ">" & origen("IDAVION") & "</a></center></td><td>" & origen("AVION") & "</td><td><center> " & origen("N_PLAZAS") & "</center></td><td><center> " & origen("PRECIO_BASE") & "</center></td></tr>")
			origen.MoveNext
		loop
	%>

	</table>

	
</div>
</body>
</html>