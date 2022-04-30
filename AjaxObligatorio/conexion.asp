<%
    'conecting to database
	Set Conexion = Server.CreateObject("ADODB.Connection")
	Conexion.ConnectionString = "Data Source=AGENCIA; USER=SYSDBA; PASSWORD=masterkey"
	Conexion.Mode = 1
	Conexion.Open
%>