<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "modele.ContinuteEtudes" %>
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
        <% if(Integer.parseInt(request.getParameterValues("idEtudiant")[0]) <= 0){ %>
        	<table  width = "100%">
				<tr  bgcolor = "#00008b">
					<th   style = "text-align : center; color : white" width = "100%">
						Pas des resultats
					</th>
				</tr>
			</table>
        <%} else {%>
        	<% Etudiants recherche = new Etudiants();
        	ContinuteEtudes continuteEtudes = recherche.hasContinuedStuding(Integer.parseInt(request.getParameterValues("idEtudiant")[0]));
        		%>
        	<table>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Universit� :		
        			</th>
        			<td>
        				<form action="universite.jsp" method = "POST">
								<input type = "hidden" value = "<%= recherche.getUniversite(recherche.getFaculte(continuteEtudes.getFaculte()).getUniversite()).getId()%>" name = "idUniversite">
								<input type = "submit" value = " <%= recherche.getUniversite(recherche.getFaculte(continuteEtudes.getFaculte()).getUniversite()).getNom()%>">
						</form>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Facult� :		
        			</th>
        			<td>
        				<form action="faculte.jsp" method = "POST">
								<input type = "hidden" value = "<%= continuteEtudes.getFaculte()%>" name = "idFaculte">
								<input type = "submit" value = " <%= recherche.getFaculte(continuteEtudes.getFaculte()).getNom()%>">
						</form>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Fili�re :		
        			</th>
        			<td>
        				<form action="filiere.jsp" method = "POST">
								<input type = "hidden" value = "<%= continuteEtudes.getFiliere()%>" name = "idFiliere">
								<input type = "submit" value = " <%= recherche.getFiliere(continuteEtudes.getFiliere()).getNom()%>">
						</form>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Sp�cialit� :		
        			</th>
        			<td>
        				<form action="specialite.jsp" method = "POST">
								<input type = "hidden" value = "<%= continuteEtudes.getSpecialite()%>" name = "idSpecialite">
								<input type = "submit" value = " <%= recherche.getSpecialite(continuteEtudes.getSpecialite()).getNom()%>">
						</form>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Ville : 		
        			</th>
        			<td>
        				 <form action="ville.jsp" method = "POST">
								<input type = "hidden" value = "<%= continuteEtudes.getVille() %>" name = "idVille">
								<input type = "submit" value = " <%= recherche.getVille(continuteEtudes.getVille()).getNom()%>">
						</form>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Niveau : 		
        			</th>
        			<td><%= continuteEtudes.getNiveau() %>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Date du d�but : 		
        			</th>
        			<td>
        				<%= continuteEtudes.getDateDeDebut() %>
        			</td>
        		</tr>
        		<tr > 
        			<th bgcolor = "#00008b" style = "color : white">
        				Dur�e : 		
        			</th>
        			<td>
        				<%= continuteEtudes.getDuree() %>
        			</td>
        		</tr>
        	</table>
        <%} %>
        
        
        
        
        
        
        
        
</body>
</html>