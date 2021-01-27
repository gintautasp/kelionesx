<!DOCTYPE HTML>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
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
<HTML>
<body>
 <div class="tm-bg">
            <div class="tm-bg-left"></div>
            <div class="tm-bg-right"></div>
        </div>
    </div>
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
<body>
<FORM action="index.jsp" method="post">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	response.setCharacterEncoding("UTF-8");	
	
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "uzduotis_keliones";
	String userId = "root";
	String password = "";
	String id = request.getParameter("id");
	String pav = request.getParameter("pav");
	String data = request.getParameter("data");
	String laikas = request.getParameter("laikas");
	String trukme = request.getParameter("trukme");
	String flag_ivykusi = request.getParameter("flag_ivykusi");
	String aprasymas = request.getParameter("aprasymas");
	Connection connection = null;
	PreparedStatement pstatement = null;
	Statement statement = null;
	ResultSet resultSet = null;
	Statement statement_take = null;
	Statement statement_change = null;
	int resultSetChange;
	int updateQuery = 0;
	try {	
	Class.forName(driverName);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
	String queryString = "insert into keliones (id, pav,data,laikas,trukme,flag_ivykusi,aprasymas) values(?,?,?,?,?,?,?)";
	pstatement = connection.prepareStatement(queryString);
	pstatement.setString(1, id);
	pstatement.setString(2, pav);
	pstatement.setString(3, data);
	pstatement.setString(4, laikas);
	pstatement.setString(5, trukme);
	pstatement.setString(6, flag_ivykusi);
	pstatement.setString(7, aprasymas);
	updateQuery = pstatement.executeUpdate();

	if (updateQuery != 0) {
	
		try{ 
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
			
		String sql ="SELECT MAX(id) AS `id_keliones` FROM `keliones`";

		statement_take = connection.createStatement();	
		resultSet = statement_take.executeQuery(sql);
		resultSet.next();
		} catch(Exception e) {}
		
        String redirectURL = "/polietuva/keliones_marsrutai?i=" + resultSet.getString ("id_keliones");
        response.sendRedirect(redirectURL);
	}
%>	
	<body>
	<TABLE class="desne lent_vidus lent_virsus" >
	<TR>
	<th colspan="2" style="text-align:center">Paskutinis gautas id</th>
	</tr>
	<tr>
	<TD> id_keliones </TD>
	<TD><%= resultSet.getString ("id_keliones") %></td>
	</tr>
	</TABLE>
	</body>
	
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>

</body> 
</html>