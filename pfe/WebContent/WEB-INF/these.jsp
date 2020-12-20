<!DOCTYPE html>
<html lang="en">

<head>

	<title> Theses  </title>
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
<c:if test="${reussitmodification}">

		<script type="text/javascript">
			alert("these a été Modifier!")
			
		</script>
		

	</c:if>
<c:choose>
<c:when test="${sessionScope.etatSession==true}">
	
	<c:if test="${ empty sessionScope.grade }">
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
                        <h1 class="page-header"><i class="fa fa-book fa-fw"></i> Thèses</h1>
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
                            <li class="active" ><a href="#theseSoutenue" data-toggle="tab">Thèses Soutenus</a></li>
                            <li><a href="#theseEnCours" data-toggle="tab">Thèse en cours</a></li>
                        </ul>

                            <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="theseSoutenue">
                                <br>
                                
						<p>	
							<a href="#visulaisezsoutenu" data-toggle="tab" class="btn btn-primary">Visualiser</a>
							<a href="#ajoutersoutenu" data-toggle="tab" class="btn btn-success">Ajouter</a>
							<a href="#modifiersoutenu" data-toggle="tab" class="btn btn-warning">Modifier</a>
							<a href="#supprimersoutenu" data-toggle="tab" class="btn btn-danger">Supprimer</a>
						</p><div class="tab-content">
							<div class="tab-pane fade in active" id="visulaisezsoutenu">
								
								<!-- Affichage des activite  -->
								
								 <div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>nom prenom</th>
                                            <th>Sujet</th>
                                            <th> Date de prmiere inscription</th>
                                             <th>Date soutenance</th>
                                             <th>these cotutelle</th>
                                             
                                             <th>Etablissement Cotutelle</th>
                                             
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="these" items="${thesesoutenu}">
                                        <tr>
                                            <td><c:out value="${vari}"/></td>
                                            <td>${these.nom}</td>
                                            <td>${these.sujet }</td>
                                            <td>${these.datePremierInscription }</td>
                                             <td>${these.dateSoutenance}</td>
                                              <td>${these.theseCotutelle }</td>
                                               
                                            <td>${these.prenom }</td>  
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                         </tbody>
                                </table>
                            </div>
								
								<!-- END affichage theses  soutenus -->
							</div>
								<div class="tab-pane fade" id="ajoutersoutenu">
								
								<div class="well">
                                        <form id="formtheseSoutenue" class="form-horizontal" method="post" action="">
                                            <input type="hidden" name="cacher" value="ajouter">
                                            <div class="form-group">
                                               <label for="sujetThese">Sujet de thèse<font color="red">*</font></label> <input type="text" name="sujetThese" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="doctorant">Doctorant<font color="red">*</font></label>
                                                
                                                <select name="doctorant" class="form-control" >
                                                 <option></option>
                                                <c:forEach var="doctorant" items="${doctorants}">
                                                <option value="${doctorant.login }">${doctorant.nom}&nbsp${doctorant.prenom }</option>
                                                </c:forEach>
                                                
                                                 </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="dateInscription">date de première inscription<font color="red">*</font></label><input type="date" name="dateInscription" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <label for="dateSoutenance">Date de Soutenance<font color="red">*</font></label>
                                                <input type="date" name="dateSoutenance" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="theseCotutelle">Thèse en cotutelle<font color="red">*</font></label>
                                                <select class="form-control" name="theseCotutelle" >
                                                    <option value=""></option>
                                                    <option value="type1">type1</option>
                                                    <option value="type1">type2</option>
                                                    <option value="type1">type3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="etablissementCotutelle">Etablissement de cotutelle<font color="red">*</font></label>
                                                <input type="text" name="etablissementCotutelle" class="form-control"> 
                                            </div>
                                            

                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
                                            </div>
                                        </form>
                                    </div>
								</div>
							<div class="tab-pane fade" id="modifiersoutenu">
										<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                             <th>nom prenom</th>
                                             <th>Sujet</th>
                                             <th> Date de prmiere inscription</th>
                                             <th> Date de Soutenance</th>
                                             <th>these cotutelle</th>
                                             <th>Etablissement Cotutelle</th>
                                         </tr>
                                      </thead>
                                    <tbody><c:forEach var="these" items="${thesesoutenu}">
                                        <tr>
                                            <td><input type="radio" name="thesesModifier" value="${these.id_these}"></td>
                                            <td>${these.nom}</td>
                                            <td>${these.sujet }</td>
                                            <td>${these.datePremierInscription }</td>
                                            <td>${these.dateSoutenance}</td>
                                              <td>${these.theseCotutelle }</td>
                                               
                                            <td>${these.prenom }</td>
                                            
                                        </tr>
                                        </c:forEach>
                                        
                                        </tbody>
                                        </table>
                                     </div>
													
								<form id="formMdifier" class="form-horizontal" method="post" action="">
											
								</form>
							
							</div>
							
							
								<div class="tab-pane fade" id="supprimersoutenu">
								<form id="formEvenement" class="form-horizontal" method="Post" action="">
									<input type="hidden" name="cacher" value="supprimer"/>
									<input type="hidden" name="id" value="${sessionScope.email }">
										<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                             <th>nom prenom</th>
                                             <th>Sujet</th>
                                             <th> Date de prmiere inscription</th>
                                             <th> Date de soutenance</th>
                                             <th>these cotutelle</th>
                                             <th>Etablissement Cotutelle</th>
                                         </tr>
                                      </thead>
                                    <tbody><c:forEach var="these" items="${thesesoutenu}">
                                        <tr>
                                            <td><input type="checkbox" name="thesesSupprime" value="${these.id_these}"></td>
                                            <td>${these.nom}</td>
                                            <td>${these.sujet }</td>
                                            <td>${these.datePremierInscription }</td>
                                            <td>${these.dateSoutenance}</td>
                                              <td>${these.theseCotutelle }</td>
                                               
                                            <td>${these.prenom }</td>
                                            
                                        </tr>
                                        </c:forEach>
                                        
                                        </tbody>
                                        </table>
                                     </div>
													<button class="btn btn-danger pull-right">Supprimer</button>
													</form>
												

								<!--  End suppression  d'un evenement -->
							</div>
						</div>
				
                               
                                <!-- Theses en cours  -->
                            </div>                           
                            <div class="tab-pane fade" id="theseEnCours">
                                <br>
                                <ul class="nav bouton">
						<p>	
							<a href="#visulaisezencours" data-toggle="tab" class="btn btn-primary">Visualiser</a>
							<a href="#ajouterencours" data-toggle="tab" class="btn btn-success">Ajouter</a>
							<a href="#modifierencours" data-toggle="tab" class="btn btn-warning">Modifier</a>
							<a href="#supprimerencours" data-toggle="tab" class="btn btn-danger">Supprimer</a>
						</p>
					</ul>
					<div class="tab-content">
					           <div class="tab-pane fade in active" id="visulaisezencours">
								
								<!-- Affichage des activite  -->
								
								 <div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>nom prenom</th>
                                            <th>Sujet</th>
                                            <th> Date de prmiere inscription</th>
                                             <th>these cotutelle</th>
                                             
                                             <th>Etablissement Cotutelle</th>
                                             
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="these" items="${theseencours}">
                                        <tr>
                                            <td><c:out value="${vari}"/></td>
                                            <td>${these.nom}</td>
                                            <td>${these.sujet }</td>
                                            <td>${these.datePremierInscription }</td>
                                            
                                              <td>${these.theseCotutelle }</td>
                                               
                                            <td>${these.prenom }</td>
                                            
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                         </tbody>
                                </table>
                            </div>
								
								<!-- END affichage theses  en cours -->
							</div>
							<div class="tab-pane fade" id="ajouterencours">
							 <div class="well">
                                        <form id="formtheseEnCours" class="form-horizontal" method="post" action="">
                                        <input type="hidden" name="cacher" value="ajouterencours">
                                            <div class="form-group">
                                                <label for="sujetThese">Sujet de thèse<font color="red">*</font></label> <input type="text" name="sujetThese" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="doctorant">Doctorant<font color="red">*</font></label>
                                                <select name="doctorant" class="form-control" >
                                                <option></option>
                                                <c:forEach var="doctorant" items="${doctorants}">
                                                
                                                <option value="${doctorant.login }">${doctorant.nom}&nbsp${doctorant.prenom }</option>
                                                </c:forEach>
                                                
                                                 </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="dateInscription">date de première inscription<font color="red">*</font></label><input type="date" name="dateInscription" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <label for="theseCotutelle">Thèse en cotutelle<font color="red">*</font></label>
                                                <select class="form-control" name="theseCotutelle" >
                                                    <option value=""></option>
                                                    <option value="type1">type1</option>
                                                    <option value="type1">type2</option>
                                                    <option value="type1">type3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="etablissementCotutelle">Etablissement de cotutelle<font color="red">*</font></label>
                                                <input type="text" name="etablissementCotutelle" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
                                            </div>
                                        </form> 
                                    </div> 
							</div>
							<div class="tab-pane fade" id="modifierencours">
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                             <th>nom prenom</th>
                                             <th>Sujet</th>
                                             <th> Date de prmiere inscription</th>
                                             
                                             <th>these cotutelle</th>
                                             <th>Etablissement Cotutelle</th>
                                         </tr>
                                      </thead>
                                    <tbody><c:forEach var="these" items="${theseencours}">
                                        <tr>
                                            <td><input type="radio" name="thesesModifier" value="${these.id_these}"></td>
                                            <td>${these.nom}</td>
                                            <td>${these.sujet }</td>
                                            <td>${these.datePremierInscription }</td>
                                            
                                              <td>${these.theseCotutelle }</td>
                                               
                                            <td>${these.prenom }</td>
                                            
                                        </tr>
                                        </c:forEach>
                                        
                                        </tbody>
                                        </table>
							</div>
							<form id="formMdifierencours" class="form-horizontal" method="post" action="">
											
								</form>
								</div>
							
							<div class="tab-pane fade" id="supprimerencours">
							<form id="formEvenement" class="form-horizontal" method="Post" action="">
									<input type="hidden" name="cacher" value="supprimer"/>
									<input type="hidden" name="id" value="${sessionScope.email }">
										<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                             <th>nom prenom</th>
                                             <th>Sujet</th>
                                             <th> Date de prmiere inscription</th>
                                             <th>these cotutelle</th>
                                             <th>Etablissement Cotutelle</th>
                                         </tr>
                                      </thead>
                                    <tbody><c:forEach var="these" items="${theseencours}">
                                        <tr>
                                            <td><input type="checkbox" name="thesesSupprime" value="${these.id_these}"></td>
                                            <td>${these.nom}</td>
                                            <td>${these.sujet }</td>
                                            <td>${these.datePremierInscription }</td>
                                            
                                              <td>${these.theseCotutelle }</td>
                                               
                                            <td>${these.prenom }</td>
                                            
                                        </tr>
                                        </c:forEach>
                                        
                                        </tbody>
                                        </table>
                                     </div>
													<button class="btn btn-danger pull-right">Supprimer</button>
													</form>
												

								<!--  End suppression  d'un evenement -->
							</div>
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
                $( "#formtheseSoutenue" ).validate( {
                    rules: {
                        sujetThese : "required",
                        doctorant : "required",
                        directeurThese: "required",
                        dateInscription : "required",
                        dateSoutenance : "required",
                        theseCotutelle : "required",
                        etablissementCotutelle : "required",
                        paysCotutelle : "required"
                    },
                    messages: {
                        sujetThese : "champ requis",
                        doctorant : "champ requis",
                        directeurThese: "champ requis",
                        dateInscription : "champ requis",
                        dateSoutenance : "champ requis",
                        theseCotutelle : "champ requis",
                        etablissementCotutelle : "champ requis",
                        paysCotutelle : "champ requis"
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
                $( "#formtheseEnCours" ).validate( {
                    rules: {
                        sujetThese : "required",
                        doctorant : "required",
                        directeurThese: "required",
                        dateInscription : "required",
                        theseCotutelle : "required",
                        etablissementCotutelle : "required"
                        
                    },
                    messages: {
                        sujetThese : "champ requis",
                        doctorant : "champ requis",
                        directeurThese: "champ requis",
                        dateInscription : "champ requis",
                        theseCotutelle : "champ requis",
                        etablissementCotutelle : "champ requis",
                        theseCotutelle : "champ requis"
                        
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
    				$('input:radio[name=thesesModifier]:checked').each(function(){
    					var tr = $(this).parents('tr').find('td').length;
    					var tab = new Array();
    					for (var i = 1; i < tr; i++) 
    						tab[i] = $(this).parents('tr').find('td').eq(i).html();   						
    					
    					$('#formMdifier').html("<input type='hidden' name='cacher' value='modifierSoutenu'><div class='row'>"+
    					
    						"<div class='well'>"+
    							"<input type='hidden' name='idthese' value="+$('input:radio[name=thesesModifier]:checked').val()+">"+
    							"<div class='form-group'>"+
    							
    								"<label for='doctorant'>Doctorant</label>"+
    								"<select name='doctorant' class='form-control'>"+
    									"<c:forEach items='${doctorants}' var='user'>"+
    									"<option value='${user.login}'  >${user.nom} ${user.prenom}</option>"+
    									"</c:forEach>"+
    								"</select>"+ 
    							"</div>"+
    							"<div class=''>"+
    								"<div class='form-group'>"+
    									"<label for='sujetThese'>Sujet de thèse<font color='red'>*</font></label>"+
    									"<input type='text' name='sujetThese' class='form-control' value="+tab[2]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									" <label for='dateInscription'>date de première inscription<font color='red'>*</font></label>"+ 
    									"<input type='date' name='dateInscription' class='form-control' value="+tab[3]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									" <label for='dateSoutenance'>Date de Soutenance<font color='red'>*</font></label>"+
    									" <input type='date' name='dateSoutenance' class='form-control' value= "+tab[4]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    							    "<label for='theseCotutelle'>These en Cotutelle<font color='red'>*</font></label>"+
    								"<c:set var='type' value="+tab[5]+"/>"+
    								"<c:set var='type1' value='type1'/>"+
    								"<c:set var='type2' value='type2'/>"+
    								"<c:set var='type3' value='type3'/>"+
    								"<select name='theseCotutelle' class='form-control'>"+
    									"<option value='type1' <c:if test='${type==type1}'>selected='selected'</c:if> >type1</option>"+
    									"<option value='type2' <c:if test='${type==type2}'>selected='selected'</c:if> >type2</option>"+
    									"<option value='type3' <c:if test='${type==type3}'>selected='selected'</c:if> >type3</option></select>"+
    								"</div>"+
    									"<div class='form-group'>"+
    									"<label for='etablissementCotutelle'>Etablissement de cotutelle<font color='red'>*</font></label>"+
    									"<input type='text' name='etablissementCotutelle' class='form-control' value="+tab[6]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									"<button class='btn btn-success pull-right'>Enregistrer</button>"+
    								"</div>"+
    							"</div>"+
    						"</div>");

    				})

    			});
    		});
            
            
            
            
            $(document).ready(function(){

    			$('input:radio').click(function(){
    				$('input:radio[name=thesesModifier]:checked').each(function(){
    					var tr = $(this).parents('tr').find('td').length;
    					var tab = new Array();
    					for (var i = 1; i < tr; i++) 
    						tab[i] = $(this).parents('tr').find('td').eq(i).html();   						
    					
    					$('#formMdifierencours').html("<input type='hidden' name='cacher' value='modifierencours'><div class='row'>"+
    					
    						"<div class='well'>"+
    							"<input type='hidden' name='idthese' value="+$('input:radio[name=thesesModifier]:checked').val()+">"+
    							"<div class='form-group'>"+
    							
								"<label for='doctorant'>Doctorant</label>"+
								"<select name='doctorant' class='form-control'>"+
									"<c:forEach items='${doctorants}' var='user'>"+
									"<option value='${user.login}'  >${user.nom} ${user.prenom}</option>"+
									"</c:forEach>"+
								"</select>"+ 
							"</div>"+
    							"<div class=''>"+
    								"<div class='form-group'>"+
    									"<label for='sujetThese'>Sujet de thèse<font color='red'>*</font></label>"+
    									"<input type='text' name='sujetThese' class='form-control' value="+tab[2]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    									" <label for='dateInscription'>date de première inscription<font color='red'>*</font></label>"+ 
    									"<input type='date' name='dateInscription' class='form-control' value="+tab[3]+">"+
    								"</div>"+
    								"<div class='form-group'>"+
    							    "<label for='theseCotutelle'>These en Cotutelle<font color='red'>*</font></label>"+
    								"<c:set var='type' value="+tab[4]+"/>"+
    								"<c:set var='type1' value='type1'/>"+
    								"<c:set var='type2' value='type2'/>"+
    								"<c:set var='type3' value='type3'/>"+
    								"<select name='theseCotutelle' class='form-control'>"+
    									"<option value='type1' <c:if test='${type==type1}'>selected='selected'</c:if> >type1</option>"+
    									"<option value='type2' <c:if test='${type==type2}'>selected='selected'</c:if> >type2</option>"+
    									"<option value='type3' <c:if test='${type==type3}'>selected='selected'</c:if> >type3</option></select>"+
    								"</div>"+
    									"<div class='form-group'>"+
    									"<label for='etablissementCotutelle'>Etablissement de cotutelle<font color='red'>*</font></label>"+
    									"<input type='text' name='etablissementCotutelle' class='form-control' value="+tab[5]+">"+
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
