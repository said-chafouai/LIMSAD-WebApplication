<!DOCTYPE html>
<html lang="en">
<head>
	<title>Inscription</title>
<!-- inclusion Generale #################################################"" -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Laboratoire Imsad</title>

    <link href="presentation/css/bootstrap.min.css" rel="stylesheet">
    <link href="presentation/css/metisMenu.min.css" rel="stylesheet">
    <link href="presentation/css/accueilStyle.css" rel="stylesheet">
    <link href="presentation/css/sb-admin-2.css" rel="stylesheet">
    <link href="presentation/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- ################################################################################ -->
	<style type="text/css">
	  	.well
	  	{
	  		box-shadow: 0px 0px 18px #888888;
	  	}
	  	h4{
	  		padding: 10px;
	  	}
	  	h3{
	  		margin-top: 0px;
	  		margin-bottom: 30px;
	  	}
	  	[class*="col-"]{
	  		/*border : 1px solid black;*/
	  	}
	  	label{
	  		padding: 7px;
	  	}
	  	.bouton{
	  		padding-right: 16px;
	  	}

	  	.error {
      		color: #a94442;
   		}
	</style>
</head>
<body>
	<div class="container">
		<div align="center" class=" col-sm-12">
			<div class="col-sm-12 entete" align="center"> 
				<img class="img-responsive" src="presentation/img/logoFsac.png">
			</div>
			<h1> Bienvenue dans la page d'inscription de <br> <strong> <em> LIMSAD</em> </strong> </h1>
			<h4><font color="red">  *Vous étes sur le point de vous s'inscrire merci de remplire ces champs avec des informations correctes
			ou votre inscription sera rejeter*</font> </h4>	
		</div>
		<div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6 well">
			<form id="signupForm" method="post" class="form-horizontal" action="">
				<h3 align="center"> Inscrivez-Vous </h3>
				<p align="center"> <font color="red"><c:out value="${echec}"/></font></p>
				<div class="form-group">
					<label class="col-sm-3" for="nom">Nom </label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="nom" name="nom" placeholder="Exemple : chafouai" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3" for="prenom">Prenom</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="prenom" name="prenom" placeholder="Exemple : said" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3" for="email">Email</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="email" name="email" placeholder="Exemple : nomprenom123@gmail.com" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3" for="gsm">GSM</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="gsm" name="gsm" placeholder="Exemple : 0685967412" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3" for="adresse">Adresse</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="adresse" name="adresse" placeholder="Exemple : Boulvard ibno sina ..." />
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-3" for="fonction">Fonction</label>
					<div class="col-sm-9">
						<select name="fonction" id="fonction" class="form-control">
							<option value="">Choisissez...</option>
							<option value="enseignant" onclick="utilisateur()">Enseignant Chercheur</option>
							<option value="doctorant" onclick="doctorant()">Doctorant</option>
					</select>
					</div>
				</div>
				

				<div class="form-group" id="demo"></div>

				<div class="form-group">
					<div class="pull-right bouton">
						<button type="submit" class="btn btn-success" name="signup" value="Sign up">Inscription</button>
					</div>
				</div>

			</form>
		</div>
		<div align="center" class="col-sm-12">
			<footer>
				<h5> &copy;Tous droit résèrver au Groupe de PFE SMS </h5>
			</footer>
		</div>
	</div>

	    <script src="presentation/js/jquery-1.11.1.js"></script>
	    <script src="presentation/js/jquery.validate.js"></script>
	    <script src="presentation/js/bootstrap.min.js"></script>

	    <script>
			function utilisateur() {
				var xhttp = new XMLHttpRequest();
			  	xhttp.onreadystatechange = function() {
			    	if (this.readyState == 4 && this.status == 200) {
			      	document.getElementById("demo").innerHTML = this.responseText;
			    	}
			 	};

			  	xhttp.open("GET", "presentation/html/utilisateurs.html", true);
			  	xhttp.send();
			};

			function doctorant() {
			  	var xhttp = new XMLHttpRequest();
			  	xhttp.onreadystatechange = function() {
			    	if (this.readyState == 4 && this.status == 200) {
			      	document.getElementById("demo").innerHTML = this.responseText;
			    	}
			  	};

			  	xhttp.open("GET", "presentation/html/doctorant.jsp", true);
			  	xhttp.send();
			};


			$( document ).ready( function () {
				$( "#signupForm" ).validate( {
					rules: {
						grade : "required",
						fonction : "required",
						nom: "required",
						prenom: "required",
						gsm :{
							required : true,
							number : true,
							minlength : 10,
							maxlength : 10
						},
						cne: {
							required : true,
							number : true,
							minlength : 10,
							maxlength : 10
						},
						email: {
							required: true,
							email: true
						},
					},
					messages: {
						grade : "choisissez votre grade",
						fonction : "choisissez une fonction",
						nom: "SVP rensignez votre nom ",
						prenom: "SVP rensignez votre prenom",
						gsm :{
							required : "SVP saisissez votre numéro de tèlèphone",
							number : "numéro n'est pas valide",
							minlength : "un numéro valide doit comporte 10 chiffres",
							maxlength : "un numéro valide doit comporte 10 chiffres",
						},
						cne: {
							required : "SVP saisissez votre CNE",
							number : "CNE n'est pas valide",
							minlength : "un CNE valide doit comporte 10 chiffres",
							maxlength : "un CNE valide doit comporte 10 chiffres",

						},
						email: "email invalide"
					},
					errorElement: "em",
					errorPlacement: function ( error, element ) {
						// Add the `help-block` class to the error element
						error.addClass( "help-block" );

						if ( element.prop( "type" ) === "checkbox" ) {
							error.insertAfter( element.parent( "label" ) );
						} else {
							error.insertAfter( element );
						}
					},
					highlight: function ( element, errorClass, validClass ) {
						$( element ).parents( ".col-sm-9" ).addClass( "has-error" ).removeClass( "has-success" );
					},
					unhighlight: function (element, errorClass, validClass) {
						$( element ).parents( ".col-sm-9" ).addClass( "has-success" ).removeClass( "has-error" );
					}
				} );
			} );
		</script>
</body>
</html>