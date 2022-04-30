<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,org.firebirdsql.management.*"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Fran Quiles</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

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
			<h1>Consulta de reservas JSP</h1>
			
			<%@ include file="conexion.jsp" %>
			
			<%
				String dni = request.getParameter("dni"); 
				String ciudad = request.getParameter("ciudad");
				String idciudad = "";
				String SQL = "SELECT R.IDRESERVA as RESERVA,R.NIF, CI.CIUDAD as CITY, CIU.CIUDAD as CIUDADES, V.IDVUELO, R.APELLIDOS,R.NOMBRE,C.COMPANIA,V.FECHA,R.CANCELADO FROM CIUDAD CI,COMPANIA C,VUELO V,RESERVA R, CIUDAD CIU  WHERE V.IDCIUDADDESTINO=CIU.IDCIUDAD AND V.IDCIUDADORIGEN=CI.IDCIUDAD AND V.IDCOMPANIA=C.IDCOMPANIA AND V.IDVUELO=R.IDVUELO AND R.NIF= \'"+ dni +"\'  AND CI.CIUDAD=\'"+ ciudad + " \'";
				
				PreparedStatement sentencia = null;
				ResultSet rs = null;
				boolean errorResultados = false;
				boolean hayRegistros = false;
				try
				{
					sentencia = connrs.prepareStatement(SQL);
					rs = sentencia.executeQuery();
					hayRegistros = rs.next();
					
				}catch(SQLException e){
				
					errorResultados = true;				
			%>
			<p> ERROR: <%= e.getMessage() %>
			
			<%
				}
				
				if(hayRegistros)
				{
					%>
					<table>
						<tr>
							<td><b>ID Reserva</b></td>
                            <td><b>ID Vuelo</b></td>
                            <td><b>Nombre</b></td>
                            <td><b>Apellidos</b></td>
                            <td><b>Origen</b></td>
                            <td><b>Destino</b></td>
                            <td><b>Fecha</b></td>
                            <td><b>Companyia</b></td>
                            <td><b>Cancelado</b></td>
                        </tr>
                        
					<%
						boolean hecho = false;
						while(!hecho){
							String idreserva = rs.getString("RESERVA");
							String idvuelo = rs.getString("IDVUELO");
							String apellido = (String) rs.getObject("APELLIDOS");
							String nombre = (String) rs.getObject("NOMBRE");
							String compania = (String) rs.getObject("COMPANIA");
							String fecha = rs.getString("FECHA");
							String cancelado = rs.getString("CANCELADO");
							String ciudades = (String)rs.getString("CITY");
							String destino = (String)rs.getString("CIUDADES");
                    %>
                                <tr>
                                    <td><%=idreserva%></td>
                                    <td><%=idvuelo%></td>
                                    <td><%=nombre%></td>
                                    <td><%=apellido%></td>
                                    <td><%=ciudades%></td>
                                    <td><%=destino%></td>
                                    <td><%=fecha%></td>
                                    <td><%=compania%></td>
                                    <td><%=cancelado%></td>
                                </tr>
							
					<%
							hecho = !rs.next();
						}
					%>
					</table>
					<%
				}
				else{
				
					%>
				
					<p> No hay resultados </p>
				
					<%
				}
				
				if(sentencia != null){
					
					sentencia.close();
				}
				
				if(connrs != null){
					connrs.close();
				}
				
				%>
				
				
					
			
			
		</div>
		
		<br>
		<br>
		<footer class="page-footer">
			<div class="container">
				<div class="row">
				  <div class="col l6 s12">
					<h5 class="white-text">Info de la empresa </h5>
					<p class="grey-text text-lighten-4">Empresa creada en el año 2022, para la asignatura de DAI</p>
				  </div>
				  <div class="col l6 s12">
					<h5 class="white-text">Ubicación</h5>
					<p class="grey-text text-lighten-4">Elche</p>
				  </div>
				</div>
			</div>
		</footer>
            
	</body>
</html>