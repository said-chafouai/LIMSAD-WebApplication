<!DOCTYPE html>
<html lang="en">

<head>

	<title> Brevet/Droit d'auteur  </title>
    <!-- inclusion Generale ############################################################"" -->
    
    		<c:import url="include/headInclude.jsp"></c:import>
    
    <!-- ################################################################################ -->

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


<c:choose>
<c:when test="${sessionScope.etatSession==true}">

		<c:if test="${ !empty sessionScope.role}">
			<jsp:forward page="accueil.jsp"/>
		</c:if>


    <div id="wrapper">
    <c:if test="${reussit}">

		<script type="text/javascript">
			alert("Brevet Droit a �t� d�clarer!")
		</script>

	</c:if>
	<c:if test="${reussitmodification}">

		<script type="text/javascript">
			alert("Brevet Droit a �t� Modifier!")
		</script>

	</c:if>


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
								<h1 class="page-header">
									<i class="fa fa-copyright  fa-fw"></i> Brevet/Droit d'auteur 
								</h1>
					<ul class="nav bouton">
						<p>	
							<a href="#visulaisez" data-toggle="tab" class="btn btn-primary">Visualiser</a>
							<a href="#ajouterEvenement" data-toggle="tab" class="btn btn-success">Ajouter</a>
							<a href="#modifierEvenement" data-toggle="tab" class="btn btn-warning">Modifier</a>
							<a href="#supprimerbrevet" data-toggle="tab" class="btn btn-danger">Supprimer</a>
						</p>
					</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane fade in active" id="visulaisez">
								
								<!-- Affichage des activite  -->
								
								 <div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>Type</th>
                                            <th>Champ d'application</th>
                                             <th>numero de d�pot</th>
                                             <th>numero d'enregistrement</th>
                                             <th>date de d�pot</th>
                                             <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="brevet" items="${brevets}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${brevet.intitule }"/></td>
                                            <td><c:out value="${brevet.type }"/></td>
                                            <td><c:out value="${brevet.champApplication }"/></td>
                                             <td><c:out value="${brevet.numeroDepot }"/></td>
                                              <td><c:out value="${brevet.numeroEnregistrement }"/></td>
                                               
                                            <td><c:out value="${brevet.dateDepot }"/></td>
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        <c:forEach var="brevetparticipant" items="${brevetsparticipant}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${brevetparticipant.intitule }"/></td>
                                            <td><c:out value="${brevetparticipant.type }"/></td>
                                            <td><c:out value="${brevetparticipant.champApplication }"/></td>
                                             <td><c:out value="${brevetparticipant.numeroDepot }"/></td>
                                              <td><c:out value="${brevetparticipant.numeroEnregistrement }"/></td>
                                               
                                            <td><c:out value="${brevetparticipant.dateDepot }"/></td>
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        <c:forEach var="breve" items="${brevetsvalide}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${breve.intitule }"/></td>
                                            <td><c:out value="${breve.type }"/></td>
                                            <td><c:out value="${breve.champApplication }"/></td>
                                             <td><c:out value="${breve.numeroDepot }"/></td>
                                              <td><c:out value="${breve.numeroEnregistrement }"/></td>
                                               
                                            <td><c:out value="${breve.dateDepot }"/></td>
                                            <td><font color="green">valid�</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                         <c:forEach var="breveparticipant" items="${brevetsparticipantvalide}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${breveparticipant.intitule }"/></td>
                                            <td><c:out value="${breveparticipant.type }"/></td>
                                            <td><c:out value="${breveparticipant.champApplication }"/></td>
                                             <td><c:out value="${breveparticipant.numeroDepot }"/></td>
                                              <td><c:out value="${breveparticipant.numeroEnregistrement }"/></td>
                                               
                                            <td><c:out value="${breveparticipant.dateDepot }"/></td>
                                            <td><font color="green">valid�</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
								
								<!-- END affichage activite -->
							</div>
							<!-- Ajout des activite  -->
							<div class="tab-pane fade" id="ajouterEvenement">
								<br>
								<div>
									<form id="formBrevetDroit" class="form-horizontal" method="post" action="upload" enctype="multipart/form-data">
									<input type="hidden" name="choix" value="brevetDroit">
									
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
																	<td><input type="checkbox" value="${utilisateur.login}" name="participant"></td>
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
											<label for="preuve">Preuve (format accepte pdf, png , jpg , jpeg)</label> <input type="file" name="fichier">
										</div>
                                        <div class="form-group">
                                            <label for="auteur">Auteur(s)</label> <input type="text" name="auteur" class="form-control" placeholder="Nom1 Prenom1 , Nom2 prenom2 , ..."> 
                                        </div> 
                                        <div class="">
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
                                                <label for="champApplication">Champ d'application<font color="red">*</font></label><input type="text" name="champApplication" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                               <label for="numeroDepot">Num�ro de d�pot<font color="red">*</font></label> <input type="text" name="numeroDepot" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="dateDepot">Date de d�pot<font color="red">*</font></label> <input type="date" name="dateDepot" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="numeroEnregistrement">Num�ro d'enregistrement</label> <input type="text" name="numeroEnregistrement" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>  
								</div>
							</div>
							<!--  End Ajout des evenements  -->
							<!--  Supprimer evenement  -->
							<div class="tab-pane fade" id="supprimerbrevet">
								<form id="formEvenement" class="form-horizontal" method="Post" action="">
									<input type="hidden" name="cacher" value="supprimer"/>
									<input type="hidden" name="id" value="${sessionScope.email }">
									
								 <div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>Type</th>
                                            <th>Champ d'application</th>
                                             <th>numero de d�pot</th>
                                             <th>numero d'enregistrement</th>
                                             
                                             <th>date de d�pot</th>
                                             <th>Etat</th>
                                        </tr>
                                        
                                    </thead>
                                    <tbody><c:forEach var="brevet" items="${brevets}">
                                        <tr>
                                            <td><input type="checkbox" name="brevetsSupprime" value="${brevet.id_brevet}"></td>
                                            <td><c:out value="${brevet.intitule }"/></td>
                                            <td><c:out value="${brevet.type }"/></td>
                                            <td><c:out value="${brevet.champApplication }"/></td>
                                             <td><c:out value="${brevet.numeroDepot }"/></td>
                                              <td><c:out value="${brevet.numeroEnregistrement }"/></td>
                                               
                                            <td><c:out value="${brevet.dateDepot }"/></td>
                                            <td><font color="red">En Attente</font>  </td>
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
								
								
								<form id="formEvenement" class="form-horizontal" method="Post" action="">
									<input type="hidden" name="cacher" value="modifier"/>
									
								 <div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>Type</th>
                                            <th>Champ d'application</th>
                                             <th>numero de d�pot</th>
                                             <th>numero d'enregistrement</th>
                                             
                                             <th>date de d�pot</th>
                                             <th>Etat</th>
                                        </tr>
                                        
                                    </thead>
                                    <tbody><c:forEach var="brevet" items="${brevets}">
                                        <tr>
                                            <td><input type="radio" name="brevetModifier" value="${brevet.id_brevet}"></td>
                                            <td><c:out value="${brevet.intitule }"/></td>
                                            <td><c:out value="${brevet.type }"/></td>
                                            <td><c:out value="${brevet.champApplication }"/></td>
                                             <td><c:out value="${brevet.numeroDepot }"/></td>
                                              <td><c:out value="${brevet.numeroEnregistrement }"/></td>
                                               
                                            <td><c:out value="${brevet.dateDepot }"/></td>
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> 
                                        
                                        </c:forEach>
                                        
                                        </tbody>
                                        </table>
                                     </div>
													<button class="btn btn-warning pull-right">Modifier</button>
													</form>
												<br><br>
								<c:if test="${!empty brevetdroit}">
								
								<form id="formBrevetDroit" class="form-horizontal" method="post" action="">
									<input type="hidden" name="cacher" value="enregistrermodification">
									<input type="hidden" name="IDBREVET" value="${IDBREVET }">
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
																	<td><input type="checkbox" value="${utilisateur.login}" name="participant"></td>
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
                                            <label for="auteur">Auteur(s)</label> <input type="text" name="auteur" class="form-control" value="${brevetdroit.acteurexterne }"> 
                                        </div> 
                                        <div class="">
                                            <div class="form-group">
                                               <label for="intitule">Intitule<font color="red">*</font></label> <input type="text" name="intitule" class="form-control" value="${brevetdroit.intitule }"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="type">Type<font color="red">*</font></label>
                                                <select class="form-control" name="type" id="type" >
                                                    <option value="${brevetdroit.type }"><c:out value="${brevetdroit.type }"/></option>
                                                    <option value="type1">type1</option>
                                                    <option value="type2">type2</option>
                                                    <option value="type3">type3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="champApplication">Champ d'application<font color="red">*</font></label><input type="text" name="champApplication" class="form-control"  value="${brevetdroit.champApplication }"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="numeroDepot">Num�ro de d�pot<font color="red">*</font></label> <input type="text" name="numeroDepot" class="form-control" value="${brevetdroit.numeroDepot }"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="dateDepot">Date de d�pot<font color="red">*</font></label> <input type="date" name="dateDepot" class="form-control" value="${brevetdroit.dateDepot }"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="numeroEnregistrement">Num�ro d'enregistrement</label> <input type="text" name="numeroEnregistrement" class="form-control"value="${brevetdroit.numeroEnregistrement }" > 
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
                                            </div>
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
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

<!-- Footer inclusion ############################################################-->

        <c:import url="include/footerInclude.jsp"></c:import>
        
<!-- ################################################################################ -->

        <script>
            $( document ).ready( function () {
                $( "#formBrevetDroit" ).validate( {
                    rules: {
                    	fichier : "required",
                        type : "required",
                        intitule : "required",
                        champApplication : "required",
                        numeroDepot : "required",
                        dateDepot : "required",
                        numeroEnregistrement : "required"
                    },
                    messages: {
                    	fichier : "champ requis",
                        type : "champ requis",
                        intitule : "champ requis",
                        champApplication : "champ requis",
                        numeroDepot : "champ requis",
                        dateDepot : "champ requis",
                        numeroEnregistrement : "champ requis"
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
