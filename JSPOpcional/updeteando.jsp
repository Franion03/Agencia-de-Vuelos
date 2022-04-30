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
			
			
			<%= request.getParameter("idavion")%>
			<%= request.getParameter("avion")%>
			<%= request.getParameter("precio")%>
			<%= request.getParameter("plazas")%>
			
			<%
				String idavion = request.getParameter("idavion");
				String avion = request.getParameter("avion");	
				String precio = request.getParameter("precio");	
				String plazas = request.getParameter("plazas");
				
				String SQL = "UPDATE AVION SET AVION=\'"+ avion + "\', PRECIO_BASE = " + precio + ", N_PLAZAS = " + plazas +"WHERE IDAVION = " + idavion ;
				
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
				
				}
				
			%>
			<p> Se ha actualizado un reguistro </p>
			<%
				
					if(sentencia != null){
					
					sentencia.close();
					}
					
					if(connrs != null){
						connrs.close();
					}
				
				%>
				
		</div>
            
	</body>
</html>