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
			<h1>Listado de Aviones JSP</h1>
			
			<%@ include file="conexion.jsp" %>
			
			<%
				String SQL = "SELECT IDAVION, AVION, N_PLAZAS, PRECIO_BASE FROM AVION";
				
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
							<td><b>ID Avion</b></td>
                            <td><b>AVION</b></td>
                            <td><b>N_PLAZAS</b></td>
                            <td><b>PRECIO_BASE</b></td>
                        </tr>
                        
					<%
					
						boolean hecho = false;
						while(!hecho){
							
							String idavion = rs.getString("IDAVION");
							String avion = (String) rs.getString("AVION");
							Integer plazas =  (Integer) rs.getObject("N_PLAZAS");
							Double precio = (Double) rs.getObject("PRECIO_BASE");							
							
                    %>

                                <tr>
								<td><a href=update.jsp?idavion=<%=idavion%>><%=idavion%></a></td>
                                    <td><%=idavion%></td>
                                    <td><%=avion%></td>
                                    <td><%=plazas%></td>
                                    <td><%=precio%></td>
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