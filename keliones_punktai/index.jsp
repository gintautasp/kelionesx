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

<%

	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "uzduotis_keliones";
	String userId = "root";
	String password = "";

	Connection connection = null;
	Statement statement_take = null;
	Statement statement_change = null;
	ResultSet resultSet = null;
    int resultSetChange;
    
%>

    <script>

        function iRedagavima ( id_rec ) {
        
        if ( mygtukas = document.getElementById ( 'toEdit_' + id_rec ) ) {
<%
            for ( int i=0; i<punktai.length; i++ ) {
%>
                document.getElementById( '<%= punktai [ i ]  %>' ).value =  mygtukas.dataset.<%= punktai [ i ]  %>;
<%	
            }
%>
                document.getElementById ( "punkto" ).value = id_rec;
        }
    }
   
<%		
try {
    String del;
    String where_salyga;

    if ( ( ( del = request.getParameter("del")  ) != null ) && del.equals ( "del1rec" ) ) {
%>
        // alert( "opa" );
<%
    //	String sql_delete = keliones_punktai.delete (keliones_punktai);
    //	statement_change = connection.createStatement();
    //	resultSetChange = statement_change.executeUpdate(sql_delete);
        
    }

}  catch ( Exception e ) {

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
								<li class="nav-item active">
                                    <a class="nav-link tm-nav-link" href="../keliones_punktai">Punktai <span class="sr-only">(current)</span></a>
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
                    <div class="container.fluid">


                    <h1>Įveskite norimo aplankyti punkto informaciją</h1>
				
                <form method="POST" action="">
                        <label for="text">Pavadinimas</label>
                        <input type="text" id="pav" name="pav" value=""><br>
                        
                        <label for="text">Ilguma</label>
                        <input type="text" id="ilguma" name="ilguma" value=""><br>
                        
                        <label for="text">Platuma</label>
                        <input type="text" id="platuma" name="platuma" value=""><br>
                        
                        <label for="text">Aprašymas</label>
                        <input type="text" id="aprasymas" name="aprasymas" value="">
                        <input type="submit" name="add" value="Pridėti"><br>
                    

                  
                    <input type="hidden" id="id_punkto" name="id_punkto" value="0">
                    
                </form>    
        
                <form id="del_rec" method="post" action="">
                    <input type="hidden" name="del" value="del1rec">
                    <input type="hidden" id="m_del" name="m_del" value="0">
                </form>

                    <table>

<%
        String[] punktai = {  "pav", "platuma", "ilguma", "aprasymas"  };
        String[] pv_punktai = new String [ punktai.length ];   
               
            try {
                        
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");		
            
                } catch(Exception e) {}
            
            try { 
                    
                connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
                String add;
                String sql_ins = "";
                
                if ( ( ( add = request.getParameter("add")  ) != null ) && add.equals ( "Pridėti" ) ) {

                    for ( int i=0; i<punktai.length; i++ ) {

                        pv_punktai [ i ] = request.getParameter ( punktai [ i ] );
                    }
                    
                    String comma = "";
                    
                    for ( int i = 0; i < id_punktai.length; i++ ) {
                    
                        sql_ins =  sql_ins + comma  + "'" punktai [ i ] + "'";
                        comma = ",";																												
                    }
                    
                    sql_ins = 
                    "INSERT INTO `punktai`"
                    + " (`pav`, `ilguma`, `platuma`, `aprasymas` )"
                    + " VALUES ( "			
                    + sql_ins
                    + " )";
                    out.println (sql_ins);

                    statement_change = connection.createStatement();
                    resultSetChange = statement_change.executeUpdate(sql_ins);			
                    
                } else {
                    
                    if ( add != null ) {

                        out.println ( add );
                    }
                } 
                        
                statement_take = connection.createStatement();		
                String sql ="SELECT * FROM `punktai` WHERE1";

                resultSet = statement_take.executeQuery(sql);
                            
                while ( resultSet.next() ){

                    String rec_data = "";
		
                    for ( int i = 0; i < punktai.length; i++ ) { 

                        rec_data += " data-"  + punktai [ i ]  + "=\"" + resultSet.getString (  punktai [ i ]  ) + "\"";

                    }  
			        String id_rec = resultSet.getString (  "id"  );

                %>

                <tr>
                    <td><input type="button" class="record_edit"  id="toEdit_<%= id_rec  %>" data-punktai="<%= id_rec  %>"<%= rec_data %> value="&#9998;" onClick="iRedagavima( <%= id_rec %> )"></td>
                <%
                        for ( int i = 0; i < pv_punktai.length; i++ ) {
                %>
                    <td><%= resultSet.getString (  punktai [ i ]  ) %><br></td>
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
                </table>
                    </div>
                </div>
    </div>
    </div>

    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>
</html>