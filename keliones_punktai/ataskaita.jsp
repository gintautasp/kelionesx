<!DOCTYPE html>
<html lang="en">
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.DriverManager"%>   
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<head>
<style>
        td, tr, table {
            font-size: 25px;
            text-align: center;
            background-color: #A8BFD8;
            border-color: #2A0B93;
        }

</style>
    <meta charset="UTF-8">
    <h1 align=center> Ataskaita</h1>

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
    String[] punktai = {  "pav", "platuma", "ilguma", "aprasymas"  };
    String[] reiksmes_punktai = new String [ punktai.length ];

    	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}
%>


</head>


<table>

<%
try {
                        
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");		

                    
                connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
                String add = "";
                
                String sql_ins = "";
            
                if ( ( ( add = request.getParameter("add") ) != null ) && add.equals ( "Prideti" ) ) {

                    String id_punkto = request.getParameter ("id_punkto");
                    

                    if ( (id_punkto==null) || id_punkto.equals ("0") ) {

                        for ( int i=0; i<punktai.length; i++ ) {

                            reiksmes_punktai [ i ] = request.getParameter ( punktai [ i ] );
                        }
                        
                        String comma = "";
                        
                        for ( int i = 0; i < reiksmes_punktai.length; i++ ) {
                        
                            sql_ins =  sql_ins + comma  + "'" + reiksmes_punktai [ i ] + "'";
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

                        sql_ins = "UPDATE `punktai` SET `pav`='"+request.getParameter("pav")+"',ilguma='"+request.getParameter("ilguma")+"',platuma='"+request.getParameter("platuma")+"',aprasymas='"+request.getParameter("aprasymas")+"' WHERE `id` ="+id_punkto;

                        statement_change = connection.createStatement();
                        resultSetChange = statement_change.executeUpdate(sql_ins);
                    } 

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
                    <td><input type="button" class="record_edit" id="toEdit_<%= id_rec  %>" data-id_punkto="<%= id_rec  %>"<%= rec_data %> value="&#9998;"></td>
                <%
                        for ( int i = 0; i < reiksmes_punktai.length; i++ ) {
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


</body>
</html>