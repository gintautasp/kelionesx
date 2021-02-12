<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> Ataskaitos</title>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
</head>
<body>
<h2 align="center">Ataskaitos</h2>
<ul>
	<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "uzduotis_keliones";
	String userId = "root";
	String password = "";

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	int resultSetChange;
%>
<form method="post" action="">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
<th>marsruto pav</th>
<th>keliones budai</th>
</tr>
<%
try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try{ 
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );

        String id = request.getParameter ("i");
        String where = "WHERE 1";		
		
		if ( id != null ) {
																												
			where += " AND `keliones_marsruto_atkarpos`.`id_keliones_budo` = '"+ id +"'";

		statement=connection.createStatement();		
		String sql = "SELECT *, COUNT(`keliones_budai`.`pav`) AS `keliones_budai_pav`, `keliones_marsruto_atkarpos`.`aprasymas` AS `keliones_marsruto_atkarpos_pav`" + " FROM `keliones_budai`" 
					+ " LEFT JOIN `keliones_marsruto_atkarpos`"
					+ " ON `keliones_budai`.`id` = `keliones_marsruto_atkarpos`.`id_keliones_budo`"
					+ where
					+ " GROUP BY `keliones_marsruto_atkarpos_pav`";
		resultSet = statement.executeQuery(sql);
        }

		while( resultSet.next() ){
%>
<tr>
	<td><%= resultSet.getString ( "keliones_marsruto_atkarpos_pav" )%></td>
	<td><%= resultSet.getString ( "keliones_budai_pav" )%></td>
</tr>
<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</body>
</html>