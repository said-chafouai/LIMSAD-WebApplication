<!DOCTYPE html>
<html lang="eng">
<head>
	<title>Accueil</title>
	<!-- inclusion Generale #################################################"" -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="presentation/css/bootstrap.min.css" rel="stylesheet">
    <link href="presentation/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- ################################################################################ -->
	<link rel="stylesheet" type="text/css" href="presentation/css/accueilStyle.css">
	<style type="text/css">


	</style>

</head>
<body>
	<div class="container">
		<div class="col-sm-12 entete" align="center"> <img class="img-responsive" src="presentation/img/logoFsac.png"></div>	
		<div align="center">
			<h2> Bienvenue dans la page d'accueil de la plate-forme du LIMSAD </h2>
			<hr>
		</div>
		<div  class="col-sm-12 container" id="connexion">
			<div align="center" class="col-sm-offset-4 col-sm-4 well">
				<form id="connectionForm" class="form-horizontal" id="formulaire" method="post" action="accueil">
					<div class="center-block">
                		<img class="profile-img" src="presentation/img/user1.png" alt="">
              		</div>
              		<div class="form-group">
						<h3>Connectez-Vous</h3>
					</div>
					<div class="form-group">
						<input type="email" name="email" class="form-control" placeholder="Email"  required>
					</div>
					<div class="form-group">
						<input type="password" name="mdp" class="form-control" placeholder="Mot de passe" required>
						<font color="red"><c:out value="${ message}"/></font>
					</div>
					<button class="btn btn-primary pull-right">Connexion</button>
				</form>
				<div class="form-group">
					<a href="inscription"><button class="btn btn-success pull-left">Inscription</button></a>
				</div>
			</div>	
		</div>
	</div>
	<div align="center" class="col-sm-12">
		<footer>
			<h5> &copy;Tous les droit sont r�serv�s au Groupe de PFE SMS </h5>
		</footer>
	</div>

	<script src="presentation/js/jquery-1.11.1.js"></script>
    <script src="presentation/js/jquery.validate.js"></script>
    <script src="presentation/js/bootstrap.min.js"></script>
    <script type="text/javascript">

			$( document ).ready( function () {
				$( "#connectionForm" ).validate( {
					rules: {
						mdp: {
							required: true
						},
						email: {
							required: true,
							email: true
						},
					},
					messages: {
						mdp: {
							required: "Mot de passe requis"
						},
						email: {
							required : "Email requis",
							email : "email invalide"
						}
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
						$( element ).parents( ".form-group" ).addClass( "has-error" ).removeClass( "has-success" );
					},
					unhighlight: function (element, errorClass, validClass) {
						$( element ).parents( ".form-group" ).addClass( "has-success" ).removeClass( "has-error" );
					}
				} );
			} );

    </script>


</body>
</html>