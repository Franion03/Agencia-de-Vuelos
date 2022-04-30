<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,org.firebirdsql.management.*"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Vicente Candela Pérez</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

		<!--Import Google Icon Font-->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

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