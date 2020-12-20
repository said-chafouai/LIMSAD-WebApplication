
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="presentation/css/bootstrap.min.css" rel="stylesheet">
<title>test de PFE</title>
<style type="text/css">
	th,td{
		text-align: center;
	}





</style>
</head>
<body>





	<a href="http://localhost:8181/pfe/fichiers/77-88.pdf">Telecharger</a>



<%-- 
<c:set var="cpt" value="1..........................................................................."/>
<c:set var="cpt" value="${cpt+1}" />
	<c:set var="cpt" value="${cpt+10}" />
<c:set var="cpt" value="${cpt+1}" />
<c:set var="cpt" value="${cpt+1}" />
<c:set var="cpt" value="${cpt+1}" />

${cpt}

 --%>
<%-- 
<form method="post" action="bonjour">

	<c:forEach items="${utilisateurs}" var="user">
		<input type="checkbox" name="prof" value="${user.login}"
			<c:forEach items="${acteurs}" var="act">
				<c:if test="${act == user.login }">checked="checked"</c:if>
			</c:forEach> 
		>
		<label>${user.nom} ${user.prenom}</label><br>
	</c:forEach>
	<select name="chef">
		<option value=""></option>
		<c:forEach items="${utilisateurs}" var="user">
			<option value="${user.login}" 
				<c:if test="${chefEquipe==user.login}"> selected="selected" </c:if>	
			 >${user.nom} ${user.prenom}</option>
		</c:forEach>
	</select>
</form>

 --%>
<!-- 
<c:out value="${choix}"/>

<form method="post" action="bonjour">

	<button name="choix" value="supprimer">Supprimer</button>
	<button name="choix" value="modifier">Modifier</button>


</form>

 -->


<!-- Affichage des ouvragesAttentes dans un tableau -->
<!-- 
<table class="table table-bordered">
	<tr>
		<th>ID</th>
		<th>intitule</th>
		<th>maison d'edition</th>
		<th>issn</th>
		<th>isbn</th>
		<th>date d'ouvrage</th>
		<th>acteur Externe</th>
		<th>validation</th>
	</tr>
<c:forEach items="${ouvragesAttentes}" var="ouvrageAttente">
	<tr>
		<td>${ouvrageAttente.id}</td>
		<td>${ouvrageAttente.intitule}</td>
		<td>${ouvrageAttente.maisonEdition}</td>
		<td>${ouvrageAttente.issn}</td>
		<td>${ouvrageAttente.isbn}</td>
		<td>${ouvrageAttente.dateOuvrage}</td>
		<td>${ouvrageAttente.acteurExterne}</td>
		<td>${ouvrageAttente.validation}</td>
	</tr>
</c:forEach>
</table> 
-->
<!-- End tableau -->









































<!-- Acteur interne -->
<!-- 
<input type="text" value="said" name="nom">

	<form action="bonjour" method="post">
		<p>
			<input type="checkbox" name="user" value="user1">
			<input type="checkbox" name="user" value="user2">
			<input type="checkbox" name="user" value="user3">
			<input type="checkbox" name="user" value="user4">		
			<input type="checkbox" name="user" value="user5">
			<button>Ajouter</button>
		</p>
	</form>
-->

<!-- 
<h1>Formulaire d'ajout</h1>
<form action="bonjour" method="post">
	<input type="hidden" name="form" value="ajouter">
	<input type="text" name="ajouter">
	<button>Ajouter</button>
</form>

<h1>Formulaire de modification</h1>
<form action="bonjour" method="post">
	<input type="hidden" name="form" value="modifier">
	<input type="text" name="modifier">
	<button>Modifier</button>
</form>


<h1>Formulaire de Supprission</h1>
<form action="bonjour" method="post">
	<input type="hidden" name="form" value="supprimer">
	<input type="text" name="supprimer">
	<button>Supprimer</button>
</form>
-->








<!-- 
<c:out value="${utilisateur.email}"/><br>
<c:out value="${utilisateur.mdp}"/><br>
<c:out value="${utilisateur.etat}"/><br>
-->


<!-- Session -->
<!-- 
<c:out value="${sessionScope.nom }"/><br>
<c:out value="${sessionScope.prenom}"/><br>
<c:out value="${sessionScope.email}"/><br>
<c:out value="${sessionScope.mdp}"/><br>
<c:out value="${sessionScope.grade}"/><br>
<c:out value="${sessionScope.cne}"/><br>
-->
<!-- End session -->


                                    
<!-- Affichage des utilisateurs dans un tableau -->
 <!-- 
<table class="table table-bordered">
	<tr>
		<th></th>
		<th>Nom Prenom</th>
	</tr>
<c:forEach items="${utilisateurs}" var="utilisateur">
	<c:if test="${!empty utilisateur.grade }">
	<tr>
		<td><input type="checkbox" name="${utilisateur.nom}${utilisateur.prenom}"></td>
		<td>${utilisateur.nom}&nbsp${utilisateur.prenom}&nbsp${utilisateur.etat}&nbsp${utilisateur.email}&nbsp${utilisateur.mdp}</td>
	</tr>
	</c:if>
</c:forEach>
</table> 
-->
<!-- End tableau -->




</body>
</html>