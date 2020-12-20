<!DOCTYPE html>
<html lang="en">

<head>

	<title> Manifestation  </title>
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
                        <h1 class="page-header"><i class="fa  fa-maxcdn fa-fw"></i>Manifestation</h1>
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
                            <li class="active" ><a href="#organisee" data-toggle="tab">Manifestation organiséé</a></li>
                            <li><a href="#participation" data-toggle="tab">Participation à l'organisation d'une manifestation</a></li>
                        </ul>

                            <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="organisee">
                                <br>
                                <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#ajouterorganisee">Ajouter/Annuler</button>
                                <div id="ajouterorganisee" class="collapse">
                                    <form id="formOrganisee" class="form-horizontal" method="post" action="manifestation">
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
                                               <label for="intitule">Intitule<font color="red">*</font></label> <input type="text" name="intitule" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="type">Type<font color="red">*</font></label>
                                                <select class="form-control" name="type" id="type" >
                                                    <option value=""></option>
                                                    <option value="type1">type1</option>
                                                    <option value="type2">type2</option>
                                                    <option value="type3">type3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="ville">Ville<font color="red">*</font></label><input type="text" name="ville" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <label for="date">date<font color="red">*</font></label><input type="date" name="date" class="form-control" > 
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
                            <div class="tab-pane fade" id="participation">
                                <br>
                                <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#ajouterparticipation">Ajouter/Annuler</button>
                                <div id="ajouterparticipation" class="collapse">
                                    <form id="formParticipation" class="form-horizontal" method="post" action="manifesation">
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
                                               <label for="intitule">Intitule<font color="red">*</font></label> <input type="text" name="intitule" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="type">Type<font color="red">*</font></label>
                                                <select class="form-control" name="type" id="type">
                                                    <option value=""></option>
                                                    <option value="type1">type1</option>
                                                    <option value="type2">type2</option>
                                                    <option value="type3">type3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="ville">Ville<font color="red">*</font></label><input type="text" name="ville" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <label for="date">date<font color="red">*</font></label><input type="date" name="date" class="form-control" > 
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
                $( "#formOrganisee" ).validate( {
                    rules: {
                        intitule : "required",
                        type : "required",
                        date : "required",
                        ville : "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        type : "champ requis",
                        date : "champ requis",
                        ville : "champ requis"
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
                $( "#formParticipation" ).validate( {
                    rules: {
                        intitule : "required",
                        type : "required",
                        date : "required",
                        ville : "required",
                        pays : "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        type : "champ requis",
                        date : "champ requis",
                        ville : "champ requis",
                        pays : "champ requis"
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
