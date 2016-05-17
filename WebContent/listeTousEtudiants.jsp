<%@page import="modele.Etudiants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.List" %>
    <%@ page import = "modele.AncienEtudiant" %>
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
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/style.css" />
<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
<style type="text/css">
	#submit{
		background-color : #00008b; 
		color : white
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Observatoire de l'ISCAE - Liste des anciens étudiants</title>
</head>
<body >
	<% List<AncienEtudiant> etudiants = new Etudiants().tousLesEtudiants(); %>
	<div align = "center">
		<div id="container">
		<div id="header">
        	<h1>ISCAE</h1>
			
            <h2>Observatoire des anciens étudiants</h2>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="http://localhost:8080/Observatoire_2013/accueil.jsp#">Accueil</a></li>
                <li class="menuitem"><a href="#">Etudiants</a>
                	<ul> 
						<li><a href="./ajouter_etudiant.jsp">Ajouter</a></li> 
						<li><a href="http://localhost:8080/Observatoire_2013/recherche_etudiant.jsp">Rechercher</a></li> 
					</ul> 
				</li>
                <li class="menuitem"><a href="#">Liste des étudiants</a></li>
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
		<br> <br> <br>
		<table  width = "100%">
			<tr  bgcolor = "#00008b">
				<th   style = "text-align : center; color : white" width = "100%">
					Liste des anciens étudiants
				</th>
			</tr>
		</table>
		<table>
			<tr></tr>
			<tr bgcolor = "#00008b">
				<th class = "thListeEtudiants">
					Nom
				</th>
				<th class = "thListeEtudiants">
					Prénom
				</th>
				<th class = "thListeEtudiants">
					Date de naissance
				</th>
				<th class = "thListeEtudiants">
					Email
				</th>
				<th class = "thListeEtudiants">
					Numéro de téléphone
				</th>
				<th class = "thListeEtudiants">
					Adresse
				</th>
				<th class = "thListeEtudiants">
					Spécialité ISCAE
				</th>
				<th class = "thListeEtudiants">
					Année d'entrée à l'ISCAE
				</th>
				<th class = "thListeEtudiants">
					Année de fin d'études à l'ISCAE
				</th>
				<th class = "thListeEtudiants">
					a continué ses études ?
				</th>
				<th class = "thListeEtudiants">
					a-t-il été employé ?
				</th>
				<th class = "thListeEtudiants">
					a-t-il créée une entreprise ?
				</th>
				<th class = "thListeEtudiants">
					autre situation ? (chomge...)
				</th>
			</tr> 
			<% for(int i=0; i<etudiants.size(); i++){ %>
				<tr width = "100%" bgcolor = "<% if(i%2 == 0){out.print("green");}else{out.print("#D4E7CD");}%>">
					<td>
						<%= etudiants.get(i).getNom() %>
					</td>
					<td>
						<%= etudiants.get(i).getPrenom() %>
					</td>
					<td>
						<%= etudiants.get(i).getDateNaissance() %>
					</td>
					<td>
						<%= etudiants.get(i).getEmail() %>
					</td>
					<td>
						<%= etudiants.get(i).getNum_telephone() %>
					</td>
					<td>
						<%= etudiants.get(i).getAdresse() %>
					</td>
					<td>
						<%= etudiants.get(i).getSpecialite_iscae() %>
					</td>
					<td>
						<%= etudiants.get(i).getAnnee_entree_iscae() %>
					</td>
					<td>
						<%= etudiants.get(i).getAnnee_quitt_iscae() %>
					</td>
					<td>
					
						<% if(new Etudiants().hasContinuedStuding(etudiants.get(i).getId())!= null) {%>
							<% 
								
							%>
							<form action="continuteEtudes.jsp" method = "POST">
								<input type = "hidden" value = "<%= etudiants.get(i).getId()%>" name = "idEtudiant">
								<input type = "submit" value = "Oui" id = "submit">
							</form>
						<%}else {%>
							Non
							<%} %>
					</td>
					<td>
					
						<% if(new Etudiants().hasBeenEmployee(etudiants.get(i).getId())!= null) {%>
							<% 
								
							%>
							<form action="emploi.jsp" method = "POST">
								<input type = "hidden" value = "<%= etudiants.get(i).getId()%>" name = "idEtudiant">
								<input type = "submit" value = "Oui" id = "submit">
							</form>
						<%}else {%>
							Non
							<%} %>
					</td>
					<td>
					
						<% if(new Etudiants().hasCreatedEntreprise(etudiants.get(i).getId())!= null) {%>
							<% 
								
							%>
							<form action="entreprise.jsp" method = "POST">
								<input type = "hidden" value = "<%= new Etudiants().hasCreatedEntreprise(etudiants.get(i).getId()).getEntreprise() %>" name = "idEntreprise">
								<input type = "submit" value = "Oui" id = "submit">
							</form>
						<%}else {%>
							Non
							<%} %>
					</td>
					<td>
					
						<% if(new Etudiants().hasDoneAnotherThing(etudiants.get(i).getId())!= null) {%>
								<form action="expression.jsp" method = "POST">
								<input type = "hidden" value = "<%= new Etudiants().hasDoneAnotherThing(etudiants.get(i).getId()).getAutre() %>" name = "idExpression">
								<input type = "submit" value = "Détails" id = "submit">
							</form>
						<%}else {%>
							Non
							<%} %>
					</td>
					<td>	
							<% request.getSession().setAttribute("ancienEtudiantAModifier", etudiants.get(i));
							   %>
							   <form method = "POST" action = "modifier_etudiant.jsp">
							   	<input type = "hidden" name = "ancienEtudiantAModifier" value = "<%= etudiants.get(i).getId() %>" >
							   	<input type = "submit" value = "Modifier" id = "submit">				   	
							   </form>
					</td>
				</tr>
			<%} %>
		</table>
	</div>
</body>
</html>
<% } %>