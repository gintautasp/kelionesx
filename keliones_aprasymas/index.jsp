<!DOCTYPE html>
<html lang="en">
<body onload="mygtukas()">
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
	<%-- https://redstapler.co/sweetalert-tutorial/ --%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
	<script>
		function mygtukas() {
		
		i = <%= request.getParameter ("i") %>;
		
			if ( i > 0) {
				document.getElementById("atsirasti").removeAttribute("hidden");
			}

			else {
				document.getElementById("atsirasti").setAttribute("hidden","");
			}
		}
		function iredaguoti(){
			
				swal({
                    title: "Ačiū!",
                    text: "Jūsų duomenys tuoj bus išsaugoti",
                    icon: "success"
                    });
			forma = document.getElementById ("contact-form")
			forma.action = "redaguoti.jsp";
			forma.submit();
		}
	</script>
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
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try { 
			String pav = "";
			String data = "";
			String laikas = "";
			String trukme = "";
			String flag_ivykusi = "";
			String aprasymas = "";
			
	connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
	String id = "SELECT MAX(id) AS `id` FROM `keliones`";
	
	
		statement_take = connection.createStatement();	
		resultSet = statement_take.executeQuery(id);
			
		if ( resultSet.next() ){
			String idx = request.getParameter ("i");
			data = "";
			datax = "SELECT * FROM `keliones` WHERE `id`='"+ idx +"'";
			
			Statement statement_take_data = connection.createStatement();	
			ResultSet resultSet_data = statement_take_data.executeQuery(datax);
			
			if ( resultSet_data.next() ){
				
				
				 pav = resultSet_data.getString("pav");
				 data = resultSet_data.getString("data");
				 laikas = resultSet_data.getString("laikas");
				 trukme = resultSet_data.getString("trukme");
				 flag_ivykusi = resultSet_data.getString("flag_ivykusi");
				 aprasymas = resultSet_data.getString("aprasymas");
			}
		}

%>



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
                                    <a class="nav-link tm-nav-link" href="../marsrutu_atkarpos">Maršrutų atkarpos</a>
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
                        <h2 class="mb-4 tm-content-title">Kelionės aprašymas</h2>
                        <p><em>„Gamta davė žmogui poreikį rūpintis visais žmonėmis.“</p>
						<p style="text-align:right"></em><strong>Markas Aurelijus</br></strong></p>
						<br></br>
						<p>Tad pasirūpinkime kitais pasidalindami savo įspūdžiais! 
						Įveskite kelionės pavadinimą, datą ir laiką, kada Jūs išvykote. Taip pat užpildykite laukelį "Trukmė" atsakydami į klausimą - Kiek laiko truko Jūsų kelionė?
						O tuomet pati svarbiausia dalis, kurioje negailėdami pareiškite savo įspudžius/nusivylimus ar kitus pastebėjimus, kurie praverstų būsimiems keliautojams 
						<strong>Po Lietuvą!</strong> </p>
                        <form id="contact-form" action="surinkti_duomenys.jsp" method="POST">
                            <div class="form-group mb-4">
								<input type="hidden" id="custId" name="custId" value="<%= id %>">
                                <input type="text" name="pav" class="form-control" value="<%= pav %>" placeholder="Pavadinimas" required="" /></p>
                            </div>
                            <div class="form-group mb-4">
                                <input type="datetime" name="data"  value="<%= data %>" class="form-control" placeholder="Data" required="" />
                            </div>
							<div class="form-group mb-4">
                                <input type="time" name="laikas" class="number" value="<%= laikas %>"  placeholder="Laikas" required="" />
                            </div>
							<div class="form-group mb-4">
                                <input type="text" name="trukme" class="form-control" value="<%= trukme %>" placeholder="Trukmė" required="" />
                            </div>
							<div class="form-group mb-4">
                               Kelionė įvykusi ar planuojama?
							   <select type="text" name="flag_ivykusi" value="flag_ivykusi"  />
									<option>---Pasirinkite---</option>
									<option value="Įvykus" <%= ( ( flag_ivykusi.equals("Įvykus") ) ? "selected" : "" ) %>>Įvykus</option>
									<option value="Planuojama" <%= ( ( flag_ivykusi.equals("Planuojama") ) ? "selected" : "" ) %>>Planuojama</option>
								</select>
								</div>
                            <div class="form-group mb-5">
                                <textarea rows="6" input type="text" name="aprasymas" class="form-control" placeholder="Aprašymas" required="" ><%= aprasymas %></textarea>
                            </div>
                            <div class="text-right">
                                <input type="submit" value="Patvirtinti" class="btn btn-big btn-primary"></button>
                            </div>
                        </form>
						  
						  <form id="contact-form-1" action="redaguoti.jsp" method="POST">
						  <br>
						  <div class="text-right" id ="atsirasti">
                                <input type="button" onClick="iredaguoti()" value="Redaguoti" class="btn btn-big btn-primary"></button>
                            </div>
							</form>
						
                    </section>
                </main>
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
            <div class="tm-col-right tm-col-footer">
                <footer class="tm-site-footer text-right">
                    <p class="mb-0">Tikėkimes, kad 2021 bus geresni
                    
                    | Bendras projektas: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-text-link">Po Lietuva!</a></p>
                </footer>
            </div>   
        </div>        

        <!-- Diagonal background design -->
        <div class="tm-bg">
            <div class="tm-bg-left"></div>
            <div class="tm-bg-right"></div>
        </div>
    </div>
	
<%
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
	
	
</body>
</html>