<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Envoi de fichier</title>
	<!-- inclusion Generale ############################################################"" -->
	
	<c:import url="include/headInclude.jsp"></c:import>
	
	<!-- ################################################################################ -->
</head>
<body>
	<form action="<c:url value="/upload" />" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>Envoi de fichier</legend>
			<label for="description">Description du fichier</label>
				<input type="text" id="description" name="description" value="<c:out value="${fichier.description}"/>" /> 
				<span style="color:red">${form.erreurs['description']}</span> <br /> 
				<label for="fichier">Emplacement du fichier <span style="text-color:red">*</span></label>
				<input type="file" id="fichier" name="fichier" value="<c:out value="${fichier.nom}"/>" /> 
				<span style="color:red">${form.erreurs['fichier']}</span><br/> 
				<input type="submit" value="Envoyer" class="btn btn-primary" /><br/>
				<p class="${empty form.erreurs ? 'has-success' :'has-error'}">${form.resultat}</p>
		</fieldset>
	</form>
		${bd.preuve}
		<a href="http://localhost:8181/pfe/fichiers/${bd.preuve}"> Telecharger </a>		
</body>
</html>