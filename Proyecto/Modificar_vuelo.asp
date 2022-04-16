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
	
<%

    'keeping id of the plane'
    id_avion_recibido=request.querystring("idavion")

    'Selecting plane with id keeped'
    Set datos = Conexion.Execute("select IDAVION, AVION, N_PLAZAS, PRECIO_BASE from AVION where IDAVION= " & id_avion_recibido)

    idavion=datos("IDAVION")
    avion=datos("AVION")
    num_plazas=datos("N_PLAZAS")
    precio_base=datos("PRECIO_BASE")

%>
<div class="container">
	<form name="formulario_aviones" action="Upload.asp" method="post">
	<table class="striped">
		<tr>
			<td> IDAVION </td>
			<td><input type=text name=idavi readonly value= <% response.write(idavion) %>></td>
		</tr>
		<tr>
			<td> AVION </td>
			<td><input type=text name=avi value=" <% response.write(avion) %>"></td>
		</tr>
		<tr>
			<td> N_PLAZAS </td>
			<td><input type=text name=plazas value= <% response.write(num_plazas) %>></td>
		</tr>
		<tr>
			<td> PRECIO_BASE </td>
			<td><input type=text name=precio value= <% response.write(precio_base) %>></td>
		</tr>
	</table>

	<input class="waves-effect waves-light btn" type="submit" value="Editar">

	<%
		response.write("<a href=http://localhost/Agencia-de-Vuelos/Proyecto/Delete_planes.asp?id=" & datos("idavion") & "><input class='waves-effect waves-light btn' type=button value=Borrar></a>")
	%>

	</form>
</body>
</html>