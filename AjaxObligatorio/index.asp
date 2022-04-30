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
	<script>
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

					definicion_tabla ='<th>Id Vuelo</th><th>ID Ciudad Origen</th><th>ID Ciudad Destino</th><th>Fecha</th><th>Compa&ntilde;&iacute;a</th> <th>Plazas Disponibles</th><th>Duraci&oacute;n</th><th>ID Avi&oacute;n</th><tr>';

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

						// Recuperamos el numero de planzas disponibles
						v = item.getElementsByTagName('n_plazas_disponibles')[0].firstChild.data;

						// Añadimos el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

						// Recuperamos la duracion del vuelo
						v = item.getElementsByTagName('duracion')[0].firstChild.data;

						// Añadimos el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

						// Recuperamos el id de avion
						v = item.getElementsByTagName('avion')[0].firstChild.data;

						// añadimo el campo a la tabla
						definicion_tabla= definicion_tabla+'<td>' + v + '</td></tr>';
						
					}
				
					// rellenamos el objeto html tabla con la definicion construida
					tabla.innerHTML = definicion_tabla;
				 
				}
		    }
			
			
			function ponerD()
            {
                // Comprobamos que se han recibido los datos
                if (oXML2.readyState == 4) 
                {
                    // Accedemos al XML recibido
                    
                    var xml = oXML2.responseXML.documentElement;

                    // Accedemos al componente html correspondiente a la tabla
                    var Destino = document.getElementById('Destino');

                    // Vaciamos el DIV
                    var definicion = new String('<option value="0">Todos los origenes</option>');

                    var v;
                    var v2;
                    var item;
                    
                    // Iteramos cada vuelo
                    for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++)
                    {
                        // Accedemos al objeto XML
                        item = xml.getElementsByTagName('vuelo')[i];

                        // Recuperamos el identificador de vuelo
                        v = item.getElementsByTagName('nom_ciudad_destino')[0].firstChild.data;
                        v2 = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;
                        definicion = definicion + '<option value='+v2+'>'+v+'</option>';                       
                    }
                    
                    // rellenamos el objeto html tabla con la definicion construida
                    Destino.innerHTML = definicion;
                }
            }
			
			function mostrar_vuelos(){
		
				// recupera el objeto html desplegable de companias
				var valorx=document.getElementById("Destino").value;
				alert(valorx);
				
				var valory=document.getElementById("origen").value;
				alert(valory);

				// crea el objeto httprequest 
				oXML = AJAXCrearObjeto();
				oXML.open('POST', 'consulta.asp');
				oXML.onreadystatechange = leerDatos;

				oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

				// lanza la peticion enviando los parametros 
				oXML.send('ciudad_destino='+valorx+'&ciudad_origen='+valory);
			}
			
			function actualizar(){
			
				//recuperamos el objeto html desplegable de ciudad origen
				valorx=document.getElementById("origen").value;
				alert(valorx)
				
				//crea el objeto hhtprequest
				oXML2 = AJAXCrearObjeto();
				oXML2.open('POST', 'consulta2.asp');
				oXML2.onreadystatechange = ponerD;
                oXML2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                // lanza la peticion enviando los parametros
                oXML2.send('ciudad_origen='+valorx);
                console.log(valorx);
			
			
			}
	
		</script>
</head>

<body>
		<div class="container">
			<h1> Agencia de vuelos</h1>
				<div class="row">
					<div class="col s6"></div>
					<div class="col s6">
						<a href= "http://localhost/Agencia-de-Vuelos/AjaxObligatorio/login.html"><p><center> Login </center></p></a> 
					</div>
				<div>
			
			</br>
			</br>
			<a class="waves-effect waves-light btn" href="http://localhost/Agencia-de-Vuelos/AjaxObligatorio/Consultar_reservas.asp"><input type="button" value="Consultar reserva"></a> 
			</br>
			</br>
						<div class="input-field col s12">
			Origen: <select name="origen" id="origen" onChange="return actualizar()">
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
			Destino: <select name="Destino" id="Destino" onChange="return mostrar_vuelos()">
						<option value="0"> Todos los destinos</option>
						<!-- el resto de opciones las dibujamos con AJAX -->
						
					</select>
			</div>
				
		</div>
		<br>
		<br>
		<br>
		<table id="tabla_vuelos" name="tabla_vuelos" border=1>
		
		</table>
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