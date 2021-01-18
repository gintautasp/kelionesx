<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%// @page import="classx.Crud" %>
<% // @ include file="Crud.java" %>
<%@page language="java" import="commons.AssocArrayList" %>
<%@page language="java" import="commons.DbMySql" %>
<%@page language="java" import="commons.Crudx" %>
<%

	String[] lent_vart = { "id", "pav", "passwd", "email" };
	String[] lauk_vart = new String [ lent_vart.length ];		
	Crudx crud_users = new Crudx ( "users", lent_vart );
	// Crud crud_marsrutu_miestu = new Crud ( "marsrutai_miestai", lent_marsrutu_miestu );
%>
<html>
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
<%		
	String id_vart = "0";

	try { 
		
		String add; 
	
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "papildyti" ) ) {
		
			for ( int i = 1; i<lent_vart.length; i++ ) {
			
				lauk_vart [ i ] = request.getParameter ( lent_vart [ i ] );
			}
			String comma = "";
			id_vart = request.getParameter ( "id_vart" );
			
			out.println ( "id vart.: ." + id_vart + "." );

			if  ( (  id_vart == null ) || ( id_vart.equals ( "0" ) ) ) {																																	// Miestai miestas = new Miestai ( lent_miestu );
			
				String sql_ins = "";
																																								// miestas.takeFromParams ( request )
				sql_ins = crud_users.insert ( lauk_vart );

				out.println ( sql_ins );
				
			} else {
			
				lauk_vart [ 0 ] = id_vart;
				String sql_upd;
				String salyga = " `id`=" + id_vart;
				sql_upd = crud_users.update ( lauk_vart, salyga );
								
				out.println ( sql_upd );				
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
					for ( int i=1; i<lent_vart.length; i++ ) {
%>
						document.getElementById( '<%= lent_vart [ i ]  %>' ).value =  mygtukas.dataset.<%= lent_vart [ i ]  %>;
<%	
					}
%>
					document.getElementById ( "id_vart" ).value = id_rec;
				}
			}
			
			function iValyma () {
			
<%
				for ( int i=1; i<lent_vart.length; i++ ) {
%>																																								
					document.getElementById( '<%= lent_vart [ i ]  %>' ).value =  "";
<%	
				}
%>
			}
			
			function iTrinima ( id_rec ) {
			
				mygtukasEdit = document.getElementById ( 'toEdit_' + id_rec );

				pav =  mygtukasEdit.dataset.pav;
				
				var r = confirm( "Ar norite pašalinti vartotoją " + pav + "?" );
				
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
		String sql_delete;
		String where_salyga;
	
		if ( ( ( del = request.getParameter("del")  ) != null ) && del.equals ( "del1rec" ) ) {
%>
			// alert( "opa" );
<%
			sql_delete = crud_users.delete ( id_vart );
			
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
			<th>Vartotojas</th>
			<td>
				<input id="pav" type="text" name="pav" required>
			</td>
		</tr>
		<tr>
			<th>Slaptažodis</th>
			<td>
				<input id="passwd" name="passwd" value="">
			</td>
		</tr>
		<tr>
			<th>El.paštas</th>
			<td>
				<input id="email"  name="email" value="">
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
		<input type="hidden" id="id_vart" name="id_vart" value="0">
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
	<th>Vartotojas</th>
	<th>Slaptažodis</th>
	<th>El. paštas</th>
</tr>
<%
	try {
	
		String sql = crud_users.select( "" );
		 
		while( crud_users.flag_got_rows ) {
		
			String rec_data = "";
			
			AssocArrayList lst_row_fields = crud_users.giveSelectedRow();
		
			for ( int i = 1; i < lauk_vart.length; i++ ) {

				rec_data += " data-"  + ( ( String ) lst_row_fields.giveMe ( lent_vart [ i ] ) )   + "=\"" +  ( ( String ) lst_row_fields.giveMe (  lent_vart [ i ]  ) ) + "\"";

			}
			String id_rec =  ( String ) lst_row_fields.giveMe (   "id"  );
%>
<tr>
	<td><input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_miesto="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )"></td>
	<td><input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_miesto="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )"></td>

<%
		for ( int i = 1; i < lauk_vart.length; i++ ) {
%>
	<td><%=  lst_row_fields.giveMe (  lent_vart [ i ]  ) %></td>
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