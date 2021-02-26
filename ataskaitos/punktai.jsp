<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> Ataskaita</title>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<style>
	
	th, table {

            font-size: 25px;
            padding: 10px;
            border-width: 3px;
            text-align: center;
            background-color: #A8BFD8;
	        }
</style>

</head>

<body>

<h1 align="center">Ataskaita</h1>
<table width="400" cellspacing="5" cellpadding="5" border="1">
	
	<tr>
		<th>Punktai</th>
		<th>Ilguma</th>
        <th>Platuma</th>
        <th>Aprašymas</th>
        <th>Skaičius<br>apsilankymų</th>
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
		
        try {
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");	

            } catch(Exception e) {}

        try {
		
        String jdbcutf8 = "";
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
				
		
		statement=connection.createStatement();	
	    String sql =  
                "SELECT `punktai`.`id`, `punktai`.`pav`, `ilguma`, `platuma`, `punktai`.`aprasymas`,"
                +"COUNT(`lankymasis_punkte`.`id`) AS `skaicius_apsilankymu`"
                +"FROM `punktai`" 
                +"LEFT JOIN `lankymasis_punkte` ON (`lankymasis_punkte`.`id_punkto`=`punktai`.`id` )" 
                +"WHERE 1 " 
                +"GROUP BY `punktai`.`id`";
         

		
		    resultSet = statement.executeQuery(sql);
		 
		while( resultSet.next() ){
%>
    <tr>
	<td><%= resultSet.getString  ("pav") %></td>
	<td><%= resultSet.getString  ("ilguma") %></td>
    <td><%= resultSet.getString  ("platuma") %></td>
    <td><%= resultSet.getString  ("aprasymas") %></td>
    <td><a href="apsilankymai_punkte.jsp?i=<%=resultSet.getInt("id")%>" target="_blank"><%= resultSet.getString  ("skaicius_apsilankymu") %></a></td>
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