<!DOCTYPE html>
<html>
<body>
<%
	usuario = request.form("Name")
    password = request.form("Password")

    If usuario = "admin" and password = 1234 then
        session("usuario") = usuario
        session("password") = password
        session("autentificacion") = 1
        response.redirect("http://localhost/Agencia-de-Vuelos/AjaxOpcional/GestionVuelos.asp")
	else
		response.redirect("https://google.com")
    end if
%>
</body>
</html>