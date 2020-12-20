<!DOCTYPE html>
<html lang="en">

<head>

	<title> Communication dans une conference  </title>
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
                        <h1 class="page-header"><font color="blue"><i class="fa fa-graduation-cap fa-fw"></i> </font>Doctorant(s) Encadré(s)</h1>
                    
                    <form  class="form-horizontal" method="post" action="">
                    <input type="hidden" name="cacher" value="afficher"/>
                    <div class="table-responsive">
                    <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                             <th>nom prenom</th>
                                             <th>Email</th>
                                             <th>Activités</th>
                                             </tr>
                                              <c:set var="vari" value="1" scope="request"/>
                                      </thead>
                                    <tbody><c:forEach var="doctorant" items="${doctorants}">
                                        <tr>
                                            <td><c:out value="${vari}"/></td>
                                            <td>${doctorant.nom}&nbsp${doctorant.prenom}</td>
                                            <td>${doctorant.email }</td>
                                            <td><input type="radio" name="doctorantselect" value="${doctorant.login}"></td>
                                            
                                        </tr>
                                         <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        </c:forEach>
                                        
                                        </tbody>
                                        </table>
                                     </div>
                                     <button class="btn btn-primary pull-right">Afficher</button>
                                     </form>
                        <c:if test="${!empty formationsvalide }">
                        <br><br><br>
                        <div>
                    <div class="panel panel-info">
	                        <div class="panel-heading">
	                            <i class="fa fa-child fa-fw"></i> Formations
	                        </div>
	                        <div class="panel-body">
	                        <div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>Date de formation </th>
                                             <th>Etat</
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="formation" items="${formationsvalide}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${formation.intitule }"/></td>
                                            <td><c:out value="${formation.dateformation }"/></td>
                                            
                                            
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                         
                                    </tbody>
                                </table>
                            </div>
	                        </div>
	                 </div>
                    
                    
                    
                    
                    </div>
                    
                    </c:if>
                    <c:if test="${!empty brevetsvalide }">
                        <br>
                        <div>
                    <div class="panel panel-primary">
	                        <div class="panel-heading">
	                            <i class="fa fa-copyright  fa-fw"></i> Brevet droit
	                        </div>
	                        <div class="panel-body">
	                        <div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>Type</th>
                                            <th>Champ d'application</th>
                                             <th>numero de dépot</th>
                                             <th>numero d'enregistrement</th>
                                             
                                             <th>date de dépot</th>
                                             <th>Etat</th>
                                        </tr>
                                        <c:set var="vari" value="1" scope="request"/>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="breve" items="${brevetsvalide}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${breve.intitule }"/></td>
                                            <td><c:out value="${breve.type }"/></td>
                                            <td><c:out value="${breve.champApplication }"/></td>
                                             <td><c:out value="${breve.numeroDepot }"/></td>
                                              <td><c:out value="${breve.numeroEnregistrement }"/></td>
                                               
                                            <td><c:out value="${breve.dateDepot }"/></td>
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                        
                                        
                                        
                                        
                                        </tbody>
                                        </table>
	                        </div>
	                 </div>
	                       </div>
	                       </div>
	                  </c:if>
	                  <c:if test="${!empty ouvragesValiders }">
                        <br>
                        <div>
                    <div class="panel panel-info">
	                        <div class="panel-heading">
	                           <i class="fa fa-file-text fa-fw"></i>Ouvrage
	                        </div>
	                        <div class="panel-body">
	                        <div class="table-responsive">
                                <table class="table table-bordered">
											<tr>
												<th>intitule</th>
												<th>maison d'édition</th>
												<th>ISSN</th>
												<th>ISBN</th>
												<th>DATE</th>
												<th>Acteur(s) externe(s)</th>
												<th>Etat</th>
											</tr>
											
											<c:forEach items="${ouvragesValiders}" var="ouvrageValider">
                                                <tr>
                                                    <td>${ouvrageValider.intitule}</td>
                                                    <td>${ouvrageValider.maisonEdition}</td>
                                                    <td>${ouvrageValider.issn}</td>
                                                    <td>${ouvrageValider.isbn}</td>
                                                    <td>${ouvrageValider.dateOuvrage}</td>
                                                    <td>${ouvrageValider.acteurExterne}</td>
                                                    <td><font color="#449d44">Validé</font></td>
                                                </tr>
                                            </c:forEach>
										</table>
									</div>
	                        </div>
	                 </div>
                    
                    
                    
                    
                    </div>
                    
                    </c:if>
                    <c:if test="${!empty litterairesvalide or !empty litterairesparticipantvalide }">
                        <br>
                        <div>
                    <div class="panel panel-primary">
	                        <div class="panel-heading">
	                           <i class="fa fa-edit fa-fw"></i>Créativité littéraire
	                        </div>
	                        <div class="panel-body">
	                        <div class="table-responsive">
                                <table class="table  table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Intitule</th>
                                            <th>date </th>
                                             <th>Etat</th>
                                        </tr>
                                         <c:set var="vari" value="1" scope="request"/>
                                    </thead>
                                    <tbody>
                                       <c:forEach var="litteraire" items="${litterairesvalide}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${litteraire.intitule }"/></td>
                                            <td><c:out value="${litteraire.datelitteraire }"/></td>
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                         <c:forEach var="litteraireparticipant" items="${litterairesparticipantvalide}">
                                        <tr>
                                            <td><c:out value="${vari }"/></td>
                                            <td><c:out value="${litteraireparticipant.intitule }"/></td>
                                            <td><c:out value="${litteraireparticipant.datelitteraire }"/></td>
                                            <td><font color="green">validé</font>  </td>
                                        </tr> <c:set var="vari" value="${requestScope.vari+1 }" scope="request"/>
                                        
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
	                        
	                        </div>
	                </div>
	                 </div>
	                 </c:if>       
                    
                    
                    
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

</c:when>
<c:when test="${ empty sessionScope.etatSession}">
<jsp:forward page="accueil.jsp"/>
</c:when>
</c:choose>

</body>

</html>
