<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" import="commons.Crud" %>
<%

	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "keliones";
	String userId = "root";
	String password = "";

	String[] lent_priemoniu = { "id", "pav", "kaina", "nuoroda", "vaizdas" };
	String[] lauk_priemones = new String [ lent_priemoniu.length ];		
	Crud lent_priemones = new Crud ( "priemones", lent_priemoniu );
	// Crud crud_marsrutu_miestu = new Crud ( "marsrutai_miestai", lent_marsrutu_miestu );
%>
<html>
<%

	Connection connection = null;
	Statement statement_take = null;
	Statement statement_change = null;
	ResultSet resultSet = null;
	int resultSetChange;

%>
	<head>
<%	
	String salis = "Lietuva";
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}
%>	
		<meta charset="utf-8">
		<style>
			table {
				border-collapse: collapse;
			}
			form {
				float: right;
			}
			input {
				width: 111px;
			}
			th, td {
				padding: 3px 4px;
				border: 1px solid black;
			}
			th {
				background-color: #A52A2A;
			}
			td {
				background-color: #DEB887;			
			}
		</style>
<%		String id_priemones = "0";
	try { 
	
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String add; 
		String sql_ins;

	
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "papildyti" ) ) {
		
			for ( int i = 1; i<lent_priemoniu.length; i++ ) {
			
				lauk_priemones [ i ] = request.getParameter ( lent_priemoniu [ i ] );
			}
			String comma = "";
			id_priemones = request.getParameter( "id_priemones" );

			if  (  id_priemones == null ) {																																	// Miestai miestas = new Miestai ( lent_miestu );
													// miestas.takeFromParams ( request )
				sql_ins = lent_priemones.insert(lauk_priemones);

				out.println ( sql_ins );

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins);
				
			} else {
			
				lauk_priemones[0] = id_priemones;
				String sql_upd;
				String salyga = " `id`=" + id_priemones;
				sql_upd = lent_priemones.update(lauk_priemones, salyga);
								
				out.println ( sql_upd );

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate( sql_upd );				
			}
			
		 } else {
		 
			if ( add != null ) {

				out.println ( add );
			}
		 }
		 
	}  catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>		 
		<script>
			function iRedagavima ( id_rec ) {
			
				if ( mygtukas = document.getElementById ( 'toEdit_' + id_rec ) ) {
<%
					for ( int i=1; i<lent_priemoniu.length; i++ ) {
%>
						document.getElementById( '<%= lent_priemoniu [ i ]  %>' ).value =  mygtukas.dataset.<%= lent_priemoniu [ i ]  %>;
<%	
					}
%>
					document.getElementById ( "id_priemones" ).value = id_rec;
				}
			}
			
			function iValyma () {
			
<%
				for ( int i=1; i<lent_priemoniu.length; i++ ) {
%>																																								
					document.getElementById( '<%= lent_priemoniu [ i ]  %>' ).value =  "";
<%	
				}
%>
			}
			
			function iTrinima ( id_rec ) {
			
				mygtukasEdit = document.getElementById ( 'toEdit_' + id_rec );

				pav =  mygtukasEdit.dataset.pav;
				
				var r = confirm( "Ar norite pašalinti miestą " + pav + "?" );
				
				alert( r );
				alert ( r == true );
				
				if ( r == true ) {

					alert( id_rec + "1" );
					document.getElementById ( "m_del" ).value = id_rec;
					alert( id_rec  + "2" );
					forma_del = document.getElementById ( "del_rec" );
					alert( forma_del );
					forma_del.submit();
				}
			}
				alert ( "ops " );			
<%		
	try {
		String del;
		String where_salyga;
	
		if ( ( ( del = request.getParameter("del")  ) != null ) && del.equals ( "del1rec" ) ) {
%>
			// alert( "opa" );
<%
			String sql_delete = lent_priemones.delete (id_priemones);
			statement_change = connection.createStatement();
			resultSetChange = statement_change.executeUpdate(sql_delete);
		
			
		} /* else {
		 
			if ( del != null ) {

				out.println ( del );
			}
		 } */
		 
	}  catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>					
		</script>
	</head>
<body>
<h2 align="center"><strong>Retrieve data from database in jsp</strong></h2>
<form method="post" action="">
	<table>
		<tr>
			<th>Pavadinimas</th>
			<td>
				<input id="pav" type="text" name="pav" required>
			</td>
		</tr>
		<tr>
			<th>Kaina</th>
			<td>
				<input id="kaina" name="kaina" value="1">
			</td>
		</tr>
		<tr>
			<th>Nuoroda</th>
			<td>
				<input id="nuoroda"  name="nuoroda" value="">
			</td>
		</tr>
		<tr>
			<th>Vaizdas</th>
			<td>
				<input id="vaizdas" name="vaizdas" value="default.png">
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<input type="button" name="clear" value="valyti" onClick = "iValyma()"> 
				<input type="submit" name="add" value="papildyti">
			</td>
		</tr>
	</table>
		<input type="hidden" id="id_priemones" name="id_priemones" value="0">
		<input type="hidden" id="alert" name="alert" value="0">
</form>
<form id="del_rec" method="post" action="">
	<input type="hidden" name="del" value="del1rec">
	<input type="hidden" id="m_del" name="m_del" value="0">
</form>
<table align="center">
<tr>
</tr>
<tr>
	<th>Funkcijos</th>
	<th>id</th>
	<th>Pavadinimas</th>
	<th>Kaina</th>
	<th>Nuoroda</th>
	<th>Vaizdas</th>
</tr>
<%
	try {
		//id_miesto = request.getParameter( "m_del" );
		statement_take = connection.createStatement();		
		String sql = lent_priemones.select ();
		out.println(sql);
		//String sql ="SELECT * FROM `priemones`  WHERE 1";
		resultSet = statement_take.executeQuery(sql);


		 
		while( resultSet.next() ){
		
			String rec_data = "";
		
			for ( int i = 1; i < lauk_priemones.length; i++ ) {

				rec_data += " data-"  +lent_priemoniu [ i ]  + "=\"" + resultSet.getString (  lent_priemoniu [ i ]  ) + "\"";

			}
			String id_rec = resultSet.getString (  "id"  );
%>
<tr>
	<td><input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_miesto="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )"></td>
	<td><input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_miesto="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )"></td>

<%
		for ( int i = 1; i < lauk_priemones.length; i++ ) {
%>
	<td><%= resultSet.getString (  lent_priemoniu [ i ]  ) %></td>
<%
		}
%>

</tr>
<% 
		}

	} catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>
</table>
</body>