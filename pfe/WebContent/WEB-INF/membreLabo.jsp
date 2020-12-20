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
	<c:if test="${empty sessionScope.role}">
		<jsp:forward page="accueil.jsp"/>
	</c:if> 

	<div id="wrapper">
	
	<!-- Menu inclusion ############################################################-->
	
        		<c:import url="include/menuDirecteurInclude.jsp"/>
        		
   <!-- ################################################################################ -->

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><i class="fa fa-graduation-cap fa-fw"></i>Membres du laboratoire</h1>
                        <div class="panel panel-primary">
	                        <div class="panel-heading">
	                            <i class="fa fa-group  fa-fw"></i> Membres du laboratoire
	                        </div>
	                        <div class="panel-body">
	                        	<form action="membreLabo" method="post">
		                        	 <div class="table-responsive">
	                                 	<table class="table table-bordered">
	                                 		<tr>
												<th>#</th>
												<th>Nom Prenom</th>
												<th>Email</th>
												<th>GSM</th>
												<th>Etat</th>
											</tr>
											<c:forEach items="${utilisateurs}" var="utilisateur">
											<c:if test="${!empty utilisateur.grade }">
											<tr>
												<td><input type="checkbox" name="user" value="${utilisateur.login}"></td>
												<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
												<td>${utilisateur.email}</td>
												<td>${utilisateur.gsm}</td>
											<c:if test="${utilisateur.etat==true}">
												<td><font color="#449d44">Activée</font></td>
											</c:if>
											<c:if test="${utilisateur.etat==false}">
												<td><font color="red">Desactivée</font></td>
											</c:if>
											</tr>
											</c:if>
											</c:forEach>
	                                     </table>
	                                  </div>
									<div class="form-group">
										<button class="btn btn-danger pull-right" name="choix" value="desactiver">Desactiver Session</button>
										<button class="btn btn-success pull-right" name="choix" value="activer" style="margin-right:10px">Activer Session</button>
									</div>                                
								</form>
	                        </div>
                    	</div>
                    	
                    	<div class="panel panel-info">
	                        <div class="panel-heading">
	                           <i class="fa fa-group  fa-fw"></i> Doctorants inscrits au laboratoire
	                        </div>
	                        <div class="panel-body">
								<form action="membreLabo" method="post">
		                        	 <div class="table-responsive">
	                                 	<table class="table table-bordered">
	                                 		<tr>
												<th>#</th>
												<th>Nom Prenom</th>
												<th>Email</th>
												<th>GSM</th>
												<th>Etat</th>
											</tr>
											<c:forEach items="${utilisateurs}" var="utilisateur">
											<c:if test="${!empty utilisateur.cne }">
											<tr>
												<td><input type="checkbox" name="user" value="${utilisateur.login}"></td>
												<td>${utilisateur.nom}&nbsp${utilisateur.prenom}</td>
												<td>${utilisateur.email}</td>
												<td>${utilisateur.gsm}</td>
											<c:if test="${utilisateur.etat==true}">
												<td><font color="#449d44">Activée</font></td>
											</c:if>
											<c:if test="${utilisateur.etat==false}">
												<td><font color="red">Desactivée</font></td>
											</c:if>
											</tr>
											</c:if>
											</c:forEach>
	                                     </table>
	                                  </div>
									<div class="form-group">
										<button class="btn btn-danger pull-right" name="choix" value="desactiver">Desactiver Session</button>
										<button class="btn btn-success pull-right" name="choix" value="activer" style="margin-right:10px">Activer Session</button>
									</div>                               
								</form>	                        
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
    
</c:when>
<c:when test="${ empty sessionScope.etatSession}">
<jsp:forward page="accueil.jsp"/>
</c:when>
</c:choose>

</body>

</html>
