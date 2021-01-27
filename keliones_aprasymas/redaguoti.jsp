<!DOCTYPE html>
<html lang="en">
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "uzduotis_keliones";
	String userId = "root";
	String password = "";
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	Statement statement_take = null;
	Statement statement_change = null;
	int resultSetChange;
	String datax = "";
	String idx = "";
	String pav = "";
	String data = "";
	String laikas = "";
	String trukme = "";
	String flag_ivykusi = "";
	String aprasymas = "";
	String options = "";
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");				
	} catch(Exception e) {}

	try { 
				
				 pav = request.getParameter("pav");
				 data = request.getParameter("data");
				 laikas = request.getParameter("laikas");
				 trukme = request.getParameter("trukme");
				 flag_ivykusi = request.getParameter("flag_ivykusi");
				 aprasymas = request.getParameter("aprasymas");
			
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String id = "SELECT MAX(id) AS `id` FROM `keliones`";
	
	
		statement_take = connection.createStatement();	
		resultSet = statement_take.executeQuery(id);
			
		if ( resultSet.next() ){
			idx = request.getParameter ("i");
			datax = "update `keliones` set pav='"+pav+"',data='"+data+"',laikas='"+laikas+"',trukme='"+trukme+"',flag_ivykusi='"+flag_ivykusi+"',aprasymas='"+aprasymas+"' WHERE `id`='"+idx+"'";
			
			Statement statement_take_data = connection.createStatement();	
			Integer resultSet_data = statement_take_data.executeUpdate(datax);
			if(resultSet_data > 0)
			{
			out.print("Pakeitimai atlikti");
			}
			else
			{
			out.print("Redaguoti nepavyko");
			}
			
			String redirectURL = "/polietuva/keliones_marsrutai?i=" +idx;
			response.sendRedirect(redirectURL);
		}
	}		catch(Exception sql)
			{
			request.setAttribute("error", sql);
			out.println(sql);
			}
%>

<body>
<%= datax %>

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
                                <li class="nav-item active">
                                    <a class="nav-link tm-nav-link" href="../keliones_aprasymas">Aprašymas <span class="sr-only">(current)</span></a>
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