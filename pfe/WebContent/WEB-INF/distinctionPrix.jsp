<!DOCTYPE html>
<html lang="en">

<head>

	<title> Distinction/Prix  </title>
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
                        <h1 class="page-header"><i class="fa  fa-trophy fa-fw"></i>Distinction/prix</h1>
                    
                          <ul class="nav bouton">
						<p>	
							<a href="#visulaisez" data-toggle="tab" class="btn btn-primary">Visualiser</a>
							<a href="#ajouter" data-toggle="tab" class="btn btn-success">Ajouter</a>
							<a href="#modifier" data-toggle="tab" class="btn btn-warning">Modifier</a>
							<a href="#supprimer" data-toggle="tab" class="btn btn-danger">Supprimer</a>
						</p>
					</ul>
					<div class="tab-content">
							<div class="tab-pane fade in active" id="visulaisez">
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>Organisme </th>
                                            <th>date</th>
                                            <th>evenement</th>
                                            <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="distinction" items="${distinctionsparticipant}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${distinction.intitule }"/></td>
                                            <td><c:out value="${distinction.organisme }"/></td>
                                            
                                            <td><c:out value="${distinction.dateDistinction }"/></td>
                                            <td><c:out value="${distinction.evenement}"/></td>
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        <c:forEach var="distinction" items="${distinctions}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${distinction.intitule }"/></td>
                                            <td><c:out value="${distinction.organisme }"/></td>
                                            
                                            <td><c:out value="${distinction.dateDistinction }"/></td>
                                            <td><c:out value="${distinction.evenement}"/></td>
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        
                                        
                                        <c:forEach var="distinction" items="${distinctionsvalide}">
                                         <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${distinction.intitule }"/></td>
                                            <td><c:out value="${distinction.organisme }"/></td>
                                            
                                            <td><c:out value="${distinction.dateDistinction }"/></td>
                                            <td><c:out value="${distinction.evenement}"/></td>
                                            <td><font color="green">validé</font>  </td>
                                        </tr>  <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                         <c:forEach var="distinction" items="${distinctionsvalideparticipant}">
                                         <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${distinction.intitule }"/></td>
                                            <td><c:out value="${distinction.organisme }"/></td>
                                            
                                            <td><c:out value="${distinction.dateDistinction }"/></td>
                                            <td><c:out value="${distinction.evenement}"/></td>
                                            <td><font color="green">validé</font>  </td>
                                        </tr>  <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                         
                                    </tbody>
                                </table>
                            </div>
							</div>
							<div class="tab-pane fade" id="ajouter">
								<br>
							<form id="formdistinctionPrix" class="form-horizontal" method="post" action="">
                                    <div class="row">
                                        <div class="col-sm-offset-3 col-sm-6 ">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th></th>
                                                    <th>Nom Prenom</th>
                                                    <c:forEach items="${utilisateurs}" var="utilisateur">
														<c:if test="${!empty utilisateur.grade }">
														<tr>
															<td><input type="checkbox" value="${utilisateur.login}" name="participant"></td>
															<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
														</tr>
														</c:if>
													</c:forEach>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="well">
                                    <input type="hidden" name="cacher" value="ajouter">
                                        <div class="form-group">
                                            <label for="auteur">Primé(s)</label> <input type="text" name="auteur" class="form-control" placeholder="Nom1 Prenom1 , Nom2 prenom2 , ..."> 
                                        </div> 
                                        <div class="">
                                            <div class="form-group">
                                               <label for="intitule">Intitule<font color="red">*</font></label> <input type="text" name="intitule" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="evenement">Evénement</label> <input type="text" name="evenement" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="organisme">Organisme</label> <input type="text" name="organisme" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="dateDistinctionPrix">date<font color="red">*</font></label><input type="date" name="dateDistinctionPrix" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
                                            </div>
                                        </div>
                                    </div>
                                </form> 
							</div>
							<div class="tab-pane fade" id="modifier">
							
							
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>Organisme </th>
                                            <th>date</th>
                                            <th>evenement</th>
                                            <th>Etat</th>
                                        </tr>
                                        
                                    </thead>
                                    <tbody><c:forEach var="distinction" items="${distinctions}">
                                        <tr>
                                            <td><input type="radio" name="distinctionsModifier" value="${distinction.id_distinctionPrix}"></td>
                                            <td><c:out value="${distinction.intitule }"/></td>
                                            <td><c:out value="${distinction.organisme }"/></td>
                                            
                                            <td><c:out value="${distinction.dateDistinction }"/></td>
                                            <td><c:out value="${distinction.evenement}"/></td>
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> 
                                        </c:forEach>
                                       
                                         
                                    </tbody>
                                </table>
                            </div>
							<form id="formMdifier" class="form-horizontal" method="post" action="">
											
								</form>
							
							
							</div>
							<div class="tab-pane fade" id="supprimer">
							
							<form id="formEvenement" class="form-horizontal" method="Post" action="">
									<input type="hidden" name="cacher" value="supprimer"/>
									<input type="hidden" name="id" value="${sessionScope.email }">
									
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>Organisme </th>
                                            <th>date</th>
                                            <th>evenement</th>
                                            <th>Etat</th>
                                        </tr>
                                        
                                    </thead>
                                    <tbody><c:forEach var="distinction" items="${distinctions}">
                                        <tr>
                                            <td><input type="checkbox" name="distinctionsSupprime" value="${distinction.id_distinctionPrix}"></td>
                                            <td><c:out value="${distinction.intitule }"/></td>
                                            <td><c:out value="${distinction.organisme }"/></td>
                                            
                                            <td><c:out value="${distinction.dateDistinction }"/></td>
                                            <td><c:out value="${distinction.evenement}"/></td>
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> 
                                        </c:forEach>
                                       
                                         
                                    </tbody>
                                </table>
                            </div>
                            <button class="btn btn-danger pull-right">Supprimer</button>
													
                            </form>
							</div>
							<div class="tab-pane fade" id="modifier">
							
							
							</div>
							
							
							
				    </div>
                    
                    
                    
                    
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
                $( "#formdistinctionPrix" ).validate( {
                    rules: {
                        intitule : "required",
                        date: "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        date: "champ requis"
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
            	
            		$('input:radio[name=distinctionsModifier]:checked').each(function(){
            			
            			var tr = $(this).parents('tr').find('td').length;
            			var tab = new Array();
            			for (var i = 1; i < tr; i++) 
            				tab[i] = $(this).parents('tr').find('td').eq(i).html();   						
            			

            $('#formMdifier').html("<input type='hidden' name='cacher' value='modifier'><div class='row'>"+
            		"<div class='col-sm-offset-3 col-sm-6 '>"+
					"<table class='table table-bordered'>"+
						"<tr>"+
							"<th></th>"+
							"<th>Nom Prenom</th>"+
							"<c:forEach items='${utilisateurs}' var='utilisateur'>"+
							"<c:if test='${!empty utilisateur.grade }'>"+
								"<c:if test='${ utilisateur.login != sessionScope.login}'>"+
									"<tr>"+
										"<td><input type='checkbox' value='${utilisateur.login}' name='participantsM'></td>"+
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
            			"<input type='hidden' name='iddistinction' value="+$('input:radio[name=distinctionsModifier]:checked').val()+">"+
            			
            			
            				"<div class='form-group'>"+
            					"<label for='intitule'>intitule<font color='red'>*</font></label>"+
            					"<input type='text' name='intitule' class='form-control' value="+tab[1]+">"+
            				"</div>"+
            				"<div class=''>"+
                			"<div class='form-group'>"+
        					" <label for='organisme'>Organisme<font color='red'>*</font></label>"+ 
        					"<input type='text' name='organisme' class='form-control' value="+tab[2]+">"+
        				"</div>"+
            				"<div class='form-group'>"+
            					" <label for='datedistinction'>date <font color='red'>*</font></label>"+ 
            					"<input type='date' name='datedistinction' class='form-control' value="+tab[3]+">"+
            				"</div>"+
            				"<div class='form-group'>"+
        					" <label for='evenement'>evenement <font color='red'>*</font></label>"+ 
        					"<input type='text' name='evenement' class='form-control' value="+tab[4]+">"+
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
