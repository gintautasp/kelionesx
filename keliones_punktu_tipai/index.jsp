<!DOCTYPE html>
<html lang="en">
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>   
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%    //@page language="java" import="commons.Crud" %>  
<head>
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
	
</head>

<body>
<%

	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "keliones";
	String userId = "root";
	String password = "";

	Connection connection = null;
	Statement statement_take = null;
	Statement statement_change = null;
	ResultSet resultSet = null;
	int resultSetChange;

%>

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
				<input type="text" name="pav" placeholder="Punktu_tipai">
				<input type="submit" name="add" value="Papildyti" class="btn btn-primary">
			</form>
				<p>Punktu tipai</p>
				<p id="counter"></p>
				<table class="pt-centrinis">
					<tr class="punktu_tipai">
					<th><h6>Punktu tipai</h6></th>
					</tr>
					<tbody id="tasks">
<%
	String[] lent_punktu_tipai = {  "pav" };
	String[] lauk_punktu_tipu = new String [ lent_punktu_tipai.length ];   
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try { 
	
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String add; 
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "Papildyti" ) ) {
		
																																					// Miestai miestas = new Miestai ( lent_miestu );
																																					// miestas.takeFromParams ( request );

			for ( int i = 0; i<lent_punktu_tipai.length; i++ ) {
			
				lauk_punktu_tipu [ i ] = request.getParameter ( lent_punktu_tipai [ i ] );
			}

			String sql_ins = "";
			String comma = "";
			
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
		 
			if ( add != null ) {

				out.println ( add );
			}
		 } 
		
		statement_take = connection.createStatement();		
		String sql ="SELECT * FROM `punktu_tipai` WHERE1";

		resultSet = statement_take.executeQuery(sql);
		 
		while( resultSet.next() ){
%>
<tr>
	<td><input type="button" class="record_edit" data-id_punkto_tipo="" value="&#9998;"></td>   
	<td><input type="button" class="delete" data-id_punkto_tipo="" value="&#10006;"></td>
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