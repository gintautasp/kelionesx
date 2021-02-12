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
		<th>Punktų tipai</th>
		<th>Įvesta punktų</th>
		<th>Aplankyta punktų</th>
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
		try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");	
		
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		
		String sql = "";
		
		statement=connection.createStatement();	
		
		sql =
			"SELECT `punktu_tipai`.`pav` ,"
			+"COUNT(`punktai`.`id`) AS `punktu_skaicius`"
			+"FROM `punktu_tipai`" 
			+"LEFT JOIN `punktai` ON ( `punktai`.`id`= `punktu_tipai`.`id` )"
			+"GROUP BY `punktu_tipai`.`id` ";
		
		resultSet = statement.executeQuery(sql);
		 
		while( resultSet.next() ){
%>
<tr style="background-color: none">
	<td><%= resultSet.getString ( "pav" ) %></td>
	<td><%// resultSet.getString  ("punktu_kiekis" ) %></td>
	<td><%=resultSet.getString ( "punktu_skaicius" ) %></td>
</tr>

<% 
		}
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>



	


<ul>
	<li><a href="punktu_tipai.jsp">punktu tipų sarašas ir kiek punktų kievieno tipo yra įvesta ir kiek kiekvieno punkto tipo punktų aplankyta</a></li>
	<li><a href="kelionės_budai.jsp">kelionės būdų sarašas ir keliuose maršrutuose yra pasirintas kiekvienas kelionės būdas </a></li>
	<li><a href="punktai.jsp">į kiek maršrutų įtrauktas punktas ir keliose kelionėse jis aplankytas </a></li>
	<li><a href="marsrutai.jsp">į kiek kelionių įtrauktas kiekvienas maršrutas</a></li>
</body>
</html>