<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "modele.User" %>
    <% User user = (User) request.getSession().getAttribute("user"); %>
	<% if(user == null){ %>
		<script>
			alert("Veillez vous connecter");
		</script>
	<%} else { 
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/recherche_etudiant.jsp");
		request.getSession().setAttribute("user", user);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/style.css" />
<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
<title>Observatoire de l'ISCAE</title>
</head>
<body style = "background-image : url(./images/background_Green.png)">
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
                <li class="menuitem"><a href="http://localhost:8080/Observatoire_2013/listerEtudiants.jsp">Liste des étudiants</a></li>
               
           </ul>
           
				
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
		
        <div id="leftmenu">
 <br> <br> <br> <br>
        <div id="leftmenu_top"></div>
				
				<div id="leftmenu_main">    
                <br>
                <h3>Rechercher</h3>
                       <form method = "" action = "">
						<input type = "search" name = "searchString" ><br><br>
					
                    <input type = "radio"> Rechercher des etudiants<br>
					<input type = "radio"> Rechercher des entreprises<br>
					<input type = "radio"> Rechercher des universités<br>
					<input type = "radio"> Rechercher des facultés<br>
					<input type = "radio"> Rechercher des spécialités<br>
                     <input type = "radio"> Rechercher des filieres<br><br>
					 <input type = "submit" value = "Rechercher" size = "20">
                    
                
				</form>
                
</div>
                
              <div id="leftmenu_bottom"></div>
        </div>
        
        
        <br> <br> <br> <br> 
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        	<h1 align = "center">Observatoire de l'ISCAE </h1>
        	<p>&nbsp;</p>
           	<p>&nbsp;</p>
       	  <h3>L’observatoire de L’ISCAE</h3>
       	  <p>L’observatoire de L’ISCAE est un outil permettant de suivre les anciens étudiants de L’ISCAE et de s’informer de ce qu’ils sont devenus et sur ce que la formation à L’ISCAE leur a fourni.</p>
        	<p>&nbsp;</p>
<h3>Objectifs de l’observatoire de L’ISCAE</h3>
        	<p> L’objectif de l’observatoire est de fournir toutes les informations sur les anciens étudiants de L’ISCAE : qu’est ce qu’ils sont devenus ? , qu’ont-ils-fait après l’obtention de leurs diplômes à l’ISCAE ?, à quoi ont servi leurs spécialités ? …etc. 
			<br>Les réponses sur toutes ces questions servent à établir des statistiques claires sur l’enseignement et la formation de L’ISCAE  et présentent donc un outil essentiel au processus du développement de ce dernier (ISCAE).
			.</p>
       	  <p>&nbsp;</p>
        	<h3>Template Notes</h3>
            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          <p></p>
<p>&nbsp;</p>
        </div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3><a href="http://www.bryantsmith.com">florida web design</a></h3></div>
      </div>
   </div>
</body>
</html>
	<%} %>