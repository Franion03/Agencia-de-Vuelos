<!--#include file="conexion.asp"-->

<%
    ' Script ASP programado con VBScript
    ' Realiza consulta en la base de datos y genera como resultato
    ' una lista de vuelos en formato XML

    'on Error Resume Next
    ' Accedemos al compañía enviado desde la pagina principal
    origen=request.form("ciudad_origen")
	'origen=1

    ' El contenido a devolver es XML
    response.ContentType="text/xml"
    response.CacheControl="no-cache, must-revalidate"

    ' Consulta SQL de las ciudades que son origen de algun vuelo
	If not origen = 0 then
		SQL = "Select IDCIUDADDESTINO FROM VUELO where IDCIUDADORIGEN="&origen
	Else
		SQL = "Select IDCIUDADDESTINO FROM VUELO"
	end if
	
    SQL = "Select IDCIUDADDESTINO FROM VUELO where IDCIUDADORIGEN="&origen

    Set rs = Conexion.Execute(SQL)

    ' Se genera una salida XML con la lista de vuelos
    if (not(rs.EOF)) then
        %><?xml version="1.0" encoding="UTF-8"?><%
        response.write("<XML>")
        ' Recorremos el Recorset

        do until rs.EOF
            response.write("<vuelo>")
                response.write("<nom_ciudad_destino>")
                    SQL2 = "SELECT CIUDAD FROM CIUDAD WHERE IDCIUDAD ="&rs("IDCIUDADDESTINO")
                    Set resultado = Conexion.Execute(SQL2)
                    response.write(resultado("CIUDAD"))
                response.write("</nom_ciudad_destino>")

                response.write("<ciudad_destino>")
                    response.write(rs("IDCIUDADDESTINO"))
                response.write("</ciudad_destino>")
            response.write("</vuelo>")
            rs.MoveNext
        loop
        response.write("</XML>")
    end if
%>