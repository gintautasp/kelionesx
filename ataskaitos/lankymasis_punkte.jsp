<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> Ataskaitos</title>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>

<style>
	
	th {

		background-color: none;
	}
</style>

</head>

<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<h2 align="center">Ataskaitos</h2>
<table width="400" cellspacing="5" cellpadding="5" border="1">
	<tr>
	</tr>
	<tr>
		<th>id</th>
		<th>id_punkto</th>
		<th>id_keliones</th>
		<th>data_laikas</th>
		<th>trukme</th>
		<th>aprasymas</th>
	</tr>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "uzduotis_keliones";
	String userId = "root";
	String password = "";
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String id_punkto_tipo = "0";
	
		try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");	
		
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		
		String sql = "";
		id_punkto_tipo = request.getParameter( "i" );
		
		statement=connection.createStatement();	
		
		sql =
			"SELECT * "
			+" FROM `lankymasis_punkte`"
			+" WHERE 1";
			
			
		
	resultSet = statement.executeQuery(sql);
		 
		while( resultSet.next() ){
%>
<tr style="background-color: none">
	<td><%= resultSet.getString ( "id" ) %></td>
	<td><%= resultSet.getString ( "id_punkto" ) %></td>
	<td><%= resultSet.getString ( "id_keliones" ) %></td>
	<td><%=resultSet.getString ( "data_laikas" ) %></td>
	<td><%=resultSet.getString ( "trukme" ) %></td>
	<td><%=resultSet.getString ( "aprasymas" ) %></td>
	
</tr>

<% 
		}
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>

</body>
</html>	