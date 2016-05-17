<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "modele.User" %>
       <% User user = (User) request.getSession().getAttribute("user"); %>
	<% if(user == null){ %>
		<b> Access denied</b>
	<%} else { 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/recherche_etudiant.jsp");
		request.getSession().setAttribute("user", user);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IObservatoire de l'ISCAE - Recherche des anciens �tudiants</title>
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/style.css" />
<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
</head>
<body>
	<div id="container">
		<div id="header">
        	<h1>ISCAE</h1>
			
            <h2><a style = "text-decoration : none; color : white"href="http://localhost:8080/Observatoire_2013/accueil.jsp#">Observatoire des anciens �tudiants</a></h2>
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
                <li class="menuitem"><a href="http://localhost:8080/Observatoire_2013/listeEtudiants.jsp">Liste des �tudiants</a></li>
                <li class="menuitem"><a href="#">Mon profil</a></li>
            </ul >
			<ul style = "float : right;">
				<li class = "menuitem"> <a href = ""> <IMG border = "0" align = "right" src = "./images/etoile.png"> </a> 
					<ul>
						<li> <a href="#"> Profile </a></li>
						<li> <a href="#"> Compte </a></li>
						<li> <a href="#">D�connexion </a> </li>
					</ul>
				</li>
			</ul>	
        </div>
        <div align = "right">
				
		</div>
		<br> <br> <br> <br> 
		<div align = "center">
			<form method = "POST" action = "resultRechercheEtudiants.jsp">
				<input type = "search" size = "40" name = "rechercheString"> <br> 
				<input type = "submit" class = "submit" value = "RECHERCHER" >
			</form>
		</div>
</body>
</html>
<% } %>