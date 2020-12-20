<!DOCTYPE html>
<html lang="en">

<head>

	<title> Communication dans une conference  </title>
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
                        <h1 class="page-header"><i class="fa fa-wechat fa-fw"></i>Communication dans une conférence</h1>
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
                            <li class="active" ><a href="#nationalle" data-toggle="tab">Communication dans une conférence Nationalle</a></li>
                            <li><a href="#internationall" data-toggle="tab">Communication dans une conférence InterNationalle</a></li>
                        </ul>

                            <!-- Tab panes -->
                        <div class="tab-content">
                        <br><br>
                            <div class="tab-pane fade in active" id="nationalle">
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
                                            <th>manifestation</th>
                                             
                                               <th>ville</th>
                                                <th>date conference</th>
                                               <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="conference" items="${conferences}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             
                                              <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        <c:forEach var="conference" items="${conferencesparticipant}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             
                                              <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <c:forEach var="conference" items="${conferencesvalide}">
                                        <tr>
                                            
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        <c:forEach var="conference" items="${conferencesvalideparticipant}">
                                        <tr>
                                            
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                         
                                    </tbody>
                                </table>
                            </div>
							</div>
							<div class="tab-pane fade " id="ajouter">
							 <br><br>
							<form id="formConferenceNationalle" class="form-horizontal" method="post" action="">
                                        <input type="hidden" name="cacher" value="ajouter">
                                        <div class="row">
                                            <div class="col-sm-offset-3 col-sm-6 ">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th></th>
                                                        <th>Nom Prenom</th>
                                                    </tr>
                                                    <c:forEach items="${utilisateurs}" var="utilisateur">
														<c:if test="${!empty utilisateur.grade }">
														<tr>
															<td><input type="checkbox" value="${utilisateur.login}" name="participant"></td>
															<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
														</tr>
														</c:if>
													</c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="well">
                                            <div class="form-group">
                                                <label for="auteur">Auteur(s)</label> <input type="text" name="auteur" class="form-control" placeholder="Nom1 Prenom1 , Nom2 prenom2 , ..."> 
                                            </div> 
                                            <div class="">
                                                <div class="form-group">
                                                   <label for="intitule">Intitule<font color="red">*</font></label> <input type="text" name="intitule" class="form-control"> 
                                                </div>
                                                <div class="form-group">
                                                   <label for="manifestation">Manifestation<font color="red">*</font></label> <input type="text" name="manifestation" class="form-control" > 
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label for="dateConference">date<font color="red">*</font></label><input type="date" name="dateConference" class="form-control" > 
                                                </div>
                                                <div class="form-group">
                                                   <label for="ville">Ville<font color="red">*</font></label> <input type="text" name="ville" class="form-control"> 
                                                </div>
                                                <div class="form-group">
                                                    <button class="btn btn-success pull-right">Enregistrer</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>  




							
							</div>
							<div class="tab-pane fade " id="modifier">
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>manifestation</th>
                                             
                                               <th>ville</th>
                                                <th>date conference</th>
                                                <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="conference" items="${conferences}">
                                        <tr>
                                            <td><input type="radio" name="conferencesModifier" value="${conference.id_conference}"></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             
                                              <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                       
                               </tbody>
                                </table>
                            </div>
                            <form id="formMdifier" class="form-horizontal" method="post" action="">
											
								</form>				
							</div>
							<div class="tab-pane fade " id="supprimer">
							<form id="formEvenement" class="form-horizontal" method="Post" action="">
									<input type="hidden" name="cacher" value="supprimer"/>
									<input type="hidden" name="id" value="${sessionScope.email }">
									
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>manifestation</th>
                                             
                                               <th>ville</th>
                                                <th>date conference</th>
                                               <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="conference" items="${conferences}">
                                        <tr>
                                            <td><input type="checkbox" name="conferencesSupprime" value="${conference.id_conference}"></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             
                                              <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                       
                               </tbody>
                                </table>
                            </div>
                            <button class="btn btn-danger pull-right">Supprimer</button>
							
                            </form>
							</div>
					 </div>
                                
                                
                                
                                
                            </div>                           
                            <div class="tab-pane fade" id="internationall">
                                <div class="tab-content">
                                <ul class="nav bouton">
						<p>	
							<a href="#visualisezi" data-toggle="tab" class="btn btn-primary">Visualiser</a>
							<a href="#ajouteri" data-toggle="tab" class="btn btn-success">Ajouter</a>
							<a href="#modifieri" data-toggle="tab" class="btn btn-warning">Modifier</a>
							<a href="#supprimeri" data-toggle="tab" class="btn btn-danger">Supprimer</a>
						</p>
					</ul>
					<div class="tab-pane fade in active " id="visualisezi">
					
					<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>manifestation</th>
                                              <th>pays</th>
                                               <th>ville</th>
                                                <th>date conference</th>
                                               <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="conference" items="${conferencesn}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             <td><c:out value="${conference.pays}"/></td>
                                              <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        <c:forEach var="conference" items="${conferancesparticipantn}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                               <td><c:out value="${conference.pays}"/></td>
                                              <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        
                                        
                                        
                                        
                          
                                        <c:forEach var="conference" items="${conferencesvaliden}">
                                        <tr>
                                            
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                            <td><c:out value="${conference.pays}"/></td>
                                             <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        <c:forEach var="conference" items="${conferencesvalideparticipantn}">
                                        <tr>
                                            
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             <td><c:out value="${conference.pays}"/></td>
                                             <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                         
                                    </tbody>
                                </table>
                            </div>
					
					</div>
					
                            <div class="tab-pane fade " id="ajouteri">
                              
							<form id="formConferenceNationalle" class="form-horizontal" method="post" action="">
                                        <input type="hidden" name="cacher" value="ajouter">
                                        <div class="row">
                                            <div class="col-sm-offset-3 col-sm-6 ">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <th></th>
                                                        <th>Nom Prenom</th>
                                                    </tr>
                                                    <c:forEach items="${utilisateurs}" var="utilisateur">
														<c:if test="${!empty utilisateur.grade }">
														<tr>
															<td><input type="checkbox" value="${utilisateur.login}" name="participant"></td>
															<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
														</tr>
														</c:if>
													</c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="well">
                                            <div class="form-group">
                                                <label for="auteur">Auteur(s)</label> <input type="text" name="auteur" class="form-control" placeholder="Nom1 Prenom1 , Nom2 prenom2 , ..."> 
                                            </div> 
                                            <div class="">
                                                <div class="form-group">
                                                   <label for="intitule">Intitule<font color="red">*</font></label> <input type="text" name="intitule" class="form-control"> 
                                                </div>
                                                <div class="form-group">
                                                   <label for="manifestation">Manifestation<font color="red">*</font></label> <input type="text" name="manifestation" class="form-control" > 
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label for="dateConference">date<font color="red">*</font></label><input type="date" name="dateConference" class="form-control" > 
                                                </div>
                                                <div class="form-group">
                                                   <label for="ville">Ville<font color="red">*</font></label> <input type="text" name="ville" class="form-control"> 
                                                </div>
                                                <div class="form-group">
                                                   <label for="pays">Pays<font color="red">*</font></label> <input type="text" name="pays" class="form-control"> 
                                                </div>
                                                <div class="form-group">
                                                    <button class="btn btn-success pull-right">Enregistrer</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>  




							
							</div>
							<div class="tab-pane fade " id="modifieri">
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>manifestation</th>
                                             <th>pays</th>
                                               <th>ville</th>
                                                <th>date conference</th>
                                                <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="conference" items="${conferencesn}">
                                        <tr>
                                            <td><input type="radio" name="conferencesModifiern" value="${conference.id_conference}"></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             <td><c:out value="${conference.pays}"/></td>
                                              <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                       
                               </tbody>
                                </table>
                            </div>
                            <form id="formMdifiern" class="form-horizontal" method="post" action="">
											
								</form>				
                           
							</div>
							<div class="tab-pane fade " id="supprimeri">
							<form id="formEvenement" class="form-horizontal" method="Post" action="">
									<input type="hidden" name="cacher" value="supprimer"/>
									<input type="hidden" name="id" value="${sessionScope.email }">
									
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>manifestation</th>
                                             <th>pays</th>
                                               <th>ville</th>
                                                <th>date conference</th>
                                               <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="conference" items="${conferencesn}">
                                        <tr>
                                            <td><input type="checkbox" name="conferencesSupprime" value="${conference.id_conference}"></td>
                                            <td><c:out value="${conference.intitule }"/></td>
                                            <td><c:out value="${conference.manifestation}"/></td>
                                             <td><c:out value="${conference.pays}"/></td>
                                              <td><c:out value="${conference.ville}"/></td>
                                              <td><c:out value="${conference.dateConference}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                       
                               </tbody>
                                </table>
                            </div>
                            <button class="btn btn-danger pull-right">Supprimer</button>
							
                            </form>
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
</div>
<!-- /#wrapper -->

<!-- Footer inclusion ############################################################-->

        <c:import url="include/footerInclude.jsp"></c:import>
        
<!-- ################################################################################ -->

        <script>
            $( document ).ready( function () {
                $( "#formConferenceNationalle" ).validate( {
                    rules: {
                        intitule : "required",
                        manifestation : "required",
                        date : "required",
                        ville : "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        manifestation : "champ requis",
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
                $( "#formConferenceInternationalle" ).validate( {
                    rules: {
                        intitule : "required",
                        manifestation : "required",
                        date : "required",
                        ville : "required",
                        pays : "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        manifestation : "champ requis",
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
            
            
            
            
            
            $(document).ready(function(){

            	$('input:radio').click(function(){
            	
            		$('input:radio[name=conferencesModifier]:checked').each(function(){
            			
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
            			"<input type='hidden' name='idconference' value="+$('input:radio[name=conferencesModifier]:checked').val()+">"+
            			
            			
            				"<div class='form-group'>"+
            					"<label for='intitule'>intitule<font color='red'>*</font></label>"+
            					"<input type='text' name='intitule' class='form-control' value="+tab[1]+">"+
            				"</div>"+
            				"<div class=''>"+
                			"<div class='form-group'>"+
        					" <label for='manifestation'>Manifestation<font color='red'>*</font></label>"+ 
        					"<input type='text' name='manifestation' class='form-control' value="+tab[2]+">"+
        				"</div>"+
        				"<div class='form-group'>"+
    					" <label for='ville'>ville<font color='red'>*</font></label>"+ 
    					"<input type='text' name='ville' class='form-control' value="+tab[3]+">"+
    				"</div>"+
    				"<div class='form-group'>"+
					" <label for='dateConference'>Date conference<font color='red'>*</font></label>"+ 
					"<input type='text' name='dateConference' class='form-control' value="+tab[4]+">"+
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
            	
            		$('input:radio[name=conferencesModifiern]:checked').each(function(){
            			
            			var tr = $(this).parents('tr').find('td').length;
            			var tab = new Array();
            			for (var i = 1; i < tr; i++) 
            				tab[i] = $(this).parents('tr').find('td').eq(i).html();   						
            			

            $('#formMdifiern').html("<input type='hidden' name='cacher' value='modifier'><div class='row'>"+
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
            			"<input type='hidden' name='idconference' value="+$('input:radio[name=conferencesModifiern]:checked').val()+">"+
            			
            			
            				"<div class='form-group'>"+
            					"<label for='intitule'>intitule<font color='red'>*</font></label>"+
            					"<input type='text' name='intitule' class='form-control' value="+tab[1]+">"+
            				"</div>"+
            				"<div class=''>"+
                			"<div class='form-group'>"+
        					" <label for='manifestation'>Manifestation<font color='red'>*</font></label>"+ 
        					"<input type='text' name='manifestation' class='form-control' value="+tab[2]+">"+
        				"</div>"+
        				"<div class='form-group'>"+
    					" <label for='ville'>ville<font color='red'>*</font></label>"+ 
    					"<input type='text' name='ville' class='form-control' value="+tab[4]+">"+
    				"</div>"+
    				"<div class='form-group'>"+
					" <label for='pays'>pays<font color='red'>*</font></label>"+ 
					"<input type='text' name='pays' class='form-control' value="+tab[3]+">"+
				"</div>"+
    				"<div class='form-group'>"+
					" <label for='dateConference'>Date conference<font color='red'>*</font></label>"+ 
					"<input type='text' name='dateConference' class='form-control' value="+tab[5]+">"+
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