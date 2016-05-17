<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import = "modele.Etudiants" %>
<%@ page import = "java.util.List" %>
<%@ page import = "modele.AncienEtudiant" %>
<%@ page import = "modele.User" %>
    <% User user = (User) request.getSession().getAttribute("user"); %>
	<% if( (user == null) || ((user != null) && (user.getType() != 1))){ %>
		<b> Access denied </b>
	<%} else{
		request.getSession().setAttribute("user", user);
		if(request.getParameterValues("listerEtudiants")[0].equals(null)){ %>
			<jsp:forward page="listeEtudiants.jsp" />
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
                <li class="menuitem"><a href="http://localhost:8080/Observatoire_2013/listeEtudiants.jsp">Liste des étudiants</a></li>
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
		<% String listingParameter = request.getParameterValues("listerEtudiants")[0];
		Etudiants modeleObject = new Etudiants();
		%>
		<% if(listingParameter.equals("ParSpecialite")){ %>
		<% String spe = request.getParameterValues("specialites")[0]; %>
		<%  List<AncienEtudiant> etudiants = modeleObject.rechercherEtudiantsParSpecialiteIscae(spe);
		request.getSession().setAttribute("listeEtudiantsAAfficher", etudiants);
		String critereDeListe = "Liste des anciens étudiants de la spécialité " + spe ;
		request.getSession().setAttribute("critereDeListe", critereDeListe); %>
		<jsp:forward page="./listeEtudiants.jsp"></jsp:forward>
		<%} %>
	<% if(listingParameter.equals("ParPromotion")){ %>
		<% String promo = request.getParameterValues("promotions")[0]; %>
		<%  List<AncienEtudiant> etudiants = modeleObject.rechercherEtudiantsParAnneeEntreeIscae(promo);
		request.getSession().setAttribute("listeEtudiantsAAfficher", etudiants);
		String critereDeListe = "Liste des anciens étudiants de la promotion " + promo ;
		request.getSession().setAttribute("critereDeListe", critereDeListe); %>
		<jsp:forward page="./listeEtudiants.jsp"></jsp:forward>
		<%} %>
	<% if(listingParameter.equals("ParContinuteEtudes")){ %>
		<%  List<AncienEtudiant> etudiants = modeleObject.EtudiantsAyantsContinueLesEtudes(); 
			request.getSession().setAttribute("listeEtudiantsAAfficher", etudiants);
			String critereDeListe = "Liste des anciens étudiants ayants continué des études";
			request.getSession().setAttribute("critereDeListe", critereDeListe); %>
			<jsp:forward page="./listeEtudiants.jsp"></jsp:forward>
			<%} %>
	<% if(listingParameter.equals("ParAvoirUnEmploi")){ %>
		<%  List<AncienEtudiant> etudiants = modeleObject.EtudiantsAyantsEuUnEmploi();
		request.getSession().setAttribute("listeEtudiantsAAfficher", etudiants);
		String critereDeListe = "Liste des anciens étudiants ayants eu un emploi";
		request.getSession().setAttribute("critereDeListe", critereDeListe); %>
		<jsp:forward page="./listeEtudiants.jsp"></jsp:forward>
		<%} %>	
	<% if(listingParameter.equals("ParCreationEntreprise")){ %>
		<%  List<AncienEtudiant> etudiants = modeleObject.EtudiantsAyantsCreeeUneEntreprise(); 
		request.getSession().setAttribute("listeEtudiantsAAfficher", etudiants);
		String critereDeListe = "Liste des anciens étudiants ayants créé une entreprise";
		request.getSession().setAttribute("critereDeListe", critereDeListe); %>
		<jsp:forward page="./listeEtudiants.jsp"></jsp:forward>
		<%} %>
	<% if(listingParameter.equals("TousLesEtudiants")){ %>
	<%  List<AncienEtudiant> etudiants = modeleObject.tousLesEtudiants(); 
		request.getSession().setAttribute("listeEtudiantsAAfficher", etudiants);
		String critereDeListe = "Liste des anciens étudiants ayants été en autre cas (chomage...) ";
		request.getSession().setAttribute("critereDeListe", critereDeListe); %>
	<jsp:forward page="listeEtudiants.jsp" />
	<%} %>
</body>
</html>
<%} %>
<%}%>