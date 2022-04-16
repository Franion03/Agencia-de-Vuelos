<!DOCTYPE html>
<html>
<body>
<%
	usuario = request.form("usuario")
    password = request.form("password")

    If usuario = "admin" and password = 1234 then
        session("usuario") = usuario
        session("password") = password
        session("autentificacion") = 1
        response.redirect("http://localhost/Agencia-de-Vuelos/Proyecto/Listado_de_vuelos.asp")
	else
        
		response.redirect("https://github.com")
    end if
%>
</body>
</html>