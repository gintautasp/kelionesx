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
    <style>
		table {

			border-collapse: collapse;

		}
		 input {

			color:black;
			background: linear-gradient(to top right, #00ffff 0%, #3366ff 100%);

		}
		th {

			background-color: none;
		}
		h1 {
			font-family: "Arial Black";
			padding: 5px; 
			color: black;
			font-size: 20px;
		}
			
		input [type='submit'], button, [aria-label]{
			cursor: pointer;
		}
		
		#edit-box{
			
			max-width: 80%;
			margin: auto;
			margin-top:10px;
		}
		
	</style>

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
								<li class="nav-item active">
                                    <a class="nav-link tm-nav-link" href="../keliones_punktu_tipai">Punktų tipai <span class="sr-only">(current)</span></a>
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

		<div class="centriukas">
			<div class="title">
				
				<h1>Punktu tipai</h1>
				<p>Punktu tipai:</p>
			</div>
			<div class="form">
				<form action="javascript:void(0);" method="POST" onsubmit="app.Add()">
				<input type="text" id="add-punktu_tipas" placeholder="Punktu_tipai">
				<input type="submit" value="Add" class="btn btn-primary">
			</form>
				<p>Punktu tipai</p>
				<p id="counter"></p>
				<table>
					<tr class="punktu_tipai">
					<th><h6>Punktu tipai:</h6></th>
					</tr>
					<tbody id="tasks">
					</tbody>
				</table>
		</div>
		<div id="edit-box" role="arial-hidden">
			<form action="javascript:void(0);" method="POST" id="save-edit">
				<input type="text" id="edit-punktu_tipas">
				<input type="submit" value="Save" class="btn btn-succes">
				<a onclick="CloseInput()" arial-label="Close">&#10006;</a>
			</form>
				
					
				
		</div>
    </div>

    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>
</html>