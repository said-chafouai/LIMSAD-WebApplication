<!DOCTYPE html>
<html lang="en">

<head>

	<title> Brevet/Droit d'auteur  </title>
    <!-- inclusion Generale ############################################################"" -->
    
    		<c:import url="include/headInclude.jsp"></c:import>
    
    <!-- ################################################################################ -->

    <style type="text/css">

	  	label{
	  		padding: 7px;
	  	}
    </style>

</head>

<body>

<c:choose>
<c:when test="${sessionScope.etatSession==true}">

    <div id="wrapper">


        <!-- Menu inclusion ############################################################-->
        <c:choose>
        	<c:when test="${!empty sessionScope.role }">
        		<c:import url="include/menuDirecteurInclude.jsp"/>
        	</c:when>
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
                        <h1 class="page-header"><i class="fa fa-user fa-fw"></i>Profil</h1>
                        <ul class="nav nav-pills">
							<p>
								<a href="#visulaiser" data-toggle="tab" class="btn btn-primary">Visualiser</a>
								<a href="#modifier" data-toggle="tab" class="btn btn-warning">Modifier</a>
							</p>
						</ul>
						<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane fade in active table-responsive" id="visulaiser">
										<table class="table table-bordered">
											<tr>
												<th>Nom</th>
												<th>Prénom</th>
												<th>email</th>
												<th>GSM</th>
												<th>mot de passe</th>
											</tr>
											<tr>
												<td><c:out value="${sessionScope.nom}"/></td>
												<td><c:out value="${sessionScope.prenom}"/></td>
												<td><c:out value="${sessionScope.email}"/></td>
												<td><c:out value="${sessionScope.gsm}"/></td>
												<td><c:out value="${sessionScope.mdp}"/></td>
											</tr>
										</table>
									</div>
									<div class="tab-pane fade" id="modifier">
										<form id="formMdifier" class="form-horizontal" method="post" action="profil">
											<div class="well">
												<div class="form-group">
													<label class="col-sm-3" for="mdp">Mot de passe<font color="red">*</font></label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="mdp" id="mdp"/>
													</div>
												</div>
								
												<div class="form-group">
													<label class="col-sm-3" for="confMdp">Confirme Mot de passe<font color="red">*</font></label>
													<div class="col-sm-9">
														<input type="text" class="form-control" name="confMdp" />
													</div>
												</div>
												<div class="form-group" style="padding-right:16px">
													<button class="btn btn-warning pull-right">Modifier</button>
												</div>
											</div>
										</form>
									</div>
								</div>
								<!-- /.panel-body -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

<!-- Footer inclusion ############################################################-->

        <c:import url="include/footerInclude.jsp"></c:import>
        
<!-- ################################################################################ -->
	<c:if test="${!empty confirmation }">
		<script>
			alert("votre changement va étre pris en consédiration dans la prochaine connexion");
		</script>
	
	</c:if>

        <script>
            $( document ).ready( function () {
                $( "#formMdifier" ).validate( {
                    rules: {
                        mdp : "required",
                        confMdp : {
                        	required : true,
                        	equalTo: "#mdp"
                        }
                    },
                    messages: {
                        mdp : "champ requis",
                        confMdp: {
							required: "champ requis",
							equalTo: "SVP entrez le mème mot de passe"
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
