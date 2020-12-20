<!DOCTYPE html>
<html lang="en">

<head>

	<title> Projet/Contrat finané  </title>
    <!-- inclusion Generale ############################################################"" -->
    
    		<c:import url="include/headInclude.jsp"></c:import>
    
    <!-- ################################################################################ -->
    <style type="text/css">
        tr ,th{
            text-align: center;
        }
    </style>


</head>

<body>

<c:choose>
<c:when test="${sessionScope.etatSession==true}">

		<c:if test="${ !empty sessionScope.role}">
			<jsp:forward page="accueil.jsp"/>
		</c:if>

    <div id="wrapper">


        <!-- Menu inclusion ############################################################-->
        <c:choose>
        	<c:when test="${!empty sessionScope.grade }">
        		<c:import url="include/menuUtilisateurInclude.jsp"/>
        	</c:when>
        	<c:when test="${empty sessionScope.grade }">
        		<c:import url="include/menuDoctorantInclude.jsp"/>
        	</c:when>
        </c:choose>
        <!-- ################################################################################ -->

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><i class="fa fa-dollar fa-fw"></i>Projet/Contrat financé</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <div class="row">
                <div class="col-lg-12">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs  nav-justified">
                            <li class="active" ><a href="#national" data-toggle="tab">Projet/Contrat national financé</a></li>
                            <li><a href="#international" data-toggle="tab">Projet/Contrat international financé</a></li>
                        </ul>

                            <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="national">
                                <br>
                                <p><button type="button" class="btn btn-success" data-toggle="collapse" data-target="#ajouternational">Ajouter/Annuler</button></p>
                                <div id="ajouternational" class="collapse">
                                    <form id="formnational" class="form-horizontal" method="post" action="projetContrat">
                                        <div class="row">
                                            <div class="col-sm-offset-3 col-sm-6 ">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th></th>
                                                        <th>Nom Prenom</th>
                                                        <c:forEach items="${utilisateurs}" var="utilisateur">
														<c:if test="${!empty utilisateur.grade }">
														<tr>
															<td><input type="checkbox" name="${utilisateur.login}"></td>
															<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
														</tr>
														</c:if>
													</c:forEach>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div> 
                                        <div class="well">
                                            <div class="form-group">
                                               <label for="coordonnateurProjet">Coordonnateur du Projet<font color="red">*</font></label> <input type="text" name="coordonnateurProjet" class="form-control"  placeholder="Nom Prénom"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="intituleProjet">Intitulé du Projet<font color="red">*</font></label><input type="text" name="intituleProjet" class="form-control" required> 
                                            </div>
                                            <div class="form-group">
                                                <label for="codeReferenceProjet">Code/Reference du Projet<font color="red">*</font></label><input type="text" name="codeReferenceProjet" class="form-control" required> 
                                            </div>
                                            <div class="form-group">
                                               <label for="budgetDirham">Budget en Dirham<font color="red">*</font></label> <input type="text" name="budgetDirham" class="form-control"  placeholder="Exemple : 1000000"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="dateDebut">Date de début<font color="red">*</font></label> <input type="date" name="dateDebut" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                               <label for="organismesPartenaires">Organismes partenaires<font color="red">*</font></label> <input type="text" name="organismesPartenaires" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- Affichage des activite  -->
                                <!-- END affichage activite -->
                            </div>                           
                            <div class="tab-pane fade" id="international">
                                <br>
                                <p> <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#ajouterinternational">Ajouter/Annuler</button> </p>
                                <div id="ajouterinternational" class="collapse">
                                    <form id="forminternational" class="form-horizontal" method="post" action="projetContrat">
                                        <div class="row">
                                            <div class="col-sm-offset-3 col-sm-6 ">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th></th>
                                                        <th>Nom Prenom</th>
                                                        <c:forEach items="${utilisateurs}" var="utilisateur">
														<c:if test="${!empty utilisateur.grade }">
														<tr>
															<td><input type="checkbox" name="${utilisateur.login}"></td>
															<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
														</tr>
														</c:if>
													</c:forEach>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div> 
                                        <div class="well">
                                            <div class="form-group">
                                               <label for="coordonnateurProjet">Coordonnateur du Projet<font color="red">*</font></label> <input type="text" name="coordonnateurProjet" class="form-control"  placeholder="Nom Prénom"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="intituleProjet">Intitulé du Projet<font color="red">*</font></label><input type="text" name="intituleProjet" class="form-control" required> 
                                            </div>
                                            <div class="form-group">
                                                <label for="codeReferenceProjet">Code/Reference du Projet<font color="red">*</font></label><input type="text" name="codeReferenceProjet" class="form-control" required> 
                                            </div>
                                            <div class="form-group">
                                               <label for="budgetDirham">Budget en Dirham<font color="red">*</font></label> <input type="text" name="budgetDirham" class="form-control"  placeholder="Exemple : 1000000"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="pays">Pays<font color="red">*</font></label> <input type="text" name="pays" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="ville">Ville<font color="red">*</font></label> <input type="text" name="ville" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="dateDebut">Date de début<font color="red">*</font></label> <input type="date" name="dateDebut" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                               <label for="organismesPartenaires">Organismes partenaires<font color="red">*</font></label> <input type="text" name="organismesPartenaires" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
                                            </div>
                                        </div>
                                    </form>  
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

<!-- Footer inclusion ############################################################-->

        <c:import url="include/footerInclude.jsp"></c:import>
        
<!-- ################################################################################ -->


        <script>
            $( document ).ready( function () {
                $( "#formnational" ).validate( {
                    rules: {
                        coordonnateurProjet : "required",
                        intituleProjet : "required",
                        dateDebut: "required",
                        codeReferenceProjet : "required",
                        organismesPartenaires : "required",
                        budgetDirham : {
                        	required : true,
                        	number : true
                        }
                    },
                    messages: {
                        coordonnateurProjet : "champ requis",
                        intituleProjet : "champ requis",
                        dateDebut: "champ requis",
                        codeReferenceProjet : "champ requis",
                        organismesPartenaires : "champ requis",
                        budgetDirham : {
                        	required : "champ requis",
                    		number : "numero invalide"
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
                $( "#forminternational" ).validate( {
                    rules: {
                        coordonnateurProjet : "required",
                        intituleProjet : "required",
                        dateDebut: "required",
                        codeReferenceProjet : "required",
                        ville : "required",
                        pays : "required",
                        organismesPartenaires : "required",
                        budgetDirham : {
                        	required : true,
                        	number : true
                        }
                    },
                    messages: {
                        coordonnateurProjet : "champ requis",
                        intituleProjet : "champ requis",
                        dateDebut: "champ requis",
                        codeReferenceProjet : "champ requis",
                        ville : "champ requis",
                        pays : "champ requis",
                        organismesPartenaires : "champ requis",
                        budgetDirham : {
                        	required : "champ requis",
                    		number : "numero invalide"
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
        
</c:when>
<c:when test="${ empty sessionScope.etatSession}">
<jsp:forward page="accueil.jsp"/>
</c:when>
</c:choose>

</body>

</html>
