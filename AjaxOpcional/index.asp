
<!DOCTYPE HTML>

<!-- #include file=conexion.asp --> 
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

			<script type="text/javascript">
			
			document.addEventListener('DOMContentLoaded', function() {
				var elems = document.querySelectorAll('select');
				var instances = M.FormSelect.init(elems);
			});
			
			function AJAXCrearObjeto(){
			
			   var obj;
			 
			   if (window.XMLHttpRequest) { 
				  obj = new XMLHttpRequest(); 
			  } 
			  else { 
				 try {
				   obj = new ActiveXObject("Microsoft.XMLHTTP"); 
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

					definicion_tabla ='<th>Id Vuelo</th><th>ID Ciudad Origen</th><th>ID Ciudad Destino</th><th>Fecha</th><th>Compa&ntilde;&iacute;a</th> <th>Plazas Disponibles</th><th>Duraci&oacute;n</th><th>ID Avi&oacute;n</th><tr>';
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
						v = item.getElementsByTagName('n_plazas_disponibles')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
						v = item.getElementsByTagName('duracion')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
						v = item.getElementsByTagName('avion')[0].firstChild.data;
						definicion_tabla= definicion_tabla+'<td>' + v + '</td></tr>';
						
					}
					tabla.innerHTML = definicion_tabla;
				 
				}
		    }
			
			
			function ponerD()
            {
                if (oXML2.readyState == 4) 
                {tElement;
                    var Destino = document.getElementById('Destino');
                    var definicion = new String('<option value="0">Todos los origenes</option>');

                    var v;
                    var v2;
                    var item;
                    
                    for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++)
                    {
                        item = xml.getElementsByTagName('vuelo')[i];
                        v = item.getElementsByTagName('nom_ciudad_destino')[0].firstChild.data;
                        v2 = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;
                        definicion = definicion + '<option value='+v2+'>'+v+'</option>';                       
                    }
                    Destino.innerHTML = definicion;
                }
            }
			
			function mostrar_vuelos(){
		
				var valorx=document.getElementById("Destino").value;
				alert(valorx);
				
				var valory=document.getElementById("origen").value;
				alert(valory);
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
			
			
			}
	
		</script>
</head>

<body>
		<div class="container">
			<h1> Agencia de vuelos</h1>
				<div class="row">
					<div class="col s6"></div>
					<div class="col s6">
						<a href= "http://localhost/Agencia-de-Vuelos/AjaxOpcional/login.html"><p><center> Login </center></p></a> 
					</div>
				<div>
			
			</br>
			</br>
			<a class="waves-effect waves-light btn" href="http://localhost/Agencia-de-Vuelos/AjaxOpcional/Consultar_reservas.asp"><input type="button" value="Consultar reserva"></a> 
			</br>
			</br>
			<form method="POST" action="Consulta_de_vuelos.asp">
			
				<div class="input-field col s12">
				Origen: <select name="origen" id="origen">
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
				Destino: <select name="Destino" id="Destino">
							<option value="0"> Todos los destinos</option>
							<%
								' Ejecutamos el select e imprimimos todos los resultados en el while
								Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
								
								'Mientras hayan datos continua el while
								do while not destino.EOF
									Response.Write("<option value='" & destino("IDCIUDAD") & "'> " & destino("CIUDAD") & "</option>")
									destino.MoveNext
								loop
							%>
						</select>
				</div>
				<input class="waves-effect waves-light btn" type="submit" value="Buscar">
			</form>
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