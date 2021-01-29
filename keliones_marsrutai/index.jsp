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
	String dbName = "uzduotis_keliones";
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
                                <li class="nav-item active">
                                    <a class="nav-link tm-nav-link" href="../keliones_marsrutai">Maršrutai <span class="sr-only">(current)</span></a>
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
	<div class="container.fluid">
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
		
	//	id = request.getParameter ("i");		
		id = "1";
		if ( id != null ) {
																												
			where_part += " AND `lankymasis_punkte`.`id_keliones`= '"+ id +"'";																																				
			

		String datax = 
			"SELECT *, `lankymasis_punkte`.`aprasymas` AS `lpaprasymas`, `punktai`.`aprasymas` AS `puaprasymas`, `punktai`.`pav` AS `pupav`, `marsrutu_atkarpos`.`pav` AS `mapav`, " 
			+ "`keliones_marsruto_atkarpos`.`aprasymas` AS `kma_aprasymas`, `keliones_marsruto_atkarpos`.`data_laikas` AS `kma_data_laikas`, `keliones_marsruto_atkarpos`.`trukme` AS `kma_trukme`, `keliones`.`aprasymas` AS `k_aprasymas` FROM `lankymasis_punkte`"	 
			+ "LEFT JOIN `keliones` ON ( `keliones`.`id`=`lankymasis_punkte`.`id_keliones` )"
			+ "LEFT JOIN `punktai` ON ( `lankymasis_punkte`.`id_punkto`=`punktai`.`id` )"
			+ "LEFT JOIN `marsrutu_atkarpos` ON ( `marsrutu_atkarpos`.`id_punkto1`=`punktai`.`id` )"
			+ "LEFT JOIN `keliones_marsruto_atkarpos` ON ( `marsrutu_atkarpos`.`id`=`keliones_marsruto_atkarpos`.`id_marsruto_atkarpos` )"
			+ where_part;
			
			out.println ( datax );

			statement_take = connection.createStatement();	
			resultSet = statement_take.executeQuery(datax);
	
			boolean uzsipilde = false;

while( resultSet.next() ){
	
	if ( ! uzsipilde ){

%>


										
<tr class="lent_vidus">
	<td><%= resultSet.getString ( "pav" ) %></td>
	<td><%= resultSet.getString ( "data" ) %></td>
	<td><%= resultSet.getString  ("laikas" ) %></td>
	<td><%= resultSet.getString ( "trukme" ) %></td>
	<td><%= resultSet.getString ( "k_aprasymas" ) %></td>
</tr>

					</table>
						<h2 align="center"><strong>Lankymasis punkte ir maršrutų atkarpos</strong></h2>
						<table align="center" cellpadding="5" cellspacing="5" border="1">
						<tr>

						</tr>
						<tr class="lent_virsus">
							<th>Data/laikas</th>
							<th>Trukmė</th>
							<th>Lankimosi punkte aprašymas</th>
							<th>Pavadinimas</th>
							<th>Ypatybės</th>
							<th>Id 1 punkto</th>
							<th>Id 2 punkto</th>
							<th>Maršruto atkarpos id</th>
							<th>Kelionės būdo id</th>
							<th>Keliones maršruto aprašymas</th>
							<th>Keliones maršruto data/laikas</th>
							<th>Keliones maršruto trukme</th>							
							<!--<th>Punkto pavadinimas</th> "pupav"
							<th>Punkto ilguma</th> "ilguma"
							<th>Punkto platuma</th> "platuma"
							<th>Punkto aprašymas</th> "puaprasymas" --> 
							
						</tr>
<%
uzsipilde = true;
}
%>					
					<form method="post" action="">
<tr class="lent_vidus">
	<td><%= resultSet.getString ( "data_laikas" ) %></td>
	<td><%= resultSet.getString ( "trukme" ) %></td>
	<td><%= resultSet.getString  ("lpaprasymas" ) %></td>
	<td><%= resultSet.getString ( "mapav" ) %></td>
	<td><%= resultSet.getString ( "ipatybes" ) %></td>
	<td><%= resultSet.getString  ("id_punkto1" ) %></td>
	<td><%= resultSet.getString ( "id_punkto2" ) %></td><br>
	<td><%= resultSet.getString ( "id_marsruto_atkarpos" ) %></td>
	<td><%= resultSet.getString ( "id_keliones_būdo" ) %></td>
	<td><%= resultSet.getString ( "kma_aprasymas" ) %></td>
	<td><%= resultSet.getString ( "kma_data_laikas" ) %></td>
	<td><%= resultSet.getString ( "kma_trukme" ) %></td>
</tr>



<% 
		}

	} 
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
						<tr class="lent_vidus">

							<td>
								<input type="text" name="pav1" value="">
							</td>

							<td>
								<input type="text" name="pav2" value="">
							</td>							

							<td>
								<input type="text" name="pav3" value="">
							</td>

							<td>
								<input type="text" name="pav4" value="">
								</td>		

							<td>
								<input type="text" name="pav5" required>
							</td>	

							<td>
								<select name="id_punkto1" id="id_punkto1">
								<option value="1"> Kebabinė </option>
								<option value="2"> Vykcara fabrikas </option>
								</select>
							</td>
							
							<td>
								<select name="id_punkto2" id="id_punkto2">
								
								</select>
							</td>
							
							<td>
								<select name="id_marsruto_atkarpos" id="id_marsruto_atkarpos">
								
								</select>
							</td>
							
							<td>
								<select name="id_keliones_būdo" id="id_keliones_būdo">
								try {
									Statement st = connection.createStatement();
									String sql = "SELECT * FROM `keliones_budai`";
									ResultSet rs = st.executeQuery(sql);
									while(rs.next() ){
								%>
										<option><%=rs.getString("pav")%></option>
								<%
									}

								}catch(Exception e){

								}
								%>
								</select>
							</td>
							
							<td>
								<input type="text" name="pav6" required>
							</td>
							
							<td>
								<input type="text" name="pav7" required>
							</td>
							
							<td>
								<input type="text" name="pav8" required>
							</td>
														
						</tr>
					</table>
					</form>
						    <div class="col text-center">
								<input type="submit" name="search" value="Įvesti">
							</div>
						</tr>
		</div>
	</div>
	
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>

</html>
