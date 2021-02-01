<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%// @page import="classx.Crud" %>
<% // @ include file="Crud.java" %>
<%@page language="java" import="commons.AssocArrayList" %>
<%@page language="java" import="commons.QuerySaveResult" %>
<%@page language="java" import="commons.CrudXY" %>
<%
	try {
	     
		request.setCharacterEncoding ( "UTF-8" );
		response.setContentType ( "text/html; charset=UTF-8" );
		response.setCharacterEncoding ( "UTF-8" );		
		
	} catch ( Exception e ) { 
	
		e.printStackTrace();
	}
	
	String[] lent_galimybes = { "id", "pav" };
	String[] lauk_galimybiu = new String [ lent_galimybes.length ];		
	CrudXY crud_galimybes = new CrudXY ( "galimybes", lent_galimybes );

	try { 
	
		QuerySaveResult qrs = new QuerySaveResult();

		String add = request.getParameter ( "add" ); 		
	
		if ( ( ( add  ) != null ) && add.equals ( "saugoti" ) ) {
		
			String id_galimybes = request.getParameter ( "id_galimybes" );
			// out.println ( "id galimybes.: ." + id_galimybes + "." );			
		
			for ( int i = 1; i<lent_galimybes.length; i++ ) {
			
				lauk_galimybiu [ i ] = request.getParameter ( lent_galimybes [ i ] );
			}
			qrs = crud_galimybes.save ( id_galimybes, lauk_galimybiu );	
		 } 
		 
		String del;
	
		if ( ( ( del = request.getParameter ( "del" )  ) != null ) && del.equals ( "del1rec" ) ) {
		
			String id_galimybes = request.getParameter ( "g_del" );
			// out.println ( "id galimybes.: ." + id_galimybes + "." );		

			qrs = crud_galimybes.delete ( id_galimybes );
		}		 
		 
	}  catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>
<html>
	<head>	
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
		 
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<script>

			<%= crud_galimybes.jsRedagavimui ( "id_galimybes" ) %> 
			<%= crud_galimybes.jsValymui() %>
			<%= crud_galimybes.jsTrynimui ( "galimybe" ) %>

			$( document ).ready( function() {
			
				alert( 'hi' )
			});
		</script>
	</head>
<body>
<h2 align="center"><strong>Retrieve data from database in jsp</strong></h2>
<div id="time_place">
</div>
<form method="post" action="">
	<table>
		<tr>
			<th>Galimybė</th>
			<td>
				<input id="pav" type="text" name="pav" required>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<input type="button" name="clear" value="valyti" onClick = "iValyma()"> 
				<input type="submit" name="add" value="saugoti">
			</td>
		</tr>
	</table>
		<input type="hidden" id="id_galimybes" name="id_galimybes" value="0">
		<input type="hidden" id="alert" name="alert" value="0">
</form>
<form id="del_rec" method="post" action="">
	<input type="hidden" name="del" value="del1rec">
	<input type="hidden" id="m_del" name="g_del" value="0">
</form>
<table align="center">
<tr>
</tr>
<tr>
	<th>Veiksmai</th>
	<th>Id</th>
	<th>Galimybė</th>
</tr>
<%
	try {
	
		String sql = crud_galimybes.select( "" );
		 
		while( crud_galimybes.flag_got_rows ) {
		
			String rec_data = "";
			
			AssocArrayList lst_row_fields = crud_galimybes.giveSelectedRow();
		
			for ( int i = 1; i < lauk_galimybiu.length; i++ ) {

				rec_data += " data-"  + ( lent_galimybes [ i ] )   + "=\"" +  ( ( String ) lst_row_fields.giveMe (  lent_galimybes [ i ]  ) ) + "\"";

			}
			String id_rec =  ( String ) lst_row_fields.giveMe (   "id"  );
%>
<tr>
	<td><input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_gal="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )"></td>
	<td><input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_gal="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )"></td>

<%
		for ( int i = 1; i < lauk_galimybiu.length; i++ ) {
%>
	<td><%=  lst_row_fields.giveMe (  lent_galimybes [ i ]  ) %></td>
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