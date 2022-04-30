<!DOCTYPE html>
<!-- #include file=seguridad.asp --> 
<!-- #include file=conexion.asp --> 
<html>
<head>
	<title>Fran Quiles</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	
	<script type="text/javascript">
			
			document.addEventListener('DOMContentLoaded', function() {
				var elems = document.querySelectorAll('select');
				var instances = M.FormSelect.init(elems);
			});
			

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
				  }
			  }
			  return obj;
		    }
			
		    function leerDatos(){
				 
				if (oXML.readyState == 4) {
					var xml = oXML.responseXML.documentElement;
					
					var tabla = document.getElementById('tabla_vuelos');
					
					var definicion_tabla = new String("");


					definicion_tabla ='<th>Id Vuelo</th><th>ID Ciudad Origen</th><th>ID Ciudad Destino</th><th>Fecha</th><th>Compa&ntilde;&iacute;a</th> <th> ID Avi&oacute;n</th><th>Duraci&oacute;n</th><th>Plazas Disponibles</th><tr>';

					var v;
					var item;  
					  
					for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++){
					
						item = xml.getElementsByTagName('vuelo')[i];

						v = item.getElementsByTagName('idvuelo')[0].firstChild.data;
								 
						definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';
						 
						v = item.getElementsByTagName('ciudad_origen')[0].firstChild.data;

						definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';

						v = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v +'</td>';
						v = item.getElementsByTagName('fecha')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
						v = item.getElementsByTagName('compania')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
						v = item.getElementsByTagName('avion')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
						v = item.getElementsByTagName('duracion')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
						v = item.getElementsByTagName('n_plazas_disponibles')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v + '</td></tr>';
						
					}
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
				oXML.send('idvuelo='+idvuelo+'&idciudadorigen='+idciudadorigen+'&idciudaddestino='+idciudaddestino+'&fecha='+fecha+'&idcompania='+idcompania+'&idavion='+idavion+'&duracion='+duracion+'&plazas='+plazas);
			
			}
			
	
		</script>
	
</head>
<body> 
<div class="container">
	<h1> Administradores </h1>

	
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