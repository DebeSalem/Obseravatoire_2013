<%@ page import = "modele.Etudiants" %>
      <%@ page import = "modele.User" %>
    <% User user = (User) request.getSession().getAttribute("user"); %>
	<% if(user == null){ %>
		<b> Access denied </b>
	<%} else {
		request.getSession().setAttribute("user", user);	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/style.css" />
<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
<title>Observatoire de l'ISCAE</title>
</head>
<body style = "background-image : url(./images/background_Green.png)">
	<div id="container" align = "center">
		<div id="header">
        	<h1>ISCAE</h1>
			
            <h2>Observatoire des anciens étudiants</h2>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="#">Accueil</a></li>
                <li class="menuitem"><a href="#">Etudiants</a>
                	<ul> 
						<li><a href="./ajouter_etudiant.jsp">Ajouter</a></li> 
						<li><a href="http://localhost:8080/Observatoire_2013/recherche_etudiant.jsp">Rechercher</a></li> 
					</ul> 
				</li>
                <li class="menuitem"><a href="http://localhost:8080/Observatoire_2013/listeEtudiants.jsp"><a href = "http://localhost:8080/Observatoire_2013/listerEtudiants.jsp#">Liste des étudiants</a></li>
                <li class="menuitem"><a href="#">Mon profil</a></li>
            </ul >
			<ul style = "float : right;">
				<li class = "menuitem"> <a href = ""> <IMG border = "0" align = "right" src = "./images/etoile.png"> </a> 
					<ul>
						<li> <a href="#"> Profile </a></li>
						<li> <a href="#"> Compte </a></li>
						<li> <a href="#">Déconnexion </a> </li>
					</ul>
				</li>
			</ul>	
        </div>
        <div align = "right">
				
		</div>
		
<% Etudiants etudiants = new Etudiants(); %>
	<fieldset>
		<legend>Liste</legend>
		<form method = "POST" action = "listeDesEtudiants.jsp">
	<input type = "radio" name = "listerEtudiants" value = "ParPromotion"> Par promotion
	<select name = "promotions">
		<% for(int i=0; i<etudiants.promotionsISCAE().size(); i++){ %>
			<option> <%= etudiants.promotionsISCAE().get(i) %> </option>
		<%} %>
	</select>
	<input type = "radio" name = "listerEtudiants" value = "ParSpecialite"> Par spécialité
	<select name = "specialites"?>
		<% for(int i=0; i<etudiants.sepcialitesISCAE().size(); i++){ %>
			<option> <%= etudiants.sepcialitesISCAE().get(i) %> </option>
		<%} %>
	</select><br>
	<input type = "radio" name = "listerEtudiants" value = "ParContinuteEtudes"> Par continuté d'études
	<input type = "radio" name = "listerEtudiants" value = "ParAvoirUnEmploi"> Par Emploi
	<input type = "radio" name = "listerEtudiants" value = "ParCreationEntreprise"> Par création d'une entreprise
	<br> <input type = "radio" name = "listerEtudiants" value = "TousLesEtudiants" checked> Tous les étudiants
	<br><input type = "submit" value = "Lister">
</form>
	</fieldset>
</div>
</body>
</html>
<% } %>