<!DOCTYPE html>
<html lang="en">

<head>

	<title> Publication dans une revue  </title>
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
                        <h1 class="page-header"><i class="fa fa-file-text-o fa-fw"></i>Publication dans une revue</h1>
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
                            <li class="active" ><a href="#indexe" data-toggle="tab">Publication dans une revue indexée</a></li>
                            <li><a href="#nonIndexe" data-toggle="tab">Publication dans une revue non indexée</a></li>
                        </ul>

                            <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="indexe">
                                <br>
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
                                            <th>journal</th>
                                             <th>base d'indexation</th>
                                               <th>date de publication</th>
                                               <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="journal" items="${journals}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        <c:forEach var="journal" items="${journalsparticipant}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <c:forEach var="journal" items="${journalsvalide}">
                                        <tr>
                                            
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        <c:forEach var="journal" items="${journalsvalideparticipant}">
                                        <tr>
                                            
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                         
                                    </tbody>
                                </table>
                            </div>
							
							</div>
							<div class="tab-pane fade " id="ajouter">
							<form id="formIndexe" class="form-horizontal" method="post" action="">
							<input type="hidden" name="cacher" value="ajouter">
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
                                            <div class="form-group">
                                                <label for="auteur">Auteur(s)</label> <input type="text" name="auteur" class="form-control" placeholder="Nom1 Prenom1 , Nom2 prenom2 , ..."> 
                                            </div>
                                            <div class="form-group">
                                               <label for="intitule">Intitule<font color="red">*</font></label> <input type="text" name="intitule" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="journal">Journal<font color="red">*</font></label> <input type="text" name="journal" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="baseIndexation">Base d'indexation<font color="red">*</font></label>
                                                <select id="baseIndexation" class="form-control" name="baseIndexation" >
                                                    <option value="autre"></option>
                                                    <option value="type1">type1</option>
                                                    <option value="type2">type2</option>
                                                    <option value="type3">type3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="autre"> Si autre<font color="red">*</font></label><input type="text" name="autre" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <label for="datePublication">date de publication<font color="red">*</font></label><input type="date" name="datePublication" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
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
                                            <th>journal</th>
                                             <th>base d'indexation</th>
                                               <th>date de publication</th>
                                               <th>Etat</th>
                                        </tr>
                                    </thead>
                                    <tbody><c:forEach var="journal" items="${journals}">
                                        <tr>
                                            <td><input type="radio" name="journalsModifiern" value="${journal.id_journal}"></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                       
                                         
                                    </tbody>
                                </table>
                            </div>
                            		<form id="formMdifiern" class="form-horizontal" method="post" action="">
											
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
                                            <th>journal</th>
                                             <th>base d'indexation</th>
                                               <th>date de publication</th>
                                               <th>Etat</th>
                                        </tr>
                                    </thead>
                                    <tbody><c:forEach var="journal" items="${journals}">
                                        <tr>
                                            <td><input type="checkbox" name="journalsSupprime" value="${journal.id_journal}"></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
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
                            <div class="tab-pane fade" id="nonIndexe">
                                <br>
                                <ul class="nav bouton">
						<p>	
							<a href="#visulaisezn" data-toggle="tab" class="btn btn-primary">Visualiser</a>
							<a href="#ajoutern" data-toggle="tab" class="btn btn-success">Ajouter</a>
							<a href="#modifiern" data-toggle="tab" class="btn btn-warning">Modifier</a>
							<a href="#supprimern" data-toggle="tab" class="btn btn-danger">Supprimer</a>
						</p>
					</ul>
					      <div class="tab-content">
							<div class="tab-pane fade in active" id="visulaisezn">
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>journal</th>
                                             <th>base d'indexation</th>
                                               <th>date de publication</th>
                                               <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody><c:forEach var="journal" items="${journalsn}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        <c:forEach var="journal" items="${journalsparticipantn}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <c:forEach var="journal" items="${journalsvaliden}">
                                        <tr>
                                            
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        <c:forEach var="journal" items="${journalsvalideparticipantn}">
                                        <tr>
                                            
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                         
                                    </tbody>
                                </table>
                            </div>
							
							</div>
							
							
							<div class="tab-pane fade " id="ajoutern">
							<form id="formIndexe" class="form-horizontal" method="post" action="">
							<input type="hidden" name="cacher" value="ajoutern">
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
                                            <div class="form-group">
                                                <label for="auteur">Auteur(s)</label> <input type="text" name="auteur" class="form-control" placeholder="Nom1 Prenom1 , Nom2 prenom2 , ..."> 
                                            </div>
                                            <div class="form-group">
                                               <label for="intitule">Intitule<font color="red">*</font></label> <input type="text" name="intitule" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                               <label for="journal">Journal<font color="red">*</font></label> <input type="text" name="journal" class="form-control"> 
                                            </div>
                                            <div class="form-group">
                                                <label for="baseIndexation">Base d'indexation<font color="red">*</font></label>
                                                <select id="baseIndexation" class="form-control" name="baseIndexation" >
                                                    <option value="autre"></option>
                                                    <option value="type1">type1</option>
                                                    <option value="type2">type2</option>
                                                    <option value="type3">type3</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="autre"> Si autre<font color="red">*</font></label><input type="text" name="autre" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <label for="datePublication">date de publication<font color="red">*</font></label><input type="date" name="datePublication" class="form-control" > 
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">Enregistrer</button>
                                            </div>
                                        </div>
                                    </form>

							</div>
							
							
							<div class="tab-pane fade" id="modifiern">
							
								
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                       <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>journal</th>
                                             <th>base d'indexation</th>
                                               <th>date de publication</th>
                                               <th>Etat</th>
                                        </tr>
                                    </thead>
                                    <tbody><c:forEach var="journal" items="${journalsn}">
                                        <tr>
                                            <td><input type="radio" name="journalsModifier" value="${journal.id_journal}"></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
                                            <td><font color="red">En Attente</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                       
                                         
                                    </tbody>
                                </table>
                            </div>
                            		<form id="formMdifier" class="form-horizontal" method="post" action="">
											
								</form>				
                           
							</div>
							
							
							
							
								<div class="tab-pane fade" id="supprimern">
							
							<form id="formEvenement" class="form-horizontal" method="Post" action="">
									<input type="hidden" name="cacher" value="supprimer"/>
									<input type="hidden" name="id" value="${sessionScope.email }">
									
							<div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                       <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>journal</th>
                                             <th>base d'indexation</th>
                                               <th>date de publication</th>
                                               <th>Etat</th>
                                        </tr>
                                    </thead>
                                    <tbody><c:forEach var="journal" items="${journalsn}">
                                        <tr>
                                            <td><input type="checkbox" name="journalsSupprime" value="${journal.id_journal}"></td>
                                            <td><c:out value="${journal.intitule }"/></td>
                                            <td><c:out value="${journal.journal}"/></td>
                                             <td><c:out value="${journal.baseIndexation}"/></td>
                                              <td><c:out value="${journal.datePublication}"/></td>
                                        
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
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

<!-- Footer inclusion ############################################################-->

        <c:import url="include/footerInclude.jsp"></c:import>
        
<!-- ################################################################################ -->

        <script>
            $( document ).ready( function () {
                $( "#formIndexe" ).validate( {
                    rules: {
                        intitule : "required",
                        journal : "required",
                        datePublication: "required",
                        baseIndexation : "required",
                        autre : "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        journal : "champ requis",
                        datePublication: "champ requis",
                        baseIndexation : "champ requis",
                        autre : "champ requis"
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
                $( "#formNonIndexe" ).validate( {
                    rules: {
                        intitule : "required",
                        journal : "required",
                        datePublication: "required",
                        baseIndexation : "required",
                        pays : "required"
                    },
                    messages: {
                        intitule : "champ requis",
                        journal : "champ requis",
                        datePublication: "champ requis",
                        baseIndexation : "champ requis",
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
            	
            		$('input:radio[name=journalsModifier]:checked').each(function(){
            			
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
            			"<input type='hidden' name='idjournal' value="+$('input:radio[name=journalsModifier]:checked').val()+">"+
            			
            			
            				"<div class='form-group'>"+
            					"<label for='intitule'>intitule<font color='red'>*</font></label>"+
            					"<input type='text' name='intitule' class='form-control' value="+tab[1]+">"+
            				"</div>"+
            				"<div class=''>"+
                			"<div class='form-group'>"+
        					" <label for='journal'>journal<font color='red'>*</font></label>"+ 
        					"<input type='text' name='journal' class='form-control' value="+tab[2]+">"+
        				"</div>"+
        				 "<div class='form-group'>"+
                        "<label for='baseIndexation'>Base d'indexation<font color='red'>*</font></label>"+
                        "<select id='baseIndexation' class='form-control' name='baseIndexation' >"+
                           " <option value='autre'></option>"+
                            "<option value='type1'>type1</option>"+
                            "<option value='type2'>type2</option>"+
                            "<option value='type3'>type3</option>"+
                        "</select>"+
                      "</div>"+
                      "<div class='form-group'>"+
  					" <label for='autre'>Si autre<font color='red'>*</font></label>"+ 
  					"<input type='text' name='autre' class='form-control' value="+tab[3]+">"+
  				"</div>"+
            				"<div class='form-group'>"+
            					" <label for='datePublication'>date <font color='red'>*</font></label>"+ 
            					"<input type='date' name='datePublication' class='form-control' value="+tab[4]+">"+
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
            	
            		$('input:radio[name=journalsModifiern]:checked').each(function(){
            			
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
            			"<input type='hidden' name='idjournal' value="+$('input:radio[name=journalsModifiern]:checked').val()+">"+
            			
            			
            				"<div class='form-group'>"+
            					"<label for='intitule'>intitule<font color='red'>*</font></label>"+
            					"<input type='text' name='intitule' class='form-control' value="+tab[1]+">"+
            				"</div>"+
            				"<div class=''>"+
                			"<div class='form-group'>"+
        					" <label for='journal'>journal<font color='red'>*</font></label>"+ 
        					"<input type='text' name='journal' class='form-control' value="+tab[2]+">"+
        				"</div>"+
        				 "<div class='form-group'>"+
                        "<label for='baseIndexation'>Base d'indexation<font color='red'>*</font></label>"+
                        "<select id='baseIndexation' class='form-control' name='baseIndexation' >"+
                           " <option value='autre'></option>"+
                            "<option value='type1'>type1</option>"+
                            "<option value='type2'>type2</option>"+
                            "<option value='type3'>type3</option>"+
                        "</select>"+
                      "</div>"+
                      "<div class='form-group'>"+
  					" <label for='autre'>Si autre<font color='red'>*</font></label>"+ 
  					"<input type='text' name='autre' class='form-control' value="+tab[3]+">"+
  				"</div>"+
            				"<div class='form-group'>"+
            					" <label for='datePublication'>date <font color='red'>*</font></label>"+ 
            					"<input type='date' name='datePublication' class='form-control' value="+tab[4]+">"+
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

                            
