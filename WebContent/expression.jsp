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
<title>Observatoire de l'ISCAE - Expression des détails en cas de chomage ... </title>
</head>
<body >
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
		<% String expression = request.getParameterValues("idExpression")[0];
			if(expression != null) {%>
				<h2> Détails du cas de l'étudiant </h2> <br>
				<p> 
					<%= expression %> 
				</p>
		<%} else { %>
			<jsp:forward page="listerEtudiants.jsp"></jsp:forward>
		<%} %>
		</div>
		</div>
		</body>
		</html>
<%} %>
		