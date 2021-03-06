<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "modele.Entreprise" %>
    <%@ page import = "modele.Etudiants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/style.css" />
<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
<style type="text/css">
	th{
		background-color :  ##00008b;
	}
	a{
	text-decoration : none;}
</style>
<title>Observatoire de l'ISCAE</title>
</head>
<body styel = "background-image : url(./images/background_Green.png)">
	<div id="container">
		<div id="header">
        	<h1>ISCAE</h1>
			
            <h2>Observatoire des anciens �tudiants</h2>
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
        <% if(Integer.parseInt(request.getParameterValues("idEntreprise")[0]) <= 0){ %>
        	<table  width = "100%">
				<tr  bgcolor = "#00008b">
					<th   style = "text-align : center; color : white" width = "100%">
						Pas des r�sultats
					</th>
				</tr>
			</table>
        <%} else {%>
        	<% Etudiants recherche = new Etudiants();
        	Entreprise entreprise = recherche.getEntreprise(Integer.parseInt(request.getParameterValues("idEntreprise")[0]));
        		%>
        	<table>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Nom :		
        			</th>
        			<td>
        				<%= entreprise.getNom() %>
        			</td>
        		</tr><tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Type de service :		
        			</th>
        			<td>
        				<%= entreprise.getTypeDeService() %>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Date de cr�ation :		
        			</th>
        			<td>
        				<%= entreprise.getDateDeCreation() %>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Adresse :		
        			</th>
        			<td>
        				<%= entreprise.getAdresse() %>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Email :		
        			</th>
        			<td>
        				<%= entreprise.getEmail() %>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Site Web :		
        			</th>
        			<td>
        				<%= entreprise.getSiteWeb() %>
        			</td>
        		</tr>
        	</table>
        <%} %>        
</body>
</html>