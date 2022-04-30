<!-- #include file=conexion.asp -->
<%
      '  Script ASP programado con VBScript
      ' Realiza consulta en la base de datos y genera como resultato
      '  una lista de vuelos en formato XML
 
      'on Error Resume Next

	' Accedemos al compañía enviado desde la pagina principal

	'compania=request.form("compania")
	ciudad_origen = request.form("ciudad_origen")
	ciudad_destino = request.form("ciudad_destino")
	
	'ciudad_destino=5
	'ciudad_origen=1
	 
    ' El contenido a devolver es XML

	 response.ContentType="text/xml"
	 response.CacheControl="no-cache, must-revalidate"

    ' Consulta SQL de las ciudades que son origen de algun vuelo
	  
	If not ciudad_origen = 0 then
		Set datos = Conexion.Execute("select CIUDAD from CIUDAD where IDCIUDAD= " & ciudad_origen)
	end if
			
	If not ciudad_destino = 0 then 
		Set consulta = Conexion.Execute("select CIUDAD from CIUDAD where IDCIUDAD= " & ciudad_destino)
	end if
	  
	If ciudad_origen = 0 and ciudad_destino = 0 then
		Sentencia = " select * from LISTA_VUELOS_PRECIO"
		Set rs = Conexion.Execute(Sentencia)				
	
	ElseIf ciudad_origen = 0 then 
		Sentencia = " select * from LISTA_VUELOS_PRECIO where CIUDAD_DESTINO = '" & consulta("CIUDAD") & " ' "
		Set rs = Conexion.Execute(Sentencia)
				
	ELseIf ciudad_destino = 0 then 
		Sentencia = " select * from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN = '" & datos("CIUDAD") & " ' "
		Set rs = Conexion.Execute(Sentencia)
		
	Else
		Sentencia = " select * from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN = '" & datos("CIUDAD") & " '  AND CIUDAD_DESTINO='" & consulta("CIUDAD") & " '"
		Set rs = Conexion.Execute(Sentencia)
		
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
          response.write( rs("CIUDAD_ORIGEN") )
          response.write("</ciudad_origen>")

          response.write("<ciudad_destino>")
          response.write( rs("CIUDAD_DESTINO") )
          response.write("</ciudad_destino>")

          response.write("<fecha>")
          response.write( rs("FECHA") )
          response.write("</fecha>")

          response.write("<compania>")
          response.write( rs("COMPANIA") )
          response.write("</compania>")

          response.write("<n_plazas_disponibles>")
          response.write( rs("N_PLAZAS_DISPONIBLES") )
          response.write("</n_plazas_disponibles>")

          response.write("<duracion>")
          response.write( rs("DURACION") )
          response.write("</duracion>")

          response.write("<avion>")
          response.write( rs("IDAVION") )
          response.write("</avion>")

          response.write("</vuelo>")
             
			 
		   rs.MoveNext
           loop

           response.write("</XML>")
    
         end if  
%>    