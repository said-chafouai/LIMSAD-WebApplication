<!DOCTYPE html>
<html lang="en">

<head>

<title>Communication dans une conference</title>
<!-- inclusion Generale ############################################################"" -->

<c:import url="include/headInclude.jsp"></c:import>

<!-- ################################################################################ -->

</head>

<body>

	<c:choose>
		<c:when test="${sessionScope.etatSession==true}">
			<c:if test="${empty sessionScope.role}">
				<jsp:forward page="accueil.jsp" />
			</c:if>

			<div id="wrapper">

				<!-- Menu inclusion ############################################################-->

				<c:import url="include/menuDirecteurInclude.jsp" />

				<!-- ################################################################################ -->
				
				<!-- Les alertes de r�ussite ou succes -->
				
				<c:if test="${etat==true }">
					<script type="text/javascript" >alert("demande accepte");</script>
				</c:if>
				<c:if test="${etat==false}">
					<script type="text/javascript" >alert("malheureusement (-_-) on a pas pu envoyer l'email de validation merci de r�essayer plus tard ");</script>
				</c:if> 
				
				<!-- Fin alerte -->

				<!-- Page Content -->
				<div id="page-wrapper">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<h1 class="page-header">
									<i class="fa fa-bell fa-fw"></i> Notifications
								</h1>
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
									<li class="active"><a href="#indexe" data-toggle="tab">Nouvelle activit�</a></li>
									<li><a href="#nonIndexe" data-toggle="tab">Nouvelle demande d'inscription</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane fade in active" id="indexe">
										<br>	
										<c:if test="${!empty ouvrageExiste }">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<i class="fa fa-file-text fa-fw"></i> Ouvrages
												</div>
												<div class="panel-body">
													<form action="notificationDirecteur" method="post">
														<input type="hidden" name="form" value="ouvrage">
														<div class="table-responsive">
															<table class="table table-bordered">
																<tr>
																	<th>#</th>
																	<th>Declarant</th>
																	<th>intitule</th>
																	<th>ISSN</th>
																	<th>ISBN</th>
																	<th>DATE</th>
																	<th>acteur(s) Externe(s)</th>
																	<th>Preuve</th>
																	<th>Etat</th>
																</tr>
																<c:forEach items="${ouvragesAttentes}"
																	var="ouvrageAttente">
																	<tr>
																		<td><input type="checkbox" name="activiteChoisit" value="${ouvrageAttente.id}"></td>
																		<td>${ouvrageAttente.declarant}</td>
																		<td>${ouvrageAttente.intitule}</td>
																		<td>${ouvrageAttente.issn}</td>
																		<td>${ouvrageAttente.isbn}</td>
																		<td>${ouvrageAttente.dateOuvrage}</td>
																		<td>${ouvrageAttente.acteurExterne}</td>
																		<td><a href="http://localhost:8181/pfe/fichiers/${ouvrageAttente.preuve}">T�l�charger</a></td>						
																		<td><font color="red">En Attente</font></td>
																	</tr>
																</c:forEach>
															</table>
														</div>
														<div class="form-group">
															<button class="btn btn-danger pull-right" name="choix" value="rejeter">Rejeter</button>
															<button class="btn btn-success pull-right" name="choix" value="valider" style="margin-right: 10px">Valider</button>
														</div>
													</form>
												</div>
											</div>
										</c:if>
										<c:if test="${!empty brevetExiste }">
											<div class="panel panel-info">
												<div class="panel-heading">
													<i class="fa fa-file-text fa-fw"></i> Brevet/Droit d'auteur
												</div>
												<div class="panel-body">
													<form action="notificationDirecteur" method="post">
														<input type="hidden" name="form" value="brevetDroit">
														<div class="table-responsive table-condensed">
															<table class="table table-bordered table-condensed">
																<tr>
																	<th>#</th>
																	<th>Declarant</th>
																	<th>intitule</th>
																	<th>type</th>
																	<th>N� de d�pot</th>
																	<th>date</th>
																	<th>Acteur(s) externe(s)</th>
																	<th>Preuve</th>
																	<th>Etat</th>
																</tr>
																<c:forEach items="${brevetsDroitsAttentes}"
																	var="brevetDroit">
																	<tr>
																		<td><input type="checkbox" name="activiteChoisit" value="${brevetDroit.id_brevet}"></td>
																		<td>${brevetDroit.declarant}</td>
																		<td>${brevetDroit.intitule}</td>
																		<td>${brevetDroit.type }</td>
																		<td>${brevetDroit.numeroDepot}</td>
																		<td>${brevetDroit.dateDepot}</td>
																		<td>${brevetDroit.acteurexterne}</td>
																		<td><a href="http://localhost:8181/pfe/fichiers/${brevetDroit.preuve}">T�l�charger</a></td>
																		<td><font color="red">En Attente</font></td>
																	</tr>
																</c:forEach>
															</table>
														</div>
														<div class="form-group">
															<button class="btn btn-danger pull-right" name="choix" value="rejeter">Rejeter</button>
															<button class="btn btn-success pull-right" name="choix" value="valider" style="margin-right: 10px">Valider</button>
														</div>
													</form>
												</div>
											</div>
										</c:if>
									</div>
									<div class="tab-pane fade" id="nonIndexe">
										<br>


										<div class="panel panel-primary">
											<div class="panel-heading">
												<i class="fa fa-group  fa-fw"></i> Doctorant(s)
											</div>
											<div class="panel-body">
												<form action="notificationDirecteur" method="post" id="formdoc">
													<input type="hidden" name="form" value="doctorant">
													<div class="table-responsive">
														<table class="table table-bordered">
															<tr>
																<th>#</th>
																<th>Nom Prenom</th>
																<th>Email</th>
																<th>GSM</th>
																<th>Encadrant</th>
																<th>Sujet de la th�ses</th>
																<th>Equipe</th>
															</tr>
															<c:forEach items="${utilisateurs}" var="utilisateur">
																<c:if test="${utilisateur.encadrant==0 and !empty utilisateur.cne and utilisateur.etat==false}">
																	<tr>
																		<td><input type="radio" name="user" value="${utilisateur.login}"></td>
																		<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
																		<td>${utilisateur.email}</td>
																		<td>${utilisateur.gsm}</td>
																		<td></td>
																		<td></td>
																		<td></td>
																	</tr>
																</c:if>
															</c:forEach>
														</table>
													</div>
													<div class="form-group">
														<button class="btn btn-danger pull-right" name="choix" value="rejeter">Rejeter</button>
														<button class="btn btn-success pull-right" name="choix" value="valider" style="margin-right: 10px">Accepter</button>
													</div>
												</form>
											</div>
										</div>
										<div class="panel panel-info">
											<div class="panel-heading">
												<i class="fa fa-group  fa-fw"></i> Enseignat(s) Chercheur(s)
											</div>
											<div class="panel-body">
												<form action="notificationDirecteur" method="post">
													<input type="hidden" name="form" value="enseignant">
													<div class="table-responsive">
														<table class="table table-bordered">
															<tr>
																<th>#</th>
																<th>Nom Prenom</th>
																<th>Email</th>
																<th>GSM</th>
																<th>Equipe</th>
															</tr>
															<c:forEach items="${utilisateurs}" var="utilisateur">
																<c:if test="${ !empty utilisateur.grade and utilisateur.etat==false and utilisateur.equipe==0}">
																	<tr>
																		<td><input type="radio" name="user" value="${utilisateur.login}"></td>
																		<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
																		<td>${utilisateur.email}</td>
																		<td>${utilisateur.gsm}</td>
																		<td></td>
																	</tr>
																</c:if>
															</c:forEach>
														</table>
													</div>
													<div class="form-group">
														<button class="btn btn-danger pull-right" name="choix" value="rejeter">Rejeter</button>
														<button class="btn btn-success pull-right" name="choix" value="valider" style="margin-right: 10px">Accepter</button>
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
				<c:set var="grade" value="pa"/>
				</div>
				<!-- /#wrapper -->
				</div>


				<!-- Footer inclusion ############################################################-->

				<c:import url="include/footerInclude.jsp"></c:import>

				<!-- ################################################################################ -->
		</c:when>
		<c:when test="${ empty sessionScope.etatSession}">
			<jsp:forward page="accueil.jsp" />
		</c:when>
	</c:choose>
	<script type="text/javascript">
		$(document).ready(function(){
			$('input:radio').click(function(){
				$('input:radio[name=user]').each(function(){
					$(this).parents('tr').find('td').eq(4).html("");
					$(this).parents('tr').find('td').eq(5).html("");
					$(this).parents('tr').find('td').eq(6).html("");

				})
				$('input:radio[name=user]:checked').each(function(){
					var nbColonne = $(this).parents('tr').find('td').length;
					
					// doctorant
					if(nbColonne == 7){
						$(this).parents('tr').find('td').eq(4).html("<div class='form-group'><select name='encadrant' class='form-control'>"+
								"<option value=''></option>"+
								"<c:forEach items='${utilisateurs}' var='utilisateur'>"+
								"<c:if test='${!empty utilisateur.grade and utilisateur.grade!=grade}'>"+
								"<option value='${utilisateur.login}'>${utilisateur.nom} ${utilisateur.prenom}</option>"+
								"</c:if>"+
								"</c:forEach>"+
							"</select></div>");
						$(this).parents('tr').find('td').eq(5).html("<div class='form-group'><input type='text' name='these' class='form-control'></div>");
						$(this).parents('tr').find('td').eq(6).html("<div class='form-group'><select name='equipe' class='form-control'>"+
								"<option value=''></option>"+
								"<c:forEach items='${equipes}' var='equipe'>"+
								"<option value='${equipe.id}'>${equipe.nom}</option>"+
								"</c:forEach>"+
							"</select></div>");
					
					}else{
						$(this).parents('tr').find('td').eq(4).html("<div class='form-group'><select name='equipe' class='form-control'>"+
								"<option value=''></option>"+
								"<c:forEach items='${equipes}' var='equipe'>"+
								"<option value='${equipe.id}'>${equipe.nom}</option>"+
								"</c:forEach>"+
							"</select></div>");
					}
					
					})
				
				});

		});
		

	</script>
	
	
	

</body>

</html>
