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
                        <form id="contact-form" action="surinkti_duomenys.php" method="POST">
                            <div class="form-group mb-4">
                                <input type="text" name="pavadinimas" class="form-control" placeholder="Pavadinimas" required="" /></p>
                            </div>
                            <div class="form-group mb-4">
                                <input type="datetime" name="data"  class="form-control" placeholder="Data" required="" />
                            </div>
							<div class="form-group mb-4">
                                <input type="time" name="laikas" class="number" placeholder="Laikas" required="" />
                            </div>
							<div class="form-group mb-4">
                                <input type="text" name="trukme" class="form-control" placeholder="Trukmė" required="" />
                            </div>
                            <div class="form-group mb-5">
                                <textarea rows="6" input type="text" name="aprasymas" class="form-control" placeholder="Aprašymas..." required=""></textarea>
                            </div>
                            <div class="text-right">
                                <input type="submit" value="Patvirtinti" class="btn btn-big btn-primary"></button>
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

    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.backstretch.min.js"></script>
    <script src="../js/templatemo-script.js"></script>
</body>
</html>