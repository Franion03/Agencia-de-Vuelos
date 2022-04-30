<!DOCTYPE html>
<!-- #include file=seguridad.asp --> 
<!-- #include file=conexion.asp --> 
<html>
<head>
	<title>Vicente Candela Pérez</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

	<!--Import Google Icon Font
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
	<!-- Compiled and minified CSS 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">-->
	
	<script type="text/javascript">
			
			document.addEventListener('DOMContentLoaded', function() {
				var elems = document.querySelectorAll('select');
				var instances = M.FormSelect.init(elems);
			});
			
			// FUNCIONES JAVASCRIPT
			// Creamos el objeto AJAX httprequest

			function AJAXCrearObjeto(){
			
			   var obj;
			 
			   if (window.XMLHttpRequest) { // no es IE
				  obj = new XMLHttpRequest(); //alert('El navegador no es IE');
			  } 
			  else { // Es IE o no tiene el objeto
				 try {
				   obj = new ActiveXObject("Microsoft.XMLHTTP"); // alert('El navegador utilizado es IE');
				 }
				 catch (e) {
					// alert('El navegador utilizado no está soportado');
				  }
			  }
			  //alert('realizado');
			  return obj;
		    }
			
			// Recibe y muestra los vuelos que pertenecen a la compania seleccionada
		    function leerDatos(){
				 
				// Comprobamos que se han recibido los datos
				if (oXML.readyState == 4) {
					
					// Accedemos al XML recibido
					var xml = oXML.responseXML.documentElement;
					
					// Accedemos al componente html correspondiente a la tabla
					var tabla = document.getElementById('tabla_vuelos');
					
					// Vaciamos el DIV
					var definicion_tabla = new String("");

					// cadena con los datos para crear la tabla

					definicion_tabla ='<th>Id Vuelo</th><th>ID Ciudad Origen</th><th>ID Ciudad Destino</th><th>Fecha</th><th>Compa&ntilde;&iacute;a</th> <th> ID Avi&oacute;n</th><th>Duraci&oacute;n</th><th>Plazas Disponibles</th><tr>';

					 // Iteramos cada vuelo
					var v;
					var item;  
					  
					for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++){
					
						// Accedemos al objeto XML 
						item = xml.getElementsByTagName('vuelo')[i];

						// Recuperamos el identificador de vuelo
						v = item.getElementsByTagName('idvuelo')[0].firstChild.data;
								 
						// Añadimos el campo a la tabla	 
						definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';
						 
						// Recuperamos el id de la ciudad de origen
						v = item.getElementsByTagName('ciudad_origen')[0].firstChild.data;

						// Añadimos el campo a la tabla
						definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';

						// Recuperamos el id de la ciudad destino
						v = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;

						// Añadimos el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v +'</td>';

						// Recuperamos la fecha
						v = item.getElementsByTagName('fecha')[0].firstChild.data;

						// Añadimos el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

						// Recuperamos la compania
						v = item.getElementsByTagName('compania')[0].firstChild.data;

						// Añadimos el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
						
						// Recuperamos el id de avion
						v = item.getElementsByTagName('avion')[0].firstChild.data;
						
						// Añadimos el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
						
						// Recuperamos la duracion del vuelo
						v = item.getElementsByTagName('duracion')[0].firstChild.data;
						
						// Añadimos el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

						// Recuperamos el numero de planzas disponibles
						v = item.getElementsByTagName('n_plazas_disponibles')[0].firstChild.data;

						// añadimo el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v + '</td></tr>';
						
					}
				
					// rellenamos el objeto html tabla con la definicion construida
					tabla.innerHTML = definicion_tabla;
				 
				}
		    }
			
			
			function consulta(){
			
				var valorx=document.getElementById("IDVUELO").value;
				var valory=document.getElementById("IDCIUDADORIGEN").value;
				
				
				oXML = AJAXCrearObjeto();
				oXML.open('POST', 'ServVuelos.asp');
				oXML.onreadystatechange = leerDatos;

				oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

				// lanza la peticion enviando los parametros 
				oXML.send('IDVUELO='+valorx+'&IDCIUDADORIGEN='+valory);
		
				document.getElementById("IDVUELO").value = "";

			}
			
			function anyadir_modificar(){
			
				var idvuelo=document.getElementById("IDVUELO").value;
				var idciudadorigen=document.getElementById("IDCIUDADORIGEN").value;
				var idciudaddestino=document.getElementById("IDCIUDADDESTINO").value;
				var fecha=document.getElementById("FECHA").value;
				var idcompania=document.getElementById("IDCOMPANIA").value;
				var idavion=document.getElementById("IDAVION").value;
				var duracion=document.getElementById("DURACION").value;
				var plazas=document.getElementById("N_PLAZAS_DISPONIBLES").value;
			
				oXML = AJAXCrearObjeto();
				oXML.open('POST', 'ServVuelos.asp');
				oXML.onreadystatechange = leerDatos;

				oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

				// lanza la peticion enviando los parametros 
				oXML.send('idvuelo='+idvuelo+'&idciudadorigen='+idciudadorigen+'&idciudaddestino='+idciudaddestino+'&fecha='+fecha+'&idcompania='+idcompania+'&idavion='+idavion+'&duracion='+duracion+'&plazas='+plazas);
			
			
				/*document.getElementById("IDVUELO").value = "";
				document.getElementById("IDCIUDADORIGEN").value = "";
				document.getElementById("IDCIUDADDESTINO").value = "";
				document.getElementById("FECHA").value = "";
				document.getElementById("IDCOMPANIA").value = "";
				document.getElementById("IDAVION").value = "";
				document.getElementById("DURACION").value = "";
				document.getElementById("N_PLAZAS_DISPONIBLES").value = "";*/
			
			}
			
	
		</script>
	
</head>
<body> 
<div class="container">
	<h1> Sitio de Administradores </h1>

	
	<a class="waves-effect waves-light btn" onClick="consulta();" ><input type="button" value="Consultar"></a>
	<a class="waves-effect waves-light btn" onClick="anyadir_modificar();" ><input type="button" value="Anyadir"></a>
	<a class="waves-effect waves-light btn" onClick="anyadir_modificar();" ><input type="button" value="Modificar"></a>
	<br>
	<br>
	<input placeholder="IDVUELO:" name="IDVUELO" id="IDVUELO" type="text" class="validate"><br><br>
	<input placeholder="IDCIUDADORIGEN:" name="IDCIUDADORIGEN" id="IDCIUDADORIGEN" type="text" class="validate"><br><br>
	<input placeholder="IDCIUDADDESTINO:" name="IDCIUDADDESTINO" id="IDCIUDADDESTINO" type="text" class="validate"><br><br>
	<input placeholder="FECHA:" name="FECHA" id="FECHA" type="text" class="validate"><br><br>
	<input placeholder="IDCOMPANIA:" name="IDCOMPANIA" id="IDCOMPANIA" type="text" class="validate"><br><br>
	<input placeholder="IDAVION:" name="IDAVION" id="IDAVION" type="text" class="validate"><br><br>
	<input placeholder="DURACION:" name="DURACION" id="DURACION" type="text" class="validate"><br><br>
	<input placeholder="N_PLAZAS_DISPONIBLES:" name="N_PLAZAS_DISPONIBLES" id="N_PLAZAS_DISPONIBLES" type="text" class="validate"><br><br>
	<br>
	<table id="tabla_vuelos" name="tabla_vuelos" border=1>
		
	</table>
	<a href= "http://localhost:8080/prueba/modificaraviones.jsp"><p><center> Ir a JSP </center></p></a> 
</div>
</body>
</html>