<!DOCTYPE html>
<html>
<body> 
<%
	autentificacion = session("autentificacion")
	If autentificacion <> 1 then
		response.redirect("https://google.es/")
	end if	 
%>
</body>
</html>