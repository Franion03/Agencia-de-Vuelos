<!-- #include file=conexion.asp -->
<%
      '  Script ASP programado con VBScript
      ' Realiza consulta en la base de datos y genera como resultato
      '  una lista de vuelos en formato XML
 
      'on Error Resume Next

	' Accedemos al compañía enviado desde la pagina principal

	'compania=request.form("compania")
	'ciudad_origen = request.form("ciudad_origen")
	idvuelo = request.form("IDVUELO")
	'idvuelo=0
	
	'Si es una consulta el resto de campos estaran vacios
	'Si es una modificacion tendra idvuelo y algunos campos rellenos
	'Si es anyadir tendra todos los campos rellenos, menos idvuelo
	idciudadorigen = request.form("idciudadorigen")
	idciudaddestino = request.form("idciudaddestino")
	fecha = request.form("fecha")
	idcompania = request.form("idcompania")
	idavion = request.form("idavion")
	duracion = request.form("duracion")
	plazas = request.form("plazas")
	
	If idvuelo = "" then
		idvuelo = 0
	end if


	'fecha2 = month(fecha) & <</>> & day(fecha) & <</>> &year(fecha)
	'fecha2 = month(fecha) & «/» & day(fecha) & «/» & year(fecha)
	
	
	'ciudad_destino=5
	'ciudad_origen=1
	 
    ' El contenido a devolver es XML

	 response.ContentType="text/xml"
	 response.CacheControl="no-cache, must-revalidate"

    ' Consulta SQL de las ciudades que son origen de algun vuelo
	  
	If not idvuelo = 0 then
		
		If idciudadorigen = "" then
	
			Set rs = Conexion.Execute("select * from VUELO where IDVUELO= " & idvuelo)
		
		Else
			
				SentenciaSQL = "Update VUELO set IDCIUDADORIGEN = " & idciudadorigen & " where IDVUELO=" & idvuelo
		
				Set update1 = Conexion.Execute(SentenciaSQL)
			
				SentenciaSQL = "Update VUELO set IDCIUDADDESTINO = " & idciudaddestino & " where IDVUELO=" & idvuelo
		
				Set update2 = Conexion.Execute(SentenciaSQL)
			
				SentenciaSQL = "Update VUELO set FECHA = '" & fecha & "' where IDVUELO=" & idvuelo
		
				Set update3 = Conexion.Execute(SentenciaSQL)

			
				SentenciaSQL = "Update VUELO set IDCOMPANIA = " & idcompania & " where IDVUELO=" & idvuelo
		
				Set update4 = Conexion.Execute(SentenciaSQL)
			
				SentenciaSQL = "Update VUELO set IDAVION = " & idavion & " where IDVUELO=" & idvuelo
		
				Set update5 = Conexion.Execute(SentenciaSQL)
			
				SentenciaSQL = "Update VUELO set DURACION = " & duracion & " where IDVUELO=" & idvuelo
		
				Set update6 = Conexion.Execute(SentenciaSQL)
			
				SentenciaSQL = "Update VUELO set N_PLAZAS_DISPONIBLES = " & plazas & " where IDVUELO=" & idvuelo
		
				Set update7 = Conexion.Execute(SentenciaSQL)
			
		
			Set rs = Conexion.Execute("select * from VUELO")
			
		end if
		
	Else

		Set consulta = Conexion.Execute("select max(IDVUELO) as ultimo_id from VUELO")
		idvuelo = consulta("ultimo_id")+1
	
		SentenciaSQL = "insert into VUELO values (" & idvuelo & "," & idciudadorigen & "," & idciudaddestino & ",'" & fecha & "'," & idcompania & "," & idavion & ", " & duracion & ", " & plazas & ")"
		
		Set datos = Conexion.Execute(SentenciaSQL)
		Set rs = Conexion.Execute("select * from VUELO")
	
	end if

       ' Se genera una salida XML con la lista de vuelos
	  
        if (not(rs.Eof)) then

		%><?xml version="1.0" encoding="UTF-8"?> <%
		response.write("<XML>")
  	     
           ' Recorremos el Recorset
           do until rs.Eof

	      response.write("<vuelo>")
          response.write("<idvuelo>")
          response.write( rs("IDVUELO") )
          response.write("</idvuelo>")

          response.write("<ciudad_origen>")
          response.write( rs("IDCIUDADORIGEN") )
          response.write("</ciudad_origen>")

          response.write("<ciudad_destino>")
          response.write( rs("IDCIUDADDESTINO") )
          response.write("</ciudad_destino>")

          response.write("<fecha>")
          response.write( rs("FECHA") )
          response.write("</fecha>")

          response.write("<compania>")
          response.write( rs("IDCOMPANIA") )
          response.write("</compania>")
		  
		  response.write("<avion>")
          response.write( rs("IDAVION") )
          response.write("</avion>")
		  
		  response.write("<duracion>")
          response.write( rs("DURACION") )
          response.write("</duracion>")

          response.write("<n_plazas_disponibles>")
          response.write( rs("N_PLAZAS_DISPONIBLES") )
          response.write("</n_plazas_disponibles>")
         
          response.write("</vuelo>")
             
			 
		   rs.MoveNext
           loop

           response.write("</XML>")
    
         end if  
%>    