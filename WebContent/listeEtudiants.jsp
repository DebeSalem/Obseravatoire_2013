<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "modele.User" %>
     <%@ page import = "modele.Emploi" %>
     <%@ page import = "modele.Entreprise" %>
    <%@ page import = "modele.Etudiants" %>
    <%@ page import = "modele.AncienEtudiant" %>
    <%@ page import = "modele.ContinuteEtudes" %>
    <%@ page import = "java.util.Calendar" %>
    <%@ page  import = "modele.Universite"%>
    <%@ page  import = "modele.Faculte"%>
     <%@ page  import = "modele.Emploi"%>
      <%@ page  import = "modele.CreationEntreprise"%>
      <%@ page import = "modele.Autre" %>
      <%@ page import = "java.util.List" %>
    <% User user = (User) request.getSession().getAttribute("user"); %>
	<% if(user == null){ %>
		<b> Access denied</b>
	<%} else { 
		RequestDispatcher dispatcher ; //= request.getRequestDispatcher("/recherche_etudiant.jsp");
		request.getSession().setAttribute("user", user);
		Etudiants modele = new Etudiants();
		List<AncienEtudiant> etudiants = (List<AncienEtudiant>) request.getSession().getAttribute("listeEtudiantsAAfficher");
		if(etudiants == null){ %>
			<b> Liste vide</b>
		<% } else { %>
			<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/style.css" />
<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
<style type="text/css">
	#submit{
		background-color : #00008b;
		color : white
	}
	a{
		text-decoration : none
	}
</style>
<title>Observatoire de l'ISCAE</title>
</head>
<body styel = "background-image : url(./images/background_Green.png)">
	<div id="container">
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
                <li class="menuitem"><a href="http://localhost:8080/Observatoire_2013/listerEtudiants.jsp">Liste étudiants</a></li>
            </ul >
			<div style = "float : right;">
			<ul >
				<li class = "menuitem">
				 <a >
				<table width = "50%">
				<tr>
				<th width = "80%">
				<img  width = "100%" src = "./photo.jsp?login=<%= user.getLogin() %>">  
               </th>
               <th>
                <IMG border = "0"  src = "./images/etoile.png">
                </th>
               </tr>
               </table>
                </a>
					<ul>
						<li style = "color : white; padding-left : 5px"> <%= user.getPrenom() + "  " + user.getNom() %> </li>
						<li> <a href="./profile.jsp"> Profile </a></li>
						<li> <a href="#"> Compte </a></li>
						<li> <a href="http://localhost:8080/Observatoire_2013/LogOut">Déconnexion </a> </li>
					</ul>
				</li>
			</ul>	
			</div>
        </div>
        <div align = "right">
				
		</div>
			
			
			<table>
			<tr  bgcolor = "#00008b">
				<th   style = "text-align : center; color : white"   colspan = "12">
					<% String critereDeListe = (String) request.getSession().getAttribute("critereDeListe");
						if(critereDeListe == null){
							critereDeListe = "";
							} %>
				<%=  critereDeListe  %>
				</th>
				<td>  <img  width = "25px" height = "25px" alt = "Imprimer cette page" onclick = "window.print();" src = "/Observatoire_2013/images/mprimante.jpg"> 
				
				</td>
			</tr>
			<tr></tr>
			<tr bgcolor = "#00008b">
				<th class = "thListeEtudiants">
					Matricule dans ISCAE
				</th>
				<th class = "thListeEtudiants">
					Nom
				</th>
				<th class = "thListeEtudiants">
					Prénom
				</th>
				<th class = "thListeEtudiants">
					Date de naissance
				</th>
				<th class = "thListeEtudiants" >
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
			<%! int numPages = 0; %>
			<%
			int count = 0;
			int increment = 1;
			int numRows = 0;
			
			String startIndexString = request.getParameter("startIndex");
			
			if(startIndexString == null) {
			startIndexString = "0";
			}
			
			int startIndex = Integer.parseInt(startIndexString);
			
			try{
			
			
			%>
			<%
			numRows = etudiants.size();
			/*Double nombreTotalDesEtudiants = modele.tousLesEtudiants().size();
			Double pourcentage = (Double) numRows/nombreTotalDesEtudiants;
			out.println(" Le nombre des étudiants ayants : " + numRows );
			out.println(" La pourcentage des étudiants ayants : " +  pourcentage);*/
			int numRecordsPerPage = 7;
			
			numPages = numRows /numRecordsPerPage;
			
			int remain = numRows % numRecordsPerPage;
			
			
			if(remain != 0){
			
			numPages = numPages + 1;
			
			}
			
			if((startIndex + numRecordsPerPage) <= numRows) {
			
			increment = startIndex + numRecordsPerPage;
			}
			else{
			
			if (remain == 0){
			
			increment = startIndex + numRecordsPerPage;
			
			}else{
			
			increment = startIndex + remain;
			}
			}
			%>
			<% for(int i = startIndex -1 ; i <= increment; i++ ){ %>
				<tr width = "100%" bgcolor = "<% if(i%2 == 0){out.print("green");}else{out.print("#D4E7CD");}%>">
					<td>
						<%= etudiants.get(i).getMatriculeISCAE() %>
					</td>
					<td>
						<%= etudiants.get(i).getNom() %>
					</td>
					<td>
						<%= etudiants.get(i).getPrenom() %>
					</td>
					<td>
						<%= etudiants.get(i).getDateNaissance() %>
					</td>
					<td >
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
					
						<% if(modele.hasContinuedStuding(etudiants.get(i).getId())!= null) {%>
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
					
						<% if(modele.hasBeenEmployee(etudiants.get(i).getId())!= null) {%>
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
					
						<% if(modele.hasCreatedEntreprise(etudiants.get(i).getId())!= null) {%>
							<% 
								
							%>
							<form action="entreprise.jsp" method = "POST">
								<input type = "hidden" value = "<%= modele.hasCreatedEntreprise(etudiants.get(i).getId()).getEntreprise() %>" name = "idEntreprise">
								<input type = "submit" value = "Oui" id = "submit">
							</form>
						<%}else {%>
							Non
							<%} %>
					</td>
					<td>
					
						<% if(modele.hasDoneAnotherThing(etudiants.get(i).getId())!= null) {%>
								<form action="expression.jsp" method = "POST">
								<input type = "hidden" value = "<%= modele.hasDoneAnotherThing(etudiants.get(i).getId()).getAutre() %>" name = "idExpression">
								<input type = "submit" value = "Détails" id = "submit">
							</form>
						<%}else {%>
							Non
							<%} %>
					</td>
					<td>	
							 <form method = "POST" action = "modifier_etudiant.jsp"> 
							   	<input type = "hidden" name = "ancienEtudiantAModifier" value = "<%= etudiants.get(i).getId() %>" >
							   	<% if(!(modele.hasContinuedStuding(etudiants.get(i).getId()) == null)) {%>
							   		<input type = "hidden" value = "<%= modele.hasContinuedStuding(etudiants.get(i).getId()).getId() %>" name = "hasContinuedStusying">
							 	<%}else{ %>
							 		<input type = "hidden" value = "-1" name = "hasContinuedStusying">
							 	<% } %>
							 	<% if(!(modele.hasBeenEmployee(etudiants.get(i).getId()) == null)) {%>
							   		<input type = "hidden" value = "<%= etudiants.get(i).getId() %>" name = "hasBeenEmployee">
							 	<%}else{ %>
						 		<input type = "hidden" value = "-1" name = "hasBeenEmployee">
							 	<% } %>
							 	<% if(!(modele.hasCreatedEntreprise(etudiants.get(i).getId()) == null)) {%>
							   		<input type = "hidden" value = "<%= etudiants.get(i).getId() %>" name = "hasCreatedEntreprise">
							 	<%} else{ %>
						 		<input type = "hidden" value = "-1" name = "hasCreatedEntreprise">
							 	<% } %>
							 	<% if(!(modele.hasDoneAnotherThing(etudiants.get(i).getId())== null)) {%>
							   		<input type = "hidden" value = "<%= etudiants.get(i).getId() %>" name = "hasDoneAnotheThing">
							 	<%} else{ %>
						 		<input type = "hidden" value = "-1" name = "hasDoneAnotheThing">
							 	<% } %>
							   	<input type = "submit" value = "Modifier" id = "submit">				   	
							   </form>
					</td>
				</tr>
			<%} %>
			</table>
			<br>
			<br>
			<table width = "100%">
			<tr>
			
			<form target="_top" name = "viewForm" action="listeEtudiants.jsp" method="post">
			<td> 
			<%=  critereDeListe  %> : 
			<% if(startIndex + numRecordsPerPage < numRows){%>
			<%= "	 "+ startIndex %> - <%= increment - 1 %>
			<%}else{%>
			<%= " 	 " + startIndex %> - <%= numRows %>
			<%}%>
			sur <%= etudiants.size() %> étudiants
			</td>
			<th>
				</th>
			<%if(startIndex != 1) {%>
			<td>
			<a href="listeEtudiants.jsp?startIndex=<%=startIndex-numRecordsPerPage%>" id = "submit">Précédent</a>
			<%}%>
			</td>
			<%increment = numRecordsPerPage;%>
			<%if(startIndex + numRecordsPerPage <= numRows){%>
			<td>
			<a href="listeEtudiants.jsp?startIndex=<%=startIndex + numRecordsPerPage %>" id = "submit">Suivant</a>
			<%}%>
			</td>
			</tr>
			</table>
			<%
			}catch(Exception exc){ %>
			
			<% } // end try-catch%>
			
			</form>
			</div>
			</body>
			</html>
		
		<%} %>
		<%} %>