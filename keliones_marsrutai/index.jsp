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
<%@page language="java" import="commons.Crud" %>

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
	
	String[] lent_lp = { "data_laikas", "trukme", "aprasymas" };
	String[] lauk_lp = new String [ lent_lp.length ];		
	Crud lent_lankymasis_punkte = new Crud ( "keliones_marsrutai", lent_lp );
	
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}
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

/*	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}*/

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
			"SELECT *, `lankymasis_punkte`.`aprasymas` AS `lpaprasymas`, `punktai`.`aprasymas` AS `puaprasymas`, `punktai`.`pav` AS `pupav`, `marsrutu_atkarpos`.`pav` AS `mapav`, `keliones_marsruto_atkarpos`.`aprasymas` AS `kma_aprasymas`, `keliones_marsruto_atkarpos`.`data_laikas` AS `kma_data_laikas`, `keliones_marsruto_atkarpos`.`trukme` AS `kma_trukme`, `keliones`.`aprasymas` AS `k_aprasymas`, `lankymasis_punkte`.`data_laikas` AS `lp_data_laikas` " 
			+ "FROM `lankymasis_punkte` " 
			+ "LEFT JOIN `punktai` ON ( `lankymasis_punkte`.`id_punkto`=`punktai`.`id` ) "
			+ "LEFT JOIN `keliones_marsruto_atkarpos` ON ( `lankymasis_punkte`.`id_keliones`=`keliones_marsruto_atkarpos`.`id_keliones` ) "
			+ "LEFT JOIN `marsrutu_atkarpos` ON ( `marsrutu_atkarpos`.`id_punkto1`=`punktai`.`id` AND `marsrutu_atkarpos`.`id`=`keliones_marsruto_atkarpos`.`id_marsruto_atkarpos` ) "
			+ "LEFT JOIN `keliones` ON ( `keliones`.`id`=`lankymasis_punkte`.`id_keliones` ) "
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
					<form method="post" action="">
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
					
<tr class="lent_vidus">
	<td><%= resultSet.getString ( "data_laikas" ) %></td>
	<td><%= resultSet.getString ( "trukme" ) %></td>
	<td><%= resultSet.getString  ("lpaprasymas" ) %></td>
	<td><%= resultSet.getString ( "mapav" ) %></td>
	<td><%= resultSet.getString ( "ipatybes" ) %></td>
	<td><%= resultSet.getString  ("id_punkto1" ) %></td>
	<td><%= resultSet.getString ( "id_punkto" ) %></td><br>
	<td><%= resultSet.getString ( "id_marsruto_atkarpos" ) %></td>
	<td><%= resultSet.getString ( "id_keliones_b8ūdo" ) %></td>
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
								<input type="text" name="data_laikas" value="">
							</td>

							<td>
								<input type="text" name="trukme" value="">
							</td>							

							<td>
								<input type="text" name="lpaprasymas" value="">
							</td>

							<td>
								<input type="text" name="pav4" value="">
								</td>		

							<td>
								<input type="text" name="pav5" >
							</td>	

							<td>
								<select name="id_punkto1" id="id_punkto1">
								<option value="1"> 1 </option>
								<option value="2"> 2 </option>
								</select>
							</td>
							
							<td>
								<select name="id_punkto" id="id_punkto">
								<%
								try {
									Statement st = connection.createStatement();
									String sql = "SELECT * FROM `punktai`";
									ResultSet rs = st.executeQuery(sql);
									while(rs.next() ){
								%>
										<option value="<%=rs.getString("id")%>"><%=rs.getString("pav")%><%=rs.getString("ilguma")%>"><%=rs.getString("platuma")%>"><%=rs.getString("aprasymas")%>"></option>												
								<%
									}

								}catch(Exception e){

								}
								%>
								
								</select>
							</td>
							
							<td>
								<select name="id_marsruto_atkarpos" id="id_marsruto_atkarpos">
								
								</select>
							</td>
							
							<td>
								<select name="id_keliones_budo" id="id_keliones_budo">
								<%
								try {
									Statement st = connection.createStatement();
									String sql = "SELECT * FROM `keliones_budai`";
									ResultSet rs = st.executeQuery(sql);
									while(rs.next() ){
								%>
										<option value="<%=rs.getString("id")%>"><%=rs.getString("pav")%></option>												
								<%
									}

								}catch(Exception e){

								}
								%>
								</select>
							</td>
							
							<td>
								<input type="kma_aprasymas" name="kma_aprasymas">
							</td>
							
							<td>
								<input type="kma_data_laikas" name="kma_data_laikas">
							</td>
							
							<td>
								<input type="kma_trukme" name="kma_trukme">
							</td>
									<td>
								<!--<input type="hidden" name="atkarpos_numeris" value="1">-->
								<input type="hidden" name="id_marsruto_atkarpos" value="1">
							</td>
														
						</tr> 
					</table>
					
				<!--	</form>  -->
						
						    <div class="col text-center">
							<!--	<input type="button" name="clear" value="valyti" onClick = "iValyma()"> 
								<input type="submit" name="add" value="pakeisti"> -->
								<input type="submit" name="add" value="papildyti">
							</div>
							<div>
								<!--<input type="hidden" id="id_budai" name="id_budai" value="0">
								<input type="hidden" id="alert" name="alert" value="0">
							</form>
							<form id="del_rec" method="post" action="">
								<input type="hidden" name="del" value="del1rec">
								<input type="hidden" id="m_del" name="m_del" value="0">-->
						</form>
							</div>
						</tr>
		</div>
	</div>
<%
	
	// Connection connection = null;
	Statement statement1 = null;
	ResultSet resultSet1 = null;
	Statement statement_take1 = null;
	Statement statement2 = null;
	ResultSet resultSet2 = null;
	Statement statement_take2 = null;
	
	String[] lent_lpaprasymas = {  "data_laikas", "trukme", "lpaprasymas", "id_punkto1", "id_keliones"};
	String[] lauk_lpaprasymas = new String [ lent_lpaprasymas.length ];
	
	String[] lent_km_aprasymas = {  "id_marsruto_atkarpos", "id_keliones_budo", "kma_aprasymas", "kma_data_laikas", "kma_trukme", "atkrapos_numeris", "id_keliones"};
	String[] lauk_km_aprasymas = new String [ lent_km_aprasymas.length ];
	
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try { 
	
		//connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String add; 
		String id_keliones;
		String atkarpos_numeris;
		
		//	id_keliones = request.getParameter ("i");
		id_keliones = "1";
		atkarpos_numeris = "1";
		
		if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "papildyti" ) ) {
		
			for ( int i = 0; i< lent_lpaprasymas.length; i++ ) {
			
				lauk_lpaprasymas [ i ] = request.getParameter ( lent_lpaprasymas [ i ] );
			}

			String sql_ins = "";
			String comma = "";
			
			for ( int i = 0; i < lent_lpaprasymas.length - 1; i++ ) {
			
				sql_ins =  sql_ins + comma  + "'" + lauk_lpaprasymas [ i ] + "'";
				comma = ",";
			}
			
			sql_ins = 
				"INSERT INTO `lankymasis_punkte`"
				+ " ( `data_laikas`, `trukme`, `aprasymas`, `id_punkto`, `id_keliones`)"
				+ " VALUES ( "			
				+ sql_ins + ", '" + id_keliones + "' "
				+ " )";

			out.println ( sql_ins ); 

			Statement statement_change1 = connection.createStatement();
			Integer  resultSetChange1 = statement_change1.executeUpdate(sql_ins);			
					
		for ( int i = 0; i< lent_km_aprasymas.length; i++ ) {
			
				lauk_km_aprasymas [ i ] = request.getParameter ( lent_km_aprasymas [ i ] );
			}

			String sql_ins1 = "";
			String comma1 = "";
			
			for ( int i = 0; i < lent_km_aprasymas.length - 2; i++ ) {
			
				sql_ins1 =  sql_ins1 + comma1  + "'" + lauk_km_aprasymas [ i ] + "'";
				comma1 = ",";
			}
			
			sql_ins1 = 
				"INSERT INTO `keliones_marsruto_atkarpos`"
				+ " ( `id_marsruto_atkarpos`, `id_keliones_budo`, `aprasymas`, `data_laikas`, `trukme`, `atkrapos_numeris`, `id_keliones` )"
				+ " VALUES ( "			
				+ sql_ins1 + ", '" + atkarpos_numeris + "', '" + id_keliones + "' "
				+ " )";

			out.println ( sql_ins1 );  

			Statement statement_change2 = connection.createStatement();
			Integer  resultSetChange2 = statement_change2.executeUpdate(sql_ins1);			
			
		 } else {
		 
			if ( add != null ) {

				out.println ( add );
			}
		 } 
		 
		statement_take1 = connection.createStatement();		
		String sql ="SELECT * FROM `lankymasis_punkte`  WHERE 1";

		resultSet1 = statement_take1.executeQuery(sql);
		 
		while( resultSet1.next() ){
 
		}
		

	} catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>	
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>

</html>
