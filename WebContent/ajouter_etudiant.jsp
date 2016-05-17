<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.Calendar" %>
     <%@ page import = "modele.User" %>
    <% User user = (User) request.getSession().getAttribute("user"); %>
	<% if(user == null){ %>
		<b> Access denied </b>
	<%} else{
		modele.Etudiants modele = new modele.Etudiants();
		%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/style.css" />
<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/ajouter_etudiant.css" />
<script type="text/javascript" src = "/Observatoire_2013/JavaScript/doneVisibility.js"></script>
<script type="text/javascript" src = "/Observatoire_2013/JavaScript/ajouterEtudiant.js"></script>
<title>Ajouter un nouveau etudiant</title>

</head>
<body bgcolor = "#387C1C">
	<div id="container">
		<div id="header">
        	<h1>ISCAE</h1>
			
            <h2>Observatoire des anciens étudiants</h2>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="./accueil.jsp">Accueil</a></li>
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
	<div >
	<form onsubmit = "return valider(this); "  action = "/Observatoire_2013/Controlleur2" method = "POST">
		<div class = "collection" >
			
			
				
				<legend><h3>Les informations personnelles de l'étudiant</h3></legend>
				<table>
			<tr> <th> Nom : </th> <td> <input type = "text" name = "nom"> </td> </tr>
			<tr> <th> Prénom </th> <td><input type = "text" name = "prenom"> </td> </tr>
			<tr> <th> Date de Naissance : </th> <td> Jour : <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jourNaissance" id = "jourNaissance"> Mois :
			<select name = "moisNaissance">
				<option value="01">Janvier</option>
				<option value="02">Février</option> 
				<option value="03">Mars</option>
				<option value="04">Avril</option> 
				<option value="05">Mai</option>
				<option value="06">Juin</option> 
				<option value="07">Juillet</option>
				<option value="08">Aout</option> 
				<option value="09">Septembre</option>
				<option value="10">Octobre</option> 
				<option value="11">Novembre</option>
				<option value="12">Décembre</option> 
			</select>
			Année :
			<select name = "anneeNaissance">
				
				<% for(int i=1900; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
					<option value = "<%=i%>" ><%=i %></option>
					<%} %>
				}
			</select> </td> </tr>
			<tr> <th> email : </th> <td> <input type = "text" name = "email"> </td> </tr>
			<tr> <th> Numéro de téléphone : </th> <td> <input type = "text" name = "numTel"> </td> </tr>
			<tr> <th> Adresse : </th> <td>   <input type = "text" name = "adresse"> </td> </tr>
			</table>
			<fieldset>
			<table>
			<legend><h3>Les informations d'études à l'ISCAE</h3></legend>
			<tr> <th> Matricule dans ISCAE : </th> <th>  <input type = "text" name = "matricule_dans_iscae" maxlength = "10"> </th></tr>
			<tr> <th> Spécialité ISCAE : </th> <th><input type = "text" name = "spec_iscae"></th> </tr>
			<tr> <th> Année d'entrée à l'ISCAE : </th> <th>
					<select name = "anneEntr">
					<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ 
						String anneEntre = (i-1) + "/" + i; %>
					<option value = "<%= anneEntre %>"> <%= anneEntre %></option>
					<%} %>
			</select></th> </tr>
			<tr> <th> Année de fin de formation à l'ISCAE :  </th> <th>
			<select name = "anneeQuitt">
					<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ 
						String anneeQuitt = (i-1) + "/" + i; %>
					<option value = "<%= anneeQuitt %>"> <%= anneeQuitt %></option>
					<%} %>
			</select> </th> </tr>
			</table>
				</fieldset>
			<br>
			<br>
			<h1>L'étudiant a-t-il continué ses études ? <input type = "radio" name = "contEtud" value = "oui" checked onclick="showMe('contDiv', this)"> Oui <input type = "radio" name = "contEtud" value = "non" onclick="hideMe('contDiv', this)"> Non </h1> 
			<div id = "contDiv">
			<fieldset>
			<legend><h2>Les informations de continuté d'études  </h2></legend>
			<table>
			<tr> <th> Nom de l'université : </th> <td> <input type = "text" name = "nom_univ"> </td>  </tr>
			<tr> <th> Date de création de l'université :  </th> <td> Jour  <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_cree_univ"> Mois :
			<select name = "mois_cree_univ">
				<option value="01">Janvier</option>
				<option value="02">Février</option> 
				<option value="03">Mars</option>
				<option value="04">Avril</option> 
				<option value="05">Mai</option>
				<option value="06">Juin</option> 
				<option value="07">Juillet</option>
				<option value="08">Aout</option> 
				<option value="09">Septembre</option>
				<option value="10">Octobre</option> 
				<option value="11">Novembre</option>
				<option value="12">Décembre</option> 
			</select>
			 <!-- input type = "text" name = "moisNaissance"--> Année : 
			<!-- input type = "text" name = "anneeNaissance"--> 
			<select name = "annee_cree_univ">
				
				<% for(int i=1500; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
					<option value = "<%=i%>" ><%=i %></option>
					<%} %>
			</select> </td> </tr>
			<tr> <th> Pays : </th> <td>
			<select name="pays_cont_etudes"> 
				<% for(int i=0; i<modele.tousLesPays().size(); i++){ %>
			<option value = "<%= modele.tousLesPays().get(i).getFr() %>"> <%= modele.tousLesPays().get(i).getFr() %></option>
			<%} %>
		</select> </td> </tr>
		<tr> <th> Adresse de l'université : </th> <td> <input type = "text" name = "adresse_univ"> </td> </tr>
		<tr> <th> Email de l'université : </th> <td> <input type = "text" name = "email_univ"> </td> </tr>
		<tr> <th> Site web de l'université : </th> <td> <input type = "text" name = "site_web_univ"> </td> </tr>
		<tr> <th> Ville: </th> <td> <input type = "text" name = "vill_entr"> </td> </tr>
		<tr> <th> Nom de la faculté </th> <td> <input type = "text" name = "nom_faclt"> </td> </tr>
		<tr> <th> Date de création de la faculté :  </th> <td> Jour  <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_cree_faclt"> Mois :
			<select name = "mois_cree_faclt">
				<option value="01">Janvier</option>
				<option value="02">Février</option> 
				<option value="03">Mars</option>
				<option value="04">Avril</option> 
				<option value="05">Mai</option>
				<option value="06">Juin</option> 
				<option value="07">Juillet</option>
				<option value="08">Aout</option> 
				<option value="09">Septembre</option>
				<option value="10">Octobre</option> 
				<option value="11">Novembre</option>
				<option value="12">Décembre</option> 
			</select>
			 <!-- input type = "text" name = "moisNaissance"--> Année : 
			<!-- input type = "text" name = "anneeNaissance"--> 
			<select name = "annee_cree_faclt">
				
				<% for(int i=1500; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
					<option value = "<%=i%>" ><%=i %></option>
					<%} %>
				}
			</select> </td> </tr>
		<tr> <th> Adresse de la faculté : </th> <td> <input type = "text" name = "adresse_fclt"> </td> </tr>
		<tr> <th> Email de la faculté : </th> <td> <input type = "text" name = "email_fclt"> </td> </tr>
		<tr> <th> Site web de la faculté : </th> <td>  <input type = "text" name = "site_web_fclt"> </td> </tr>
		<tr> <th> Domaine : </th> <td>  <input type = "text" name = "domaine_etud"> </td> </tr>
		<tr> <th> Filière : </th> <td> <input type = "text" name = "filiere"> </td> </tr>
		<tr> <th> Spécialité : </th> <td> <input type = "text" name = "spec"> </td> </tr>
		<tr> <th> Niveau : </th> <td> <input type = "text" name = "nveau_etud_contin"> </td> </tr>
		<tr> <th> Date du début d'études : </th> <td> <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_debut_etudes"> Mois :
											<select name = "mois_debut_etudes">
												<option value="01">Janvier</option>
												<option value="02">Février</option> 
												<option value="03">Mars</option>
												<option value="04">Avril</option> 
												<option value="05">Mai</option>
												<option value="06">Juin</option> 
												<option value="07">Juillet</option>
												<option value="08">Aout</option> 
												<option value="09">Septembre</option>
												<option value="10">Octobre</option> 
												<option value="11">Novembre</option>
												<option value="12">Décembre</option> 
											</select>
											 <!-- input type = "text" name = "moisNaissance"--> Année : 
											<!-- input type = "text" name = "anneeNaissance"--> 
											<select name = "annee_debut_etudes">
												
												<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
													<option value = "<%=i%>" ><%=i %></option>
													<%} 
												%>
												}
											</select><br>  </td> </tr>
		<tr> <th> Durée : </th> <td> <input type = "text" name = "duree"> </td> </tr>
		</table>
 		</fieldset>
 		</div>
 		<br>
 		<h1> L'étudiant a-t-il été employé ?  <input type = "radio" name = "empl" value = "oui" checked onclick="showMe('emplDiv', this)"> Oui <input type = "radio" name = "empl" value = "non" onclick="hideMe('emplDiv', this)"> Non </h1>
			<div id = "emplDiv">
 		<fieldset>
		<legend>  <h2> Les informations de l'emploi </h2></legend>
				<table>
												<tr> <th> Nom de l'entreprise : </th> <td> <input type = "text" name = "entre_emploi"> </td> </tr>
												<tr> <th> Date de création : </th> <td> <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_cree_entr_empl"> Mois :
											<select name = "mois_cree_entr_empl">
												<option value="01">Janvier</option>
												<option value="02">Février</option> 
												<option value="03">Mars</option>
												<option value="04">Avril</option> 
												<option value="05">Mai</option>
												<option value="06">Juin</option> 
												<option value="07">Juillet</option>
												<option value="08">Aout</option> 
												<option value="09">Septembre</option>
												<option value="10">Octobre</option> 
												<option value="11">Novembre</option>
												<option value="12">Décembre</option> 
											</select>
											 <!-- input type = "text" name = "moisNaissance"--> Année : 
											<!-- input type = "text" name = "anneeNaissance"--> 
											<select name = "annee_cree_entr_empl">
												
												<% for(int i=1900; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
													<option value = "<%=i%>" ><%=i %></option>
													<%} %>
												}
											</select> </td> </tr>
									 <tr> <th> Poste : </th> <td> <input type = "text" name = "poste_entre"> </td> </tr>
									<tr> <th> Pays : </th> <td> <select name="pays_empl"> 
											<% for(int i=0; i<modele.tousLesPays().size(); i++){ %>
			<option value = "<%= modele.tousLesPays().get(i).getFr() %>"> <%= modele.tousLesPays().get(i).getFr() %></option>
			<%} %>
											</select> </td> </tr>
											<tr> <th> Ville: </th> <td> <input type = "text" name = "vill_empl"> </td> </tr>
											<tr> <th> Type de service : </th> <td> <input type = "text" name = "type_serv_entreprise"> </td> </tr>
											<tr> <th> Adresse de l'entreprise : </th> <td> <input type = "text" name = "adress_entreprise"> </td> </tr>
											<tr> <th> Email de l'entreprse : </th> <td> <input type = "text" name = "email_entreprise"> </td> </tr>
											<tr> <th> Site web de l'entreprise : </th> <td> <input type = "text" name = "site_web_entreprise"> </td> </tr>
											<tr> <th> Date du début de l'emploi : </th> <td> <input type = "text"  maxlength = "2" size = "2" name = "jour_debut_empl"> Mois :
											<select name = "mois_debut_empl">
												<option value="01">Janvier</option>
												<option value="02">Février</option> 
												<option value="03">Mars</option>
												<option value="04">Avril</option> 
												<option value="05">Mai</option>
												<option value="06">Juin</option> 
												<option value="07">Juillet</option>
												<option value="08">Aout</option> 
												<option value="09">Septembre</option>
												<option value="10">Octobre</option> 
												<option value="11">Novembre</option>
												<option value="12">Décembre</option> 
											</select>
											 <!-- input type = "text" name = "moisNaissance"--> Année : 
											<!-- input type = "text" name = "anneeNaissance"--> 
											<select name = "annee_debut_empl">
												
												<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
													<option value = "<%=i%>" ><%=i %></option>
													<%} %>
											</select> </td> </tr>
			</table>
			</fieldset>
			</div>							   
			<!--  Cas de création d'une entreprise-->
			<h1> L'étudiant a-t-il créé une entreprise ? <input type = "radio" name = "cree_entr" value = "oui" checked onclick="showMe('creeEntrDiv', this)"> Oui <input type = "radio" name = "cree_entr" value = "non" onclick="hideMe('creeEntrDiv', this)"> Non </h1>
			<div id = "creeEntrDiv">
			<fieldset>	
			<legend><h2> Les informations de l'entreprise  </h2></legend>
			<table>
									<tr> <th> Nom de l'entreprise : </th> <td> <input type = "text" name = "nom_cree_entr"> </td> </tr>
									<tr> <th> Pays : </th> <td> <select name="pays_cree_entr"> 
											<% for(int i=0; i<modele.tousLesPays().size(); i++){ %>
			<option value = "<%= modele.tousLesPays().get(i).getFr() %>"> <%= modele.tousLesPays().get(i).getFr() %></option>
			<%} %>
											</select> </td> </tr>
											<tr> <th> Ville : </th> <td> <input type = "text" name = "vill_cree_entr"> </td> </tr>
											<tr> <th> Type de service : </th> <td> <input type = "text" name = "type_serv_cree_entr"> </td> </tr>		
											<tr> <th> Adresse : </th> <td> <input type = "text" name = "adress_cree_entr"> </td> </tr>
											<tr> <th> Email : </th> <td> <input type = "text" name = "email_cree_entr"> </td> </tr>
											<tr> <th> Site web : </th> <td> <input type = "text" name = "site_web_cree_entr"> </td> </tr>
											<tr> <th> Date de création : </th> <td> <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_cree_entr"> Mois :
											<select name = "mois_cree_entr">
												<option value="01">Janvier</option>
												<option value="02">Février</option> 
												<option value="03">Mars</option>
												<option value="04">Avril</option> 
												<option value="05">Mai</option>
												<option value="06">Juin</option> 
												<option value="07">Juillet</option>
												<option value="08">Aout</option> 
												<option value="09">Septembre</option>
												<option value="10">Octobre</option> 
												<option value="11">Novembre</option>
												<option value="12">Décembre</option> 
											</select>
											 <!-- input type = "text" name = "moisNaissance"--> Année : 
											<!-- input type = "text" name = "anneeNaissance"--> 
											<select name = "annee_cree_entr">
												
												<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
														<option value = "<%=i%>" ><%=i %></option>
														<%} %>
											</select> </td> </tr>
											</table>
											</fieldset>
											</div>
			<h1> L'étudiant est-il en chomage ?  <input type = "radio" name = "autre_chs" value = "oui"  onclick="showMe('autreChsDiv', this)"> Oui <input type = "radio" name = "autre_chs" value = "non" onclick="hideMe('autreChsDiv', this)"> Non </h1>
			<div id = "autreChsDiv">								
			<fieldset>											   
			<legend><h2> Détails </h2> </legend>
							<div style = "padding-left:20px;" >	
									<textarea name = "text_area_express" value = "" rows = "5" cols = "80" > 
										Veillez vous vous exprimer ici
									</textarea> <br>

							</div>
							</fieldset>
							</div>
		<input type = "submit" value = "Ajouter" id = "add_button" onclick="valider()"> 	 
		</div>
	</form>
	</div>
</body>
</html>
<%}%>