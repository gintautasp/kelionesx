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
					<form method="post" action="">
						<table>
						<tr>
							<th>Kelionės pavadinimas</th>
							<td>
								<input type="text" name="pav1" value="vidurio Lietuva">
							</td>
							<th>Aplankomas punktas</th>
							<td>
								<input type="text" name="pav2" value="Kėdainių agurkų fabrikas/alpės">
							</td>							
							<th>Trukmė</th>
							<td>
								<input type="text" name="pav3" value="360">
							</td>
								<th>Data/laikas</th>
							<td>
								<input type="text" name="pav4" value="-03-">
							<!--	</td>		
							<th>Galutinis punktas</th>
							<td>
								<input type="text" name="pav" required>
							</td>	
							<th>Placeholder</th>
							<td>
								<input type="text" name="pav" required>
							</td>	-->
						</tr>
						<tr>
								<td>
									<input type="submit" name="search" value="Ieškoti">
								</td>	
						</tr>
						</table>
						<h2 align="center"><strong>Kelionės paieška</strong></h2>
						<table align="center" cellpadding="5" cellspacing="5" border="1">
						<tr>

						</tr>
						<tr class="lent_virsus">
							<th>Kelionės Pavadinimas</th>
							<th>Aplankomas punktas</th>
							<th>Trukmė</th>
							<th>Data</th>
							<!--<th>Pradinis punktas</th>
							<th>Galutinis punktas</th>
							<th>Koordinatės</th>
							<th>Aprašymas</th>-->
						</tr>

<%

	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try { 
	
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String ivestis = request.getParameter ("search");
		String data;
		String where_part = "WHERE 1";
		
		if ( ivestis != null ) {
		
			data = request.getParameter ("pav1");																																
			where_part += " AND `keliones`.`pav`= '"+ data +"'";																																				
		 } 		
					 		
		String datax = 
			"SELECT * FROM `keliones`"	 
			//+ ", COUNT( `karalystes`.`id` ) AS `sk_karalysciu` " 
			//+ ", GROUP_CONCAT( CONCAT( `karalystes`.`pav`, '(', `sub_karalyste`.`pav`, ') ') ) AS `sugrupuota`"
			//+ "FROM `domenas` "
			//+ "LEFT JOIN `karalystes` ON ( `karalystes`.`domeno_kodas`=`domenas`.`kodas` ) "
			//+ "LEFT JOIN `sub_karalyste` ON ( `karalystes`.`pav`=`sub_karalyste`.`kar_pav` ) "
			+ where_part;
			//+ "GROUP BY `domenas`.`kodas`";
			
			//out.println ( datax );

			statement_take = connection.createStatement();	
			resultSet = statement_take.executeQuery(datax);
			
		while( resultSet.next() ){
%>
<tr class="lent_vidus">
	<td><%= resultSet.getString ( "pav" ) %></td>
	<td><%= resultSet.getString ( "trukme" ) %></td>
	<!--<td><%= resultSet.getString  ("sk_karalysciu" ) %></td>
	<td><%=resultSet.getString ( "sugrupuota" ) %></td>-->
</tr>

<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
					</table>
					</form>
				</div>
		</div>
	</div>
	</form>
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>

</html>