<!DOCTYPE html>
<html lang="en">

<head>

<title>Evenements</title>
<!-- inclusion Generale ############################################################"" -->

<c:import url="include/headInclude.jsp"></c:import>

<!-- ################################################################################ -->
<link href="presentation/css/timeLine.css" rel="stylesheet" type="text/css">

<style type="text/css">
 th, tr{
 text-align:center;
 }
 
 th{
 background-color:#f5f5f5;
 }

</style>

</head>

<body>
	<c:if test="${reussit}">

		<script type="text/javascript">
			alert("l'Evenement a été déclarer!")
		</script>

	</c:if>
	<c:if test="${modificationreussit}">

		<script type="text/javascript">
			alert("l'Evenement a été Modifié!")
		</script>

	</c:if>





	<c:choose>
		<c:when test="${sessionScope.etatSession==true}">
			<c:if test="${empty sessionScope.role}">
				<jsp:forward page="accueil.jsp" />
			</c:if>

			<div id="wrapper">

				<!-- Menu inclusion ############################################################-->

				<c:import url="include/menuDirecteurInclude.jsp" />

				<!-- ################################################################################ -->

				<!-- Page Content -->
				<div id="page-wrapper">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<h1 class="page-header">
									<i class="fa fa-calendar fa-fw"></i> Evenements
								</h1>
								<ul class="nav bouton">
									<p>
										<a href="#visulaisez" data-toggle="tab"
											class="btn btn-primary">Visualiser</a> <a
											href="#ajouterEvenement" data-toggle="tab"
											class="btn btn-success">Ajouter</a> <a
											href="#modifierEvenement" data-toggle="tab"
											class="btn btn-warning">Modifier</a> <a
											href="#supprimerevenement" data-toggle="tab"
											class="btn btn-danger">Supprimer</a>
									</p>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane fade in active" id="visulaisez">
										<br>
										<div class="container-fluid">



											<c:set var="vari" value="0" scope="request" />
											<c:forEach var="even" items="${evenements}">

												<ul class="timeline">

													<c:choose>
														<c:when test="${requestScope.vari==0 }">
															<li>
																<div class="timeline-badge">
																	<c:choose>

																		<c:when test="${even.type==Soutenance}">
																			<i class="fa fa-graduation-cap"></i>
																		</c:when>
																		<c:when test="${even.type==Entretien}">
																			<i class=" fa fa-music"></i>
																		</c:when>
																		<c:when test="${even.type==Forum}">
																			<i class=" fa fa-globe"></i>
																		</c:when>
																		<c:when test="${even.type==Conference}">
																			<i class=" fa fa-university"></i>
																		</c:when>
																		<c:when test="${even.type==Reunion}">
																			<i class=" fa fa-calendar-o"></i>
																		</c:when>
																		<c:otherwise>
																			<i class="fa fa-check"></i>
																		</c:otherwise>

																	</c:choose>

																</div>


																<div class="timeline-panel">

																	<div class="timeline-heading">
																		<h4 class="timeline-title">
																			<c:out value=" ${even.titre }" />
																		</h4>
																		<p>
																			<small class="text-muted"><i
																				class="fa fa-clock-o"></i> <c:out
																					value=" ${even.date }" /></small>
																		</p>
																	</div>

																	<div class="timeline-body">
																		<p>
																			<c:out value=" ${even.message }" />
																		</p>
																	</div>
																</div> <c:set var="vari" value="1" scope="request" />

															</li>
														</c:when>

														<c:when test="${requestScope.vari==1 }">


															<li class="timeline-inverted">
																<div class="timeline-badge warning">
																	<c:choose>

																		<c:when test="${even.type==Soutenance}">
																			<i class="fa fa-graduation-cap"></i>
																		</c:when>
																		<c:when test="${even.type==Entretien}">
																			<i class=" fa fa-music"></i>
																		</c:when>
																		<c:when test="${even.type==Forum}">
																			<i class=" fa fa-globe"></i>
																		</c:when>
																		<c:when test="${even.type==Conference}">
																			<i class=" fa fa-university"></i>
																		</c:when>
																		<c:when test="${even.type==Reunion}">
																			<i class=" fa fa-calendar-o"></i>
																		</c:when>
																		<c:otherwise>
																			<i class="fa fa-check"></i>
																		</c:otherwise>

																	</c:choose>
																</div>
																<div class="timeline-panel">
																	<div class="timeline-heading">
																		<h4 class="timeline-title">
																			<c:out value=" ${even.titre }" />
																		</h4>

																		<p>
																			<small class="text-muted"><i
																				class="fa fa-clock-o"></i> <c:out
																					value=" ${even.date }" /></small>
																		</p>
																	</div>
																	<div class="timeline-body">
																		<p>
																			<c:out value=" ${even.message }" />
																		</p>
																	</div>
																</div> <c:set var="vari" value="0" scope="request" />
															</li>
														</c:when>
													</c:choose>


												</ul>
											</c:forEach>
										</div>
										<!-- Affichage des activite  -->
										<!-- END affichage activite -->
									</div>
									<!-- Ajout des activite  -->
									<div class="tab-pane fade" id="ajouterEvenement">
										<br>
										<div>
											<form id="formEvenement" class="form-horizontal"
												method="post" action=" evenement">
												<input type="hidden" name="cacher" value="ajouter">
												<div class="well">
													<div class="form-group">
														<label for="titre">Titre<font color="red">*</font></label>
														<input type="text" name="titre" class="form-control">
													</div>
													<div class="form-group">
														<label for="type">Type<font color="red">*</font></label> <select
															class="form-control" name="type">
															<option value=""></option>
															<option value="Soutenance">Soutenance</option>
															<option value="Entretien">Entretien</option>
															<option value="Forum">Forum</option>
															<option value="Conference">Conference</option>
															<option value="Reunion">Reunion</option>
															<option value="Autre">Autre</option>
														</select>
													</div>
													<div class="form-group">
														<label for="autre">autre type</label> <input type="text"
															name="autre" class="form-control">
													</div>
													<div class="form-group">
														<label for="message">Message<font color="red">*</font></label>
														<textarea class="form-control" name="message"></textarea>
													</div>
													<div class="form-group">
														<label for="date">date<font color="red">*</font></label> <input
															type="date" name="dateEvenement" class="form-control">

													</div>
													<div class="form-group">
														<button class="btn btn-success pull-right">Enregistrer</button>
													</div>
												</div>
											</form>
										</div>
									</div>
									<!--  End Ajout des evenements  -->
									<!--  Supprimer evenement  -->
									<div class="tab-pane fade" id="supprimerevenement">




										<br>

										<form id="formEvenement" class="form-horizontal" method="Post"
											action="evenement">
											<input type="hidden" name="cacher" value="supprimer" />
											<div class="table-responsive">
												<table class="table table-responsive table-bordered ">
													<thead>
														<tr>
															<th>#</th>
															<th>Titre d'evenement</th>
															<th>Date d'evenement</th>
															<th>Type d'evenement</th>
															<th>Message</th>

														</tr>

													</thead>
													<tbody>
														<c:forEach var="even" items="${evenements}">
															<tr>
																<td><input type="checkbox" name="evenementSupprime"
																	value="${even.id_evenement}"></td>
																<td><c:out value="${even.titre }" /></td>
																<td><c:out value="${even.date }" /></td>
																<td><c:out value="${even.type }" /></td>
																<td><c:out value="${even.message }" /></td>

															</tr>


														</c:forEach>
													</tbody>

												</table>
											</div>
											<button class="btn btn-danger pull-right">Supprimer</button>
										</form>


										<!--  End suppression  d'un evenement -->
									</div>
									<!-- modification  d'un evenement -->
									<div class="tab-pane fade " id="modifierEvenement">



										<form id="formEvenement" class="form-horizontal" method="Post"
											action="evenement">
											<input type="hidden" name="cacher" value="modifier" />
											<div class="table-responsive">
												<table class="table table-responsive table-bordered ">
													<thead>
														<tr>
															<th>#</th>
															<th>Titre d'evenement</th>
															<th>Date d'evenement</th>
															<th>Type d'evenement</th>
															<th>Message</th>

														</tr>

													</thead>
													<tbody>
														<c:forEach var="even" items="${evenements}">
															<tr>
																<td><input type="radio" name="evenementModifier"
																	value="${even.id_evenement}"></td>
																<td><c:out value="${even.titre }" /></td>
																<td><c:out value="${even.date }" /></td>
																<td><c:out value="${even.type }" /></td>
																<td><c:out value="${even.message }" /></td>

															</tr>


														</c:forEach>
													</tbody>

												</table>
											</div>
											<button class="btn btn-warning pull-right">Modifier</button>
										</form>
										<br>
										<br>
										<c:if test="${!empty evenement}">
											<form id="formEvenement" class="form-horizontal"
												method="post" action=" evenement">
												<input type="hidden" name="cacher"
													value="enregistrerModification"> <input
													type="hidden" name="idEvenement"
													value="${evenement.id_evenement }">

												<div class="well">
													<div class="form-group">
														<label for="titre">Titre<font color="red">*</font></label>
														<input type="text" name="titre" class="form-control"
															value="${evenement.titre }">
													</div>
													<div class="form-group">
														<label for="type">Type<font color="red">*</font></label> <select
															class="form-control" name="type">
															<option value="${evenement.type }"><c:out
																	value="${evenement.type }" /></option>
															<option value="Soutenance">Soutenance</option>
															<option value="Entretien">Entretien</option>
															<option value="Forum">Forum</option>
															<option value="Conference">Conference</option>
															<option value="Reunion">Reunion</option>
															<option value="Autre">Autre</option>
														</select>
													</div>
													<div class="form-group">
														<label for="autre">autre type</label> <input type="text"
															name="autre" class="form-control">
													</div>
													<div class="form-group">
														<label for="message">Message<font color="red">*</font></label>
														<textarea class="form-control" name="message"> <c:out
																value="${evenement.message }" /></textarea>
													</div>
													<div class="form-group">
														<label for="date">date<font color="red">*</font></label> <input
															type="date" name="dateEvenement" class="form-control"
															value="${evenement.date}">

													</div>
													<div class="form-group">
														<button class="btn btn-success pull-right">Enregistrer</button>
													</div>
												</div>
											</form>



										</c:if>





									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>





			<!-- /#page-wrapper -->
			<!-- /#wrapper -->


			<!-- Footer inclusion ############################################################-->

			<c:import url="include/footerInclude.jsp"></c:import>

			<!-- ################################################################################ -->

			<script>
				$(document)
						.ready(
								function() {
									$("#formEvenement")
											.validate(
													{
														rules : {
															type : "required",
															titre : "required",
															message : "required",
															dateEvenement : "required"
														},
														messages : {
															type : "champ requis",
															titre : "champ requis",
															message : "champ requis",
															dateEvenement : "champ requis"
														},
														errorElement : "em",
														errorPlacement : function(
																error, element) {
															// Add the `help-block` class to the error element
															error
																	.addClass("help-block");

															if (element
																	.prop("type") === "checkbox") {
																error
																		.insertAfter(element
																				.parent("label"));
															} else {
																error
																		.insertAfter(element);
															}
														},
														highlight : function(
																element,
																errorClass,
																validClass) {
															$(element)
																	.parents(
																			".form-group")
																	.addClass(
																			"has-error")
																	.removeClass(
																			"has-success");
														},
														unhighlight : function(
																element,
																errorClass,
																validClass) {
															$(element)
																	.parents(
																			".form-group")
																	.addClass(
																			"has-success")
																	.removeClass(
																			"has-error");
														}
													});
								});
			</script>


		</c:when>
		<c:when test="${ empty sessionScope.etatSession}">
			<jsp:forward page="accueil.jsp" />
		</c:when>
	</c:choose>

</body>

</html>
