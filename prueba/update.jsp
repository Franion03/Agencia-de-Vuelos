<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,org.firebirdsql.management.*"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Fran Quiles</title>
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
			
			
			<% 
				
				String idavion = request.getParameter("idavion");		
				String SQL = "SELECT IDAVION, AVION, N_PLAZAS, PRECIO_BASE FROM AVION WHERE IDAVION = " + idavion  ;
				
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
				
					boolean hecho = false;
										
					String avion = (String) rs.getString("AVION");
					Integer plazas =  (Integer) rs.getObject("N_PLAZAS");
					Double precio = (Double) rs.getObject("PRECIO_BASE");
							
							
                    %>

						<form class="col s12" method="POST" action="updeteando.jsp">
							<div class="row">
								<div class="input-field col s6">
								  <input name="idavion" type="text" class="validate" readonly value= <%= idavion %> >
								  
								</div>
							</div>
							<div class="row">
								<div class="input-field col s6">
								  <input placeholder="AVION:" name="avion" type="text" class="validate" value= <%= avion %> >
								  
								</div>
							</div>
							<div class="row">
								<div class="input-field col s6">
								  <input placeholder="plazas:" name="plazas" type="text" class="validate" value= <%= plazas %> >
								  
								</div>
							</div>
							<div class="row">
								<div class="input-field col s6">
								  <input placeholder="precio:" name="precio" type="text" class="validate" value= <%= precio %> >
								  
								</div>
							</div>

							<input class="waves-effect waves-light btn" type="submit" value="Enviar">
						</form>
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