<!DOCTYPE html>
<html lang="en">

<head>

	<title>Ouvrage</title>
	<!-- inclusion Generale ############################################################"" -->
	
	<c:import url="include/headInclude.jsp"></c:import>
	
	<!-- ################################################################################ -->


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
						<c:import url="include/menuUtilisateurInclude.jsp" />
					</c:when>
					<c:when test="${empty sessionScope.grade }">
						<c:import url="include/menuDoctorantInclude.jsp" />
					</c:when>
				</c:choose>
				<!-- ################################################################################ -->

				<!-- Page Content -->
				<div id="page-wrapper">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<h1 class="page-header">
									<i class="fa fa-file-text fa-fw"></i>Ouvrage
								</h1>
								<!-- Nav tabs -->
								
								<ul class="nav nav-pills">
									<p>
										<a href="#visulaiser" data-toggle="tab" class="btn btn-primary">Visualiser</a>
										<a href="#ajouter" data-toggle="tab" class="btn btn-success">Ajouter</a>
										<a href="#modifier" data-toggle="tab" class="btn btn-warning">Modifier</a>
										<a href="#supprimer" data-toggle="tab" class="btn btn-danger">Supprimer</a>
									</p>
								</ul>
								

								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane fade in active table-responsive" id="visulaiser">
										<table class="table table-bordered">
											<tr>
												<th>intitule</th>
												<th>maison d'�dition</th>
												<th>ISSN</th>
												<th>ISBN</th>
												<th>DATE</th>
												<th>Acteur(s) externe(s)</th>
												<th>Etat</th>
											</tr>
											<c:forEach items="${ouvragesAttentes}" var="ouvrageAttente">
												<tr>
													<td>${ouvrageAttente.intitule}</td>
													<td>${ouvrageAttente.maisonEdition}</td>
													<td>${ouvrageAttente.issn}</td>
													<td>${ouvrageAttente.isbn}</td>
													<td>${ouvrageAttente.dateOuvrage}</td>
													<td>${ouvrageAttente.acteurExterne}</td>
													<td><font color="red">En Attente</font></td>
												</tr>
											</c:forEach>
											<c:forEach items="${ouvragesValiders}" var="ouvrageValider">
                                                <tr>
                                                    <td>${ouvrageValider.intitule}</td>
                                                    <td>${ouvrageValider.maisonEdition}</td>
                                                    <td>${ouvrageValider.issn}</td>
                                                    <td>${ouvrageValider.isbn}</td>
                                                    <td>${ouvrageValider.dateOuvrage}</td>
                                                    <td>${ouvrageValider.acteurExterne}</td>
                                                    <td><font color="#449d44">Valider</font></td>
                                                </tr>
                                            </c:forEach>
										</table>
									</div>
									<div class="tab-pane fade" id="ajouter">
										<form id="formAjouter" class="form-horizontal" method="post" action="upload" enctype="multipart/form-data">
											<input type="hidden" name="choix" value="ouvrage">
											<div class="row">
												<div class="col-sm-offset-3 col-sm-6 ">
													<table class="table table-bordered">
														<tr>
															<th></th>
															<th>Nom Prenom</th>
															<c:forEach items="${utilisateurs}" var="utilisateur">
															<c:if test="${!empty utilisateur.grade }">
																<c:if test="${ utilisateur.login != sessionScope.login}">
																	<tr>
																		<td><input type="checkbox" name="participant" value="${utilisateur.login}"></td>
																		<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
																	</tr>
																</c:if>
															</c:if>
														</c:forEach>
														</tr>
													</table>
												</div>
											</div>
											<div class="well">
												<div class="form-group">
													<label for="auteur">Auteur(s)</label> <input type="text"
														name="auteur" class="form-control"
														placeholder="Nom1 Prenom1 , Nom2 prenom2 , ...">
												</div>
												<div class="form-group">
													<label for="preuve">Preuve (format accepte pdf, png , jpg , jpeg)</label> <input type="file"
														name="fichier" class="">
												</div>
												
												<div class="form-group">
													<label for="intitule">Intitule<font color="red">*</font></label>
													<input type="text" name="intitule" class="form-control">
												</div>
												<div class="form-group">
													<label for="maisonEdition">Maison d'�dition<font
														color="red">*</font></label> <input type="text"
														name="maisonEdition" class="form-control">
												</div>
												<div class="form-group">
													<label for="date">date<font color="red">*</font></label><input
														type="date" name="date" class="form-control">
												</div>
												<div class="form-group">
													<label for="issn">ISSN<font color="red">*</font></label> <input
														type="text" name="issn" class="form-control">
												</div>
												<div class="form-group">
													<label for="isbn">ISBN<font color="red">*</font></label> <input
														type="text" name="isbn" class="form-control">
												</div>
												<div class="form-group">
													<button class="btn btn-success pull-right">Enregistrer</button>
												</div>
											</div>
										</form>
									</div>
									<div class="tab-pane fade" id="modifier">
										<div class="table-responsive">
											<table class="table table-bordered">
												<tr>
													<th>#</th>
													<th>intitule</th>
													<th>Maison d'�dition</th>
													<th>ISSN</th>
													<th>ISBN</th>
													<th>DATE</th>
													<th>acteur(s) Externe(s)</th>
												</tr>
												<c:forEach items="${ouvragesAttentes}" var="ouvrageAttente">
												<tr>
													<td><input type="radio" name="ouvrageModifier" value="${ouvrageAttente.id}"></td>
													<td>${ouvrageAttente.intitule}</td>
													<td>${ouvrageAttente.maisonEdition }</td>
													<td>${ouvrageAttente.issn}</td>
													<td>${ouvrageAttente.isbn}</td>
													<td>${ouvrageAttente.dateOuvrage}</td>
													<td>${ouvrageAttente.acteurExterne}</td>
												</tr>
												</c:forEach>
											</table>
										</div>
										<form id="formMdifier" class="form-horizontal" method="post" action="ouvrage">
											
										</form>
									</div>
									<div class="tab-pane fade" id="supprimer">
										<form id="formSupprimer" class="form-horizontal" method="post" action="ouvrage">
											<input type="hidden" name="formOuvrage" value="supprimer">
											<table class="table table-bordered">
												<tr>
													<th></th>
													<th>intitule</th>
													<th>ISSN</th>
													<th>ISBN</th>
													<th>DATE</th>
												</tr>
												<c:forEach items="${ouvragesAttentes}" var="ouvrageAttente">
												<tr>
													<td><input type="radio" name="ouvrageSupprimer" value="${ouvrageAttente.id}"></td>
													<td>${ouvrageAttente.intitule}</td>
													<td>${ouvrageAttente.issn}</td>
													<td>${ouvrageAttente.isbn}</td>
													<td>${ouvrageAttente.dateOuvrage}</td>
												</tr>
												</c:forEach>
											</table>
											<div class="form-group" style="padding-right:16px">
													<button class="btn btn-danger pull-right">Supprimer</button>
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

        <script>
            $( document ).ready( function () {
                $( "#formAjouter" ).validate( {
                    rules: {
                        intitule : "required",
                        maisonEdition : "required",
                        date: "required",
                        issn : "required",
                        isbn : "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        maisonEdition : "champ requis",
                        date: "champ requis",
                        issn : "champ requis",
                        isbn : "champ requis"
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
                
                $( "#formMdifier" ).validate( {
                    rules: {
                        intitule : "required",
                        maisonEdition : "required",
                        date: "required",
                        issn : "required",
                        isbn : "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        maisonEdition : "champ requis",
                        date: "champ requis",
                        issn : "champ requis",
                        isbn : "champ requis"
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
            
            $(document).ready(function(){

    			$('input:radio').click(function(){
    				$('input:radio[name=ouvrageModifier]:checked').each(function(){
    					var tr = $(this).parents('tr').find('td').length;
    					var tab = new Array();
    					for (var i = 1; i < tr; i++) 
    						tab[i] = $(this).parents('tr').find('td').eq(i).html();   						
    					
    					$('#formMdifier').html("<input type='hidden' name='formOuvrage' value='modifier'><div class='row'>"+
    							"<div class='col-sm-offset-3 col-sm-6 '>"+
    							"<table class='table table-bordered'>"+
    								"<tr>"+
    									"<th></th>"+
    									"<th>Nom Prenom</th>"+
    									"<c:forEach items='${utilisateurs}' var='utilisateur'>"+
    									"<c:if test='${!empty utilisateur.grade }'>"+
    										"<c:if test='${ utilisateur.login != sessionScope.login}'>"+
    											"<tr>"+
    												"<td><input type='checkbox' name='${utilisateur.login}'></td>"+
    												"<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>"+
    											"</tr>"+
    										"</c:if>"+
    									"</c:if>"+
    								"</c:forEach>"+
    								"</tr>"+
    							"</table>"+
    						"</div>"+
    						"</div>"+
    						"<div class='well'>"+
    							"<input type='hidden' name='idOuvrage' value="+$('input:radio[name=ouvrageModifier]:checked').val()+">"+
    							"<div class='form-group'>"+
    								"<label for='auteur'>Auteur(s)</label>"+
    								"<input type='text' name='auteur' class='form-control' value="+tab[6]+">"+
    							"</div>"+
    							"<div class=''>"+
    								"<div class='form-group'>"+
    									"<label for='intitule'>Intitule<font color='red'>*</font></label>"+
    									"<input type='text' name='intitule' class='form-control' value="+tab[1]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									"<label for='maisonEdition'>Maison d'�dition<font color='red'>*</font></label>"+ 
    									"<input type='text' name='maisonEdition' class='form-control' value="+tab[2]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									"<label for='date'>date<font color='red'>*</font></label>"+
    									"<input type='date' name='date' class='form-control' value="+tab[5]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									"<label for='issn'>ISSN<font color='red'>*</font></label>"+
    									"<input type='text' name='issn' class='form-control' value="+tab[3]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									"<label for='isbn'>ISBN<font color='red'>*</font></label>"+
    									"<input type='text' name='isbn' class='form-control' value="+tab[4]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									"<button class='btn btn-success pull-right'>Enregistrer</button>"+
    								"</div>"+
    							"</div>"+
    						"</div>");

    				})

    			});
    		});
            
            
            
            
            
        </script>
        
</c:when>
<c:when test="${ empty sessionScope.etatSession}">
<jsp:forward page="accueil.jsp"/>
</c:when>
</c:choose>

</body>

</html>
