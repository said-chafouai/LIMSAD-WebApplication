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
                        <h1 class="page-header"><i class="fa fa-envelope-o fa-fw"></i> Messagerie</h1>
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
