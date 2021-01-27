<!DOCTYPE html>
<html lang="en">
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>   
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%    //@page language="java" import="commons.Crud" %>  
<%

	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "uzduotis_keliones";
	String userId = "root";
	String password = "";
	
	String[] lent_punktu_tipai = {  "pav" };
	String[] lauk_punktu_tipu = new String [ lent_punktu_tipai.length ];   
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
	
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}
%>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Po Lietuva!</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../font/css/all.min.css" rel="stylesheet" /> 
    <link rel="stylesheet" href="../css/templatemo-diagoona.css?v=1.0">
    
    <style>
		table {
			background-color: #bec5cf;
			opacity: 0.8;
			
		}
		
		header {
			background-color: #858b94;
			opacity: 0.9;
		}
		 input {

			color:black;
			background: linear-gradient( #bec5cf 0%,  #858b94 100%);

		}
		th {

			background-color: none;
		}
		h1 {
			font-family: "Arial Black";
			padding: 5px; 
			color: #bec5cf ;
			font-size: 20px;
		}
			
		input [type='submit'], button, [aria-label]{
			cursor: pointer;
		}
		
		#edit-box{
			
			max-width: 80%;
			margin: auto;
			margin-top:10px;
		}
		
	</style>
	
<script>
		function iRedagavima ( id_rec ) {
		
			if (mygtukas = document.getElementById ('toEdit_' + id_rec) ) {
<%				
				for ( int i=0; i<lent_punktu_tipai.length; i++) {
%>
					document.getElementById('<%=lent_punktu_tipai [ i ] %>').value= mygtukas.dataset.<%=lent_punktu_tipai [ i ] %>;
<%
				}
%>
				
				document.getElementById( "id_punkto_tipo" ).value = id_rec
			}
		}
	/*	
			function iValyma () {
<%
				
				for ( int i=1; i<lent_punktu_tipai.length; i++) {
%>
				
				document.getElementById('<%=lent_punktu_tipai [ i ] %>').value= "";
<%				
				}
%>
				
			}
			
			function iTrinima ( id_rec ) {
			
				mygtukasEdit = document.getElementById ( 'toEdit_' + id_rec );
				
				pav = mygtukasEdit.dataset.pav;
				
				var r = confirm( "Ar norite pa�alinti punto tipa" + pav + "?" );
				
				alert( r );
				alert ( r == true );
				
				if ( r == true ) {
					
					alert(id_rec + "1" );
					document.getElementById ( "m_del" ).value = id_rec;
					alert( id_rec + "2" );
					forma_del = document.getElementById ( "del_rec" );
					alert( forma_del );
					forma_del.submit();
				}
				
			}
				alert ( "ops" ); */
<%
	try {
		String del;
		String where_salyga;
		
		if ( ( (  del = request.getParameter("del" ) ) != null) && del.equals ( "delirec" ) ) {		
%>

<%   /*
			
			String sql_delete = lent_punktu_tipai.delete ( id_punkto_tipo );
			statement_change = connection.createStatement();
			resultSetChange = statement_change.executeUpdate(sql_delete);
		*/}
		
	} catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>
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
                            <p class="center">Keliauk laisvai</p>
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
								<li class="nav-item active">
                                    <a class="nav-link tm-nav-link" href="../keliones_punktu_tipai">Punktų tipai <span class="sr-only">(current)</span></a>
                                </li>  			
								<li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones_budai">Būdai</a>
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

		<div class="pt-centrinis">
			<div class="title">
				
				<h1>Punktu tipai</h1>
				<p>Pavadinimas</p>
			</div>
				
			<div class="form">
				<form action="" method="POST">
				<input type="text" id="pav" name="pav" placeholder="Punktu_tipai">
				<input type="submit" name="add" value="Papildyti" class="btn btn-primary">
				<input type="hidden" id="id_punkto_tipo" name="id_punkto_tipo" value="0">
		
			</form>
			<form id="del_rec" method="post" action="">
				<input type="hidden" name="del" value="del1rec">
				<input type="hidden" id="m_del" name="m_del" value="0">
			</form>
				<p>Punktu tipai</p>
				<p id="counter"></p>
				<table class="pt-centrinis">
					<tr class="punktu_tipai">
					<th><h6>Punktu tipai</h6></th>
					</tr>
					
					<tbody id="tasks">
		

<%		String id_punkto_tipo = "0";
	try { 
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String add; 
		String sql_ins = "";
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "Papildyti" ) ) {
		
			for ( int i = 0; i<lent_punktu_tipai.length; i++ ) {																																		// Miestai miestas = new Miestai ( lent_miestu );
																																					// miestas.takeFromParams ( request );for ( int i = 0; i<lent_punktu_tipai.length; i++ ) {
				lauk_punktu_tipu [ i ] = request.getParameter ( lent_punktu_tipai [ i ] );
			}
			
			String comma = "";
			id_punkto_tipo = request.getParameter( "id_punkto_tipo" );
		
			
			if ( ( id_punkto_tipo ==null) || ( id_punkto_tipo.equals("0" ) ) ) {
			
				for ( int i = 0; i < lent_punktu_tipai.length; i++ ) {
			
					sql_ins =  sql_ins + comma  + "'" + lauk_punktu_tipu [ i ] + "'";
					comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
				}
			
			
				sql_ins = "INSERT INTO `punktu_tipai`"  
				+ " ( `pav` )"
				+ " VALUES ( "			
				+ sql_ins
				+ " )";
				
				
				out.println ( sql_ins );
			
				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins);	
				
			
			
			} else {
		 
				//turi buti vykdomas atnaujinimas, paredagavus. Upadte my sql (php my admin )
				// UPDATE `punktu_tipai` SET `pav` = 'Ti�keviciaus dvaras' WHERE `punktu_tipai`.`id` = 3;  ( 290 291  288 pvz )
			}
			
			
		
			
			
			} else {
		 
				if ( add != null ) {

					out.println ( add );
				}	
			}

	
			
		
		statement_take = connection.createStatement();		
		String sql ="SELECT * FROM `punktu_tipai` WHERE 1";
		
		
		resultSet = statement_take.executeQuery(sql);
		
		while( resultSet.next() ){
		
			String rec_data = "";

			
			for ( int i = 0; i<lauk_punktu_tipu.length; i++ ) {

			
				rec_data += "data-" + lent_punktu_tipai [ i ] + "=\"" + resultSet.getString	 ( lent_punktu_tipai [ i ] ) + "\"";
			}
					String id_rec = resultSet.getString ( "id" );
					
				
%>
					
	<tr>
	<td><input type="button" class="record_edit" id="toEdit_<%=id_rec %>"data-id_punkto_tipo="<%=id_rec %>"<%=rec_data %> value="&#9998;" onClick="iRedagavima( <%=id_rec %> )"></td>   
	<td><input type="button" class="delete" id="toDelete_<%=id_rec %>"data-id_punkto_tipo="<%=id_rec %>" value="&#10006;" onClick="iTrinima( <%=id_rec %>)"></td>
<%
		for ( int i = 0; i < lauk_punktu_tipu.length; i++ ) {
%>
	<td><%= resultSet.getString (  lent_punktu_tipai [ i ]  ) %></td>
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


</tbody>

	</table>
		</div>
			</div>
				</div>

    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>
</html>