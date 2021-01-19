<!DOCTYPE html>
<html lang="en">
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Po Lietuva!</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../font/css/all.min.css" rel="stylesheet" /> 
    <link rel="stylesheet" href="../css/templatemo-diagoona.css?v=1.0">

</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
// String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "kelionesx";
	String userId = "root";
	String password = "";

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	Statement statement_take = null;
	
%>
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
								<li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones_budai">Būdai</a>
                                </li>
								<li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones_punktai">Punktai</a>
                                </li>	
								<li class="nav-item active">
                                    <a class="nav-link tm-nav-link" href="../keliones">Kelionės <span class="sr-only">(current)</span></a>
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

				<div class="container.fluid">
<%

	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try { 
	
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String ivestis = request.getParameter ("search");
		String id;
		String where_part = "WHERE 1";
		
		id = request.getParameter ("i");		
		
		if ( id != null ) {
																												
			where_part += " AND `lankymasis_punkte`.`id_keliones`= '"+ id +"'";																																				
			

		String datax = 
			"SELECT *, `lankymasis_punkte`.`aprasymas` AS `lpaprasymas`, `punktai`.`aprasymas` AS `puaprasymas`, `punktai`.`pav` AS `pupav` FROM `lankymasis_punkte`"	 
			+ "LEFT JOIN `keliones` ON ( `keliones`.`id`=`lankymasis_punkte`.`id_keliones` )"
			+ "LEFT JOIN `punktai` ON ( `lankymasis_punkte`.`id_punkto`=`punktai`.`id` )"
			+ where_part;
			
			out.println ( datax );

			statement_take = connection.createStatement();	
			resultSet = statement_take.executeQuery(datax);
%>
						
						<h2 align="center"><strong>Kelionės Aprašymas</strong></h2>
						<table align="center" cellpadding="5" cellspacing="5" border="1">
						<tr>

						</tr>
						<tr class="lent_virsus">
							<th>Kelionės Pavadinimas</th>
							<th>Datas</th>
							<th>Laikas</th>
							<th>Trukmė</th>
							<th>Aprašymas</th>
							<!--<th>Galutinis punktas</th>
							<th>Koordinatės</th>
							<th>Aprašymas</th>-->
						</tr>
<% 		
while( resultSet.next() ){
%>
<tr class="lent_vidus">
	<td><%= resultSet.getString ( "pav" ) %></td>
	<td><%= resultSet.getString ( "data" ) %></td>
	<td><%= resultSet.getString  ("laikas" ) %></td>
	<td><%= resultSet.getString ( "trukme" ) %></td>
	<td><%= resultSet.getString ( "aprasymas" ) %></td>
</tr>

					</table>
					</div>
				<div class="container.fluid">

						<h2 align="center"><strong>Punktų aprašymas</strong></h2>
						<table align="center" cellpadding="5" cellspacing="5" border="1">
						<tr>

						</tr>
						<tr class="lent_virsus">
							<th>Data/laikas</th>
							<th>Trukmė</th>
							<th>Lankimosi punkte aprašymas</th>
							<th>Punkto pavadinimas</th>
							<th>Punkto ilguma</th>
							<th>Punkto platuma</th>
							<th>Punkto aprašymas</th>
							
						</tr>

<tr class="lent_vidus">
	<td><%= resultSet.getString ( "data_laikas" ) %></td>
	<td><%= resultSet.getString ( "trukme" ) %></td>
	<td><%= resultSet.getString  ("lpaprasymas" ) %></td>
	<td><%= resultSet.getString ( "pupav" ) %></td>
	<td><%= resultSet.getString ( "ilguma" ) %></td>
	<td><%= resultSet.getString ( "platuma" ) %></td>
	<td><%= resultSet.getString  ("puaprasymas" ) %></td>
</tr>
					</table>
				</div>				

<% 
		}
	} 
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>

		</div>
	</div>
	</form>
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>

</html>