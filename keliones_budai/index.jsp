<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page language="java" import="commons.Crud" %>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "uzduotis_keliones";
	String userId = "root";
	String password = "";
	String[] lent_budai = {"id", "pav" };
	String[] lauk_budai = new String [ lent_budai.length ];		
	Crud budai = new Crud ( "keliones_budai", lent_budai );
	String errormsg= "";
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
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Po Lietuva!</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../font/css/all.min.css" rel="stylesheet" /> 
    <link rel="stylesheet" href="../css/templatemo-diagoona.css?v=1.0">
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
			.table {
		background-color: #bec5cf;
		opacity: 0.8;
		}
        .header {
		background-color: #858b94;
		opacity: 0.9;
	}
		</style>
<%		String id_budai = "0";
	try { 
	
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String add; 
		String sql_ins;
	
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "pakeisti" ) ) {
		
			for ( int i = 1; i<lent_budai.length; i++ ) {
			
				lauk_budai [ i ] = request.getParameter ( lent_budai [ i ] );
			}
			String comma = "";
			id_budai = request.getParameter( "id_budai" );
			if  (  id_budai == null ) {																					
				sql_ins = budai.insert(lauk_budai);
				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins);
				
			} else {
			
				lauk_budai[0] = id_budai;
				String sql_upd;
				String salyga = " `id`=" + id_budai;
				sql_upd = budai.update(lauk_budai, salyga);						
				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate( sql_upd );				
			 }
			
		 } 
		 else {
		 
			if ( add != null ) {
			}
		 }
		 if ( ( ( add = request.getParameter("papil")  ) != null) && add.equals("papildyti") ){
				for ( int i = 1; i<lent_budai.length; i++ ) {
				lauk_budai [ i ] = request.getParameter( lent_budai [ i ]);
				}
				
				String sql = "SELECT * FROM `keliones_budai` WHERE `keliones_budai`.`pav`='" + lauk_budai [1] + "'";
				statement_take = connection.createStatement();
				resultSet = statement_take.executeQuery(sql);
				
				if(resultSet.next()){
					String pav = resultSet.getString("pav");
					errormsg= "žodis "+ lauk_budai [1] + " kartojasi";

				}else{
					sql_ins = budai.insert(lauk_budai);	
					statement_change = connection.createStatement();
					resultSetChange = statement_change.executeUpdate(sql_ins);
				}
		 }
		 
		 String del;
		String where_salyga;
	
		if ( ( ( del = request.getParameter("del")  ) != null ) && del.equals ( "del1rec" ) ) {
			id_budai= request.getParameter("m_del");
			String sql_delete = budai.delete (id_budai);
			statement_change = connection.createStatement();
			resultSetChange = statement_change.executeUpdate(sql_delete);

		} 
		 else {
		 
			if ( add != null ) {
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
					for ( int i=1; i<lent_budai.length; i++ ) {
%>
						document.getElementById( '<%= lent_budai [ i ]  %>' ).value =  mygtukas.dataset.<%= lent_budai [ i ]  %>;
<%	
					}
%>
					document.getElementById ( "id_budai" ).value = id_rec;
				}
			}
			
			function iValyma () {
			
<%
				for ( int i=1; i<lent_budai.length; i++ ) {
%>																																								
					document.getElementById( '<%= lent_budai [ i ]  %>' ).value =  "";
<%	
				}
%>
			}
			function iTrinima ( id_rec ) {
			
				mygtukasEdit = document.getElementById ( 'toEdit_' + id_rec );
				pav =  mygtukasEdit.dataset.pav;
				var r = confirm( "Ar norite pašalinti keliones budai " + pav + "?" );
				
				if ( r == true ) {
					
					document.getElementById ( "m_del" ).value = id_rec;
					forma_del = document.getElementById ( "del_rec" );
					forma_del.submit();
				}
			}			
		</script>
	</head>
<body>
<div class="tm-container">        
        <div>
            <div class="tm-row pt-4" id="top-header">
                <div class="tm-col-left">
                    <div class="tm-site-header media">
                        <i class="fas fa-umbrella-beach fa-3x mt-1 tm-logo"></i>
                        <div class="media-body">
                            <h1 class="tm-sitename text-uppercase">Po Lietuva!</h1>
                            <p class="tm-slogon">Keliauk laisvai</p>
                        </div>        
                    </div>
                </div>
                <div class="tm-col-center">
                    <nav class="navbar navbar-expand-lg" id="tm-main-nav">
                        <button class="navbar-toggler toggler-example mr-0 ml-auto" type="button" 
                            data-toggle="collapse" data-target="#navbar-nav" 
                            aria-controls="navbar-nav" aria-expanded="false" aria-label="Toggle navigation">
                            <span><i class="fas fa-bars"></i></span>
                        </button>
                        <div class="collapse navbar-collapse tm-nav" id="navbar-nav">
                            <ul class="navbar-nav text-uppercase">
                                <li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../pradzia">Pradžia</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones_aprasymas">Aprašymas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones_marsrutai">Maršrutai</a>
                                </li>
								<li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones_punktu_tipai">Punktų tipai</a>
                                </li>  			
								<li class="nav-item active">
                                    <a class="nav-link tm-nav-link" href="../keliones_budai">Būdai <span class="sr-only">(current)</span></a>
                                </li>
								<li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones_punktai">Punktai</a>
                                </li>	
								<li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones">Kelionės</a>
                                </li>								
                                <li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones_priemones">Priemonės</a>
                                </li>
								<li>
                                </li>									
                            </ul>                            
                        </div>                        
                    </nav>
                </div>
            </div>	
            <div class="tm-row">
                <div class="tm-col-left"></div>
                <main class="tm-col-right tm-contact-main"> <!-- Content -->
                    <section class="tm-content tm-contact">
                        <h2 ><strong>Keliones budai</strong></h2>
						<th>
						</th>
<form method="post" action="">
	<table class="header">
		<tr>
			<th>Pavadinimas</th>
			<td>
				<input id="pav" type="text" name="pav" pattern="[A-Ža-ž]{3,}+" title="Įveskite tris ar daugiau raidžių" required>
			</td>
		</tr>
		<tr>
		<th></th>
		<td>
			<%= errormsg %>	
		</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<input type="button" name="clear" value="valyti" onClick = "iValyma()"> 
				<input type="submit" name="add" value="pakeisti">
				<input type="submit" name="papil" value="papildyti" onClick = "pap()">
			</td>
		</tr>
	</table>

		<input type="hidden" id="id_budai" name="id_budai" value="0">
		<input type="hidden" id="alert" name="alert" value="0">
</form>
<form id="del_rec" method="post" action="">
	<input type="hidden" name="del" value="del1rec">
	<input type="hidden" id="m_del" name="m_del" value="0">
</form>
<table class = "table" cellpadding="5" cellspacing="5" border="1">
<tr>
</tr>
<%
	try {
		statement_take = connection.createStatement();		
		String sql = budai.select ();
		resultSet = statement_take.executeQuery(sql);

		while( resultSet.next() ){
		
			String rec_data = "";
		
			for ( int i = 1; i < lauk_budai.length; i++ ) { 
				rec_data += " data-"  +lent_budai [ i ]  + "=\"" + resultSet.getString(lent_budai[i]) + "\"";
				
			}

			String id_rec = resultSet.getString (  "id"  );
%>
<tr>
	<td><input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-id_miesto="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )"></td>
	<td><input type="button" class="delete"  id="toDelete_<%= id_rec  %>" data-id_miesto="<%= id_rec %>" value="&#10007;" onClick="iTrinima( <%= id_rec %> )"></td>
<%
		for ( int i = 1; i < lauk_budai.length; i++ ) {		
%>
	<td><%= resultSet.getString (  lent_budai [ i ]  ) %></td>
<%
		}
%>

</tr>
<% 
		}
	}
	 catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>
</table>

				</div>
    </div>
    <div class="tm-row">
            <div class="tm-col-left text-center">            
                <ul class="tm-bg-controls-wrapper">
                    <li class="tm-bg-control active" data-id="0"></li>
                    <li class="tm-bg-control" data-id="1"></li>
                    <li class="tm-bg-control" data-id="2"></li>
                </ul>            
            </div>        
           
        </div>        

        <!-- Diagonal background design -->
        <div class="tm-bg">
            <div class="tm-bg-left"></div>
            <div class="tm-bg-right"></div>
        </div>
    </div>

    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>
</html>

