<!DOCTYPE html>
<html lang="lt">
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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<head>
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
								<li class="nav-item">
                                    <a class="nav-link tm-nav-link" href="../keliones">Kelionės</a>
                                </li>								
                                <li class="nav-item active">
                                    <a class="nav-link tm-nav-link" href="../marsrutu_atkarpos">Maršrutų atkarpos <span class="sr-only">(current)</span></a>
                                </li>
								<li>
                                </li>									
                            </ul>                           
                        </div>                         
                    </nav>
                </div>
            </div>
</head>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" import="commons.Crudas" %>
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
	
	String[] lent_marsrutu_atkarpos = { "pav", "ipatybes", "id_punkto1", "id_punkto2" };
	String[] lauk_marsrutu_atkarpos = new String [ lent_marsrutu_atkarpos.length ];  
 
	Crudas atkarpos_crud = new Crudas ( dbName, userId, password, connectionUrl, "marsrutu_atkarpos",  lent_marsrutu_atkarpos );
	
%>
<script>
function salinimas(dialogText, dialogTitle, id_rec) {
  $('<div style="padding: 10px; max-width: 500px; word-wrap: break-word;">' + dialogText + '</div>').dialog({
    draggable: false,
    modal: true,
    resizable: false,
    width: 'auto',
    title: dialogTitle || 'Trinimas',
    minHeight: 75,
    buttons: {
      Patvirtinti: function () {
				
		document.getElementById ( "m_del" ).value = id_rec;

				
		forma_del = document.getElementById ( "del_rec" );

		forma_del.submit();

        $(this).dialog('destroy');
      },
      Atšaukti: function () {
        $(this).dialog('destroy');
      }
    }
  });
}
$( function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
	  id = $( "#id" ),
      pav = $( "#pav" ),
	  ipatybes = $( "#ipatybes" ),
      id_punkto1 = $( "#id_punkto1" ),
	  id_punkto2 = $( "#id_punkto2" ),
      allFields = $( [] ).add( id ).add( pav ).add( ipatybes ).add( id_punkto1 ).add( id_punkto2 ),
      tips = $( ".validateTips" );	
		
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Length of " + n + " must be between " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    function addUser() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
	  
	/*
	  valid = valid && checkLength( tipas, "tipas", 1, 1000 );
      valid = valid && checkLength( pav, "pav", 1, 1000 );
      valid = valid && checkLength( kvadratura_kv_m, "kvadratura_kv_m", 1, 1000 );
	  valid = valid && checkLength( numatomi_darbai, "numatomi_darbai", 1, 1000 );
	  valid = valid && checkLength( pradzia, "pradzia", 1, 1000 );
	  valid = valid && checkLength( numatoma_pabaiga, "numatoma_pabaiga", 1, 1000 );
	  
	  valid = valid && checkRegexp( tipas, /([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
      valid = valid && checkRegexp( pav, /([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
      valid = valid && checkRegexp( kvadratura_kv_m, /([0-9a-z_\s])+$/i,"eg. ui@jquery.com" );
      valid = valid && checkRegexp( numatomi_darbai, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
	  valid = valid && checkRegexp( pradzia, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
	  valid = valid && checkRegexp( numatoma_pabaiga, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
	*/
      if ( valid ) {
		  	 $("#lentele").submit();
     }
	 	 
      return valid;
    }
 
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Pridėti": addUser,
        "Atšaukti": function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
			
			$('.record_edit').click(function(){
			id_rec=$(this).data('id_marsrutu_atkarpos');
				if (mygtukas = document.getElementById ('toEdit_' + id_rec) ) {
<%				
					for ( int i=0; i<lent_marsrutu_atkarpos.length; i++) {
%>
					document.getElementById('<%=lent_marsrutu_atkarpos [ i ] %>').value= mygtukas.dataset.<%=lent_marsrutu_atkarpos [ i ] %>;
<%
					}
%>
				document.getElementById( "id_marsrutu_atkarpos" ).value = id_rec
				dialog.dialog("open");
				}
			} );
	  } );
	  
	  function Trinti ( id_rec ) {
			
				mygtukasEdit = document.getElementById ( 'toDelete_' + id_rec );
				
				pav = mygtukasEdit.dataset.pav;
				salinimas( "Ar tikrai norite pašalinti šiuos duomenis? ", "Pašalinti " +  pav + "?", id_rec )	
			}
			
</script>
		<style>
			.table {
		background-color: #bec5cf;
		opacity: 0.8;
		
		}
        .header {
		background-color: #858b94;
		opacity: 0.9;
		width: 100%;
	}
	#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: black;
  color: white;
}
 label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
		</style>
<div class="container">

		<center><h1 style="color:#6291d9; font-size:40px"></h1>
		<form method="post" action="">	
		<table id="customers" class="table" align="center" cellpadding="5" cellspacing="5" border="1">
		
			<tr class="lent_virsus">
				<th style="text-align: center; vertical-align: middle;">Pavadinimas</th>
				<th style="text-align: center; vertical-align: middle;">Ypatybes</th>
				<th style="text-align: center; vertical-align: middle;">Id_punkto1</th>
				<th style="text-align: center; vertical-align: middle;">Id_punkto2</th>
				<th colspan=2></th>
			</tr>

<%		try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}
	
	try { 
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		String add; 
		String id_marsrutu_atkarpos = "0";
		id_marsrutu_atkarpos = request.getParameter( "id_marsrutu_atkarpos" );
		
		add = request.getParameter("add");
		
		
		if ( ( (  add  ) != null ) && add.equals ( "ivesti" ) ) {
			
	
			for ( int i = 0; i< lent_marsrutu_atkarpos.length; i++ ) {
			
				lauk_marsrutu_atkarpos [ i ] = request.getParameter ( lent_marsrutu_atkarpos [ i ] );
			}
			
			
			if ( ( id_marsrutu_atkarpos == null ) || ( id_marsrutu_atkarpos.equals("0" ) ) ){ 
			
					atkarpos_crud.ivesti ( lauk_marsrutu_atkarpos );
			
			
			} else {
				
					atkarpos_crud.update ( lauk_marsrutu_atkarpos, id_marsrutu_atkarpos );
				}
			
		 } else {
		 
			if ( add != null ) {

			}
		 } 
			
		String del = "";
		
		if ( ( (  del = request.getParameter("del" ) ) != null) && del.equals ( "del1rec" ) ) {		

			atkarpos_crud.delete ( id_marsrutu_atkarpos );
		}	
		
		statement_take = connection.createStatement();		
		String sql ="SELECT * FROM `marsrutu_atkarpos`  WHERE 1";

		resultSet = statement_take.executeQuery(sql);
	 
		} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
<%=atkarpos_crud.lentele()%> 					
</table>

</form>
<form id="del_rec" method="post" action="">
<input type="hidden" name="del" value="del1rec" >
<input type="hidden" id="m_del" name="id_marsrutu_atkarpos" value="0">
</form>

<div id="dialog-form" title="Pridėti kitas maršrutų atkarpas">
  <p class="validateTips">Būtina užpildyti visus laukelius</p>
 
  <form id="lentele" method="post">
    <fieldset>
		<label for="pav">Pavadinimas</label>
		<input type="text" name="pav" id="pav" value="" class="text ui-widget-content ui-corner-all">
		<label for="name">Ypatybes</label>
		<input type="text" name="ipatybes" id="ipatybes" value="" class="text ui-widget-content ui-corner-all">
		<label for="name">id_punkto1</label>
		<select name="id_punkto1" id="id_punkto1">
						<%
						try {
						Statement st = connection.createStatement();
						String sql = "SELECT * FROM `punktai`";
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
		<label for="name">id_punkto2</label>
		<select name="id_punkto2" id="id_punkto2">
						<%
						try {
						Statement st = connection.createStatement();
						String sql = "SELECT * FROM `punktai`";
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
		<input type="hidden" name="add" value="ivesti">
		<input type="hidden" id="id_marsrutu_atkarpos" name="id_marsrutu_atkarpos" value="0">
	
		<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>

	<center><button id="create-user">Pridėti</button>

    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>
</html>
