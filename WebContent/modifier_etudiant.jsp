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
    <% User user = (User) request.getSession().getAttribute("user"); %>
	<% if(user == null){ %>
		<b> Access denied</b>
	<%} else { 
		RequestDispatcher dispatcher ; //= request.getRequestDispatcher("/recherche_etudiant.jsp");
		request.getSession().setAttribute("user", user);
		Etudiants modele = new Etudiants();
		AncienEtudiant ancienEtudiant = modele.getAncienEtudiant(Integer.parseInt(request.getParameterValues("ancienEtudiantAModifier")[0])); 
		if(ancienEtudiant == null){
			dispatcher = request.getRequestDispatcher("/accueil.jsp");
			dispatcher.forward(request, response);
		}
		else{
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/style.css" />
<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
<script type="text/javascript" src = "/Observatoire_2013/JavaScript/doneVisibility.js"></script>
<script type="text/javascript">
function is_int(value) {
	if (parseFloat(value) == parseInt(value) && !isNaN(value)) {
		return true;
	} else {
		return false;
	}
}
function valider(formulaire) {
	for ( var i = 0; i < formulaire.elements.length; i++) {
		if (formulaire.elements[i].style.display == "block"
				&& formulaire.elements[i].value == "") {
			alert("Veillez remplir tous les champs svp , ils sont obligatoires");
			return false;
		}
	}
	if (!is_int(document.getElementById("jourNaissance").value)) {
		alert("Veillez donner un nombre entier pour votre jour de naissance");
		return false;
	} else {
		return true;
	}
}
</script>
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
                <li class="menuitem"><a href="http://localhost:8080/Observatoire_2013/listerEtudiants.jsp">Liste des étudiants</a></li>
               
                <li class="menuitem"><a href="#">Mon profil</a></li>
           </ul>
             <div >
			<ul style = "float : right;">
				<li class = "menuitem"> <a href = ""> <IMG border = "0" align = "right" src = "./images/etoile.png"> </a> 
					<ul>
						<li> <a href = ""> <%= user.getPrenom() + "  " + user.getNom() %> </a></li>
						<li> <a href="#"> Profile </a></li>
						<li> <a href="#"> Compte </a></li>
						<li> <a href="http://localhost:8080/Observatoire_2013/LogOut">Déconnexion </a> </li>
					</ul>
				</li>
			</ul>	
			</div>
        </div>
        <% try{ %>
        <div align = "center">
        <h1>Modifier les informations de l'étudiant</h1>
        <br>
	<form onsubmit = "return valider(this); " action = "/Observatoire_2013/ModifierAncienEtudiant" method = "POST">
	<div class = "collection" >
			<fieldset>
				<legend><h1>Les informations  de l'étudiant</h1></legend>
				<fieldset>
				<legend><h3>Les informations personnelles de l'étudiant</h3></legend>
				<input type = "hidden" value = "<%= ancienEtudiant.getId() %>" name = "ancienEtudiantAModifier">
				<table>
			<tr> <th> Nom : </th> <td> <input type = "text" name = "nom" value = "<%= ancienEtudiant.getNom() %>"> </td> </tr>
			<tr> <th> Prénom : </th> <td> <input type = "text" name = "prenom" value = "<%= ancienEtudiant.getPrenom() %>"> </td> </tr>
			<tr> <th> Date de Naissance : </th> <td> Jour : <input type = "text"  maxlength = "2" size = "2" name = "jourNaissance" value = "<%= ancienEtudiant.getDateNaissance().getDay() %>"> Mois :
			<select name = "moisNaissance">
				<% String[] mois = {"", "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre" }; 
					for(int i=1; i<=12; i++){%>
						<option value="<%=i%>" <% if(i == ancienEtudiant.getDateNaissance().getMonth()){ %> selected = "selected" <%} %>> <%= mois[i] %> </option>
						<%} %>
			</select>
			Année :
			<select name = "anneeNaissance">
				
				<% for(int i=1900; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
					<option value = "<%=i%>"  <% if(i == ancienEtudiant.getDateNaissance().getYear()){ %> selected = "selected" <%} %>  ><%=i %></option>
					<%} %>
				}
			</select> </td> </tr>
			<tr> <th> Email : </th> <td> <input type = "text" name = "email" value = "<%= ancienEtudiant.getEmail() %>"></td> </tr>
			<tr> <th> Numéro de téléphone : </th> <td> <input type = "text" name = "numTel" value = "<%= ancienEtudiant.getNum_telephone() %>"></td> </tr>
			<tr> <th> Adresse : </th> <td> <input type = "text" name = "adresse" value = "<%= ancienEtudiant.getAdresse() %>"> </td> </tr>
			</table>
			</fieldset>
			<fieldset>
			<table>	
			<legend><h3>Les informations d'études à l'ISCAE</h3></legend>
			<tr> <th> Matricule dans ISCAE : <input type = "text" name = "matricule_dans_iscae" maxlength = "10" value = "<%= ancienEtudiant.getMatriculeISCAE() %>" > </th></tr>
			<tr> <th> Spécialité ISCAE : </th> <td> <input type = "text" name = "spec_iscae" value = "<%= ancienEtudiant.getSpecialite_iscae() %>"></td> </tr>
			<tr> <th> Année d'entrée à l'ISCAE : </th> <td>
			<select name = "anneEntr">
					<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ 
						String anneEntre = (i-1) + "/" + i; %>
					<option value = "<%= anneEntre %>"  <% if(anneEntre.equals(ancienEtudiant.getAnnee_entree_iscae())){ %> selected = "selected" <%} %>> <%= anneEntre %></option>
					<%} %>
			</select> </td> </tr>
			<tr> <th> Année de fin de formation à l'ISCAE : </th> <td>
			<select name = "anneeQuitt">
					<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ 
						String anneeQuitt = (i-1) + "/" + i; %>
					<option value = "<%= anneeQuitt %>"  <% if(anneeQuitt.equals(ancienEtudiant.getAnnee_quitt_iscae())){ %> selected = "selected" <%} %>> <%= anneeQuitt %></option>
					<%} %>
			</select>
			</td> </tr>
			</table>
			</fieldset>
			</fieldset>
			</div>
		</fieldset>
		<% String hasContinued =  request.getParameterValues("hasContinuedStusying")[0];
		if(!hasContinued.equals(null)) {%>
		<% int idContinuteEtudes = Integer.parseInt(hasContinued);
		ContinuteEtudes continuteEtudes = modele.getContinuteEtudes(idContinuteEtudes);
		   if((continuteEtudes == null)){
			  %> <center><b> il n'a pas continue </b></center><br>
			  	 <input type = "hidden" value = "pasCont" name = "contEtud">
			  	 <input type = "hidden" value = "pasCont" name = "continuteEtudes">
			  <%} else{ %>
		<br> 
			<h1> Y avait-il une erreur ? : l'étudiant n' a jamais continué ses études ? </h1> <br> <h2></h2><input type = "radio" name = "contEtud" value = "oui" onclick="hideMe('contEtudesDiv', this)"> Oui, il y avait une erreur, il n' a jamais continué ses études <br><input type = "radio" name = "contEtud" checked  value = "non" onclick="showMe('contEtudesDiv', this)"> Non, il ne y'a pas d'erreur, et on veut modifier les informations de continuté d'études : </h2> 
			<div id = "contEtudesDiv" class = "collection">
		<fieldset>
		<legend><h2> Les informations de continuté d'études </h2></legend>
			<input type = "hidden" value = "<%= continuteEtudes.getId() %>" name = "continuteEtudes">
			<table>		
			<% Faculte faculte = modele.getFaculte(continuteEtudes.getFaculte()); %>
			<% Universite universiteDeContinute = modele.getUniversite(faculte.getUniversite()); %>
			<tr> <th> Nom de l'université : </th> <td> <input type = "text" name = "nom_univ" value = "<%= universiteDeContinute.getNom() %>"> </td> </tr>
			<tr> <th> Date de création de l'université :  </th> <td> Jour  <input type = "text" maxlength = "2" size = "2" name = "jour_cree_univ" value = "<%= universiteDeContinute.getDateCreation().getDay() %>"> Mois :
			<select name = "mois_cree_univ">
					<% for(int i=1; i<=12; i++){%>
						<option value="<%=i%>" <% if(i == universiteDeContinute.getDateCreation().getMonth()){ %> selected = "selected" <%} %>> <%= mois[i] %> </option>
						<%} %>
			</select>
			 <!-- input type = "text" name = "moisNaissance"--> Année : 
			<!-- input type = "text" name = "anneeNaissance"--> 
			<select name = "annee_cree_univ">
				
				<% for(int i=1500; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
					<option value = "<%=i%>" ><%=i %></option>
					<%} %>
				}
			</select> </td> </tr>
			<tr> <th> Pays : </th> <td> 
			<select name="pays_cont_etudes"> 
				<% for(int i=0; i<modele.tousLesPays().size(); i++){ %>
			<option value = "<%= modele.tousLesPays().get(i).getFr() %>"> <%= modele.tousLesPays().get(i).getFr() %></option>
			<%} %>
		</select> </td> </tr>
		<tr> <th> Adresse de l'université : </th> <td> <input type = "text" name = "adresse_univ" value = "<%= universiteDeContinute.getAdresse() %>"> </td> </tr>
		<tr> <th> Email de l'université : </th> <td> <input type = "text" name = "email_univ" value = "<%= universiteDeContinute.getEmail() %>"> </td> </tr>
		<tr> <th> Site web de l'université : </th> <td> <input type = "text" name = "site_web_univ" value = "<%= universiteDeContinute.getSiteWeb() %>"> </td> </tr>
		<tr> <th> Ville : </th> <td> <input type = "text" name = "vill_entr" value = "<%= modele.getVille(continuteEtudes.getVille()).getNom() %>"> </td> </tr>
		<tr> <th> Nom de la faculté : </th> <td> <input type = "text" name = "nom_faclt" value = "<%= faculte.getNom() %>"> </td> </tr>
		<tr> <th> Date de création de la faculté :  </th> <td> Jour : <input type = "text" maxlength = "2" size = "2" name = "jour_cree_faclt" value = "<%= faculte.getDateCreation().getDay() %>"> Mois :
			<select name = "mois_cree_faclt">
				<% for(int i=1; i<=12; i++){%>
						<option value="<%=i%>" <% if(i == faculte.getDateCreation().getMonth()){ %> selected = "selected" <%} %>> <%= mois[i] %> </option>
						<%} %>
			</select>
			  Année : 
			<select name = "annee_cree_faclt">
				<% for(int i=1500; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
					<option value = "<%=i%>" ><%=i %></option>
					<%} %>
			</select> </td> </tr>
		<tr> <th> Adresse de la faculté : </th> <td> <input type = "text" name = "adresse_fclt" value = "<%= faculte.getAdresse() %>"> </td> </tr>
		<tr> <th> Email de la faculté : </th> <td> <input type = "text" name = "email_fclt" value = "<%= faculte.getEmail() %>"> </td> </tr>
		<tr> <th> Site web de la faculté : </th> <td> <input type = "text" name = "site_web_fclt" value = "<%= faculte.getSiteWeb() %>"> </td> </tr>
		<tr> <th> Domaine : </th> <td>  <input type = "text" name = "domaine_etud" value = "<%= modele.getDomaineEtudes(modele.getFiliere(continuteEtudes.getFiliere()).getDomaine()).getNom() %>"> </td> </tr>
		<tr> <th> Filière : </th> <td> <input type = "text" name = "filiere" value = "<%=  modele.getFiliere(continuteEtudes.getFiliere()).getNom() %> "> </td> </tr>
		<tr> <th> Spécialité : </th> <td> <input type = "text" name = "spec"  value = "<%= modele.getSpecialite(continuteEtudes.getSpecialite()).getNom() %> "> </td> </tr>
		<tr> <th> Niveau : </th> <td> <input type = "text" name = "nveau_etud_contin"  value = "<%=  continuteEtudes.getNiveau() %> "> </td> </tr>
		<tr> <th> Date du début d'études : </th> <td> Jour : <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_debut_etudes" value = "<%=  continuteEtudes.getDateDeDebut().getDay() %> "> Mois :
											<select name = "mois_debut_etudes">
												<% for(int i=1; i<=12; i++){%>
												<option value="<%=i%>" <% if(i == continuteEtudes.getDateDeDebut().getMonth()){ %> selected = "selected" <%} %>> <%= mois[i] %> </option>
												<%} %>
											</select>
											  Année : 
											<select name = "annee_debut_etudes">
												
												<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
													<option value = "<%=i%>" ><%=i %></option>
													<%} 
												%>
												}
											</select></td>>  </tr>
		<tr> <th> Durée : </th> <td> <input type = "text" name = "duree" value = "<%=  continuteEtudes.getDuree() %> "> </td> </tr>
		</table>
		</div>
		</fieldset>
		<% } %>
		<%} else{
			  %> <center><b> il n'a pas continue </b></center><br>
			  <%}  %>
			  
		<% String hasWorked = request.getParameterValues("hasBeenEmployee")[0];
			if(!(hasWorked.equals(null))){
			Emploi emploi = modele.hasBeenEmployee(Integer.parseInt(hasWorked));
		   if(emploi == null){
			  %> <center><b> il n'a pas été employé </b></center><br>
			  	<input type = "hidden" value = "pasEmpl" name = "empl">
			  <%} else{ %>
		<h1> Y avait-il une erreur ? : l'étudiant n' a jamais été employé ? </h1> <br> <h2></h2><input type = "radio" name = "empl" value = "oui" onclick="hideMe('emplDiv', this)"> Oui, il y avait une erreur, il  n' a jamais été employé  <br><input type = "radio" name = "empl" checked  value = "non" onclick="showMe('emplDiv', this)"> Non, il ne y'a pas d'erreur, et on veut modifier les informations de son emploi : </h2>
		<div id = "emplDiv" class = "collection">
		<fieldset>
		<legend><h2> Les informations de l'emploi </h2></legend>
			<table>		
				<tr> <th> Nom de l'entreprise : </th> <td> <input type = "text" name = "entre_emploi" value = "<%= modele.getEntreprise(emploi.getEntrprise()).getNom() %>"> </td> </tr>
												<tr> <th> Date de création : </th> <td> <input type = "text"  maxlength = "2" size = "2" name = "jour_cree_entr_empl" value = "<%= modele.getEntreprise(emploi.getEntrprise()).getDateDeCreation().getDay() %>"> Mois :
											<select name = "mois_cree_entr_empl">
												<% for(int i=1; i<=12; i++){%>
												<option value="<%=i%>" <% if(i == modele.getEntreprise(emploi.getEntrprise()).getDateDeCreation().getMonth()){ %> selected = "selected" <%} %>> <%= mois[i] %> </option>
												<%} %>
											</select>
											<select name = "annee_cree_entr_empl">
												
												<% for(int i=1900; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
													<option value = "<%=i%>" <% if(i == modele.getEntreprise(emploi.getEntrprise()).getDateDeCreation().getYear()){ %> selected = "selected" <%} %>><%=i %></option>
													<%} %>
												}
											</select> </td> </tr>
									<tr> <th> Poste : </th> <td> <input type = "text" name = "poste_entre" value = "<%= emploi.getPoste() %>"> </td> </tr>
									<tr> <th> Pays : </th> <td>  <select name="pays_empl"> 
											<% for(int i=0; i<modele.tousLesPays().size(); i++){ %>
			<option value = "<%= modele.tousLesPays().get(i).getFr() %>"> <%= modele.tousLesPays().get(i).getFr() %></option>
			<%} %>
											</select> </td> </tr>
											<tr> <th> Ville : </th> <td> <input type = "text" name = "vill_empl" value = "<%= modele.getVilleEntreprise(modele.getEntreprise(emploi.getEntrprise())).getNom() %>" > </td> </tr>
											<tr> <th> Type de service : </th> <td> <input type = "text" name = "type_serv_entreprise" value = "<%= modele.getEntreprise(emploi.getEntrprise()).getTypeDeService()  %>"> </td> </tr>
											<tr> <th> Adresse de l'entreprise : </th> <td> <input type = "text" name = "adress_entreprise" value = "<%= modele.getEntreprise(emploi.getEntrprise()).getAdresse()  %>"> </td> </tr>
											<tr> <th> Email de l'entreprse : </th> <td> <input type = "text" name = "email_entreprise" value = "<%= modele.getEntreprise(emploi.getEntrprise()).getEmail()  %>"> </td> </tr>
											<tr> <th> Site web de l'entreprise : </th> <td><input type = "text" name = "site_web_entreprise" value = "<%= modele.getEntreprise(emploi.getEntrprise()).getSiteWeb()  %>"> </td> </tr>
											<tr> <th> Date du début de l'emploi : </th> <td> <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_debut_empl" value = "<%= emploi.getDateDeDebut().getDay() %>"> Mois :
											<select name = "mois_debut_empl">
												<% for(int i=1; i<=12; i++){%>
												<option value="<%=i%>" <% if(i == emploi.getDateDeDebut().getMonth()){ %> selected = "selected" <%} %>> <%= mois[i] %> </option>
												<%} %>
											</select>
											 <!-- input type = "text" name = "moisNaissance"--> Année : 
											<!-- input type = "text" name = "anneeNaissance"--> 
											<select name = "annee_debut_empl">
												<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
													<option value = "<%=i%>" <% if(i == emploi.getDateDeDebut().getYear()){ %> selected = "selected" <%} %> ><%=i %></option>
													<%} %>
											</select> </td> </tr>
											</table>
			</div>
			</fieldset>
			<%} %>
			<% } else { %>
				<center><b> il n'a pas été employé </b></center><br>
			<%} %>
			<% String hasCreatedAnEntreprise = request.getParameterValues("hasCreatedEntreprise")[0];
			if(!(hasCreatedAnEntreprise.equals(null))){
				CreationEntreprise creationEntreprise = modele.hasCreatedEntreprise(Integer.parseInt(hasCreatedAnEntreprise));
		   if((creationEntreprise == null)){
			  %> <center><b> il n'a pas créé une entreprise </b></center><br>
			  		<input type = "hidden" value = "pasCreeEntr" name = "cree_entr">
			  <%} else{ 
				Entreprise entreprise = modele.getEntreprise(creationEntreprise.getEntreprise()); %>
				<h1> Y avait-il une erreur ? : l'étudiant n' a jamais créé une entreprise ? </h1> <br> <h2></h2><input type = "radio" name = "cree_entr" value = "oui" onclick="hideMe('creeEntrDiv', this)"> Oui, il y avait une erreur, il  n' a jamais créé une entreprise <br><input type = "radio" name = "cree_entr" checked  value = "non" onclick="showMe('creeEntrDiv', this)"> Non, il ne y'a pas d'erreur, et on veut modifier les informations de son entreprise : </h2>
				<div id = "creeEntrDiv" class = "collection">
			<fieldset>	
			<legend><h2> Les informations de l'entreprise  </h2></legend>
			<table>
									<tr> <th> Nom de l'entreprise : </th> <td> <input type = "text" name = "nom_cree_entr" value = "<%=  entreprise.getNom()  %>"> </td> </tr>
									<tr> <th> Pays : </th> <td> <select name="pays_cree_entr"> 
											<% for(int i=0; i<modele.tousLesPays().size(); i++){ %>
			<option value = "<%= modele.tousLesPays().get(i).getFr() %>"> <%= modele.tousLesPays().get(i).getFr() %></option>
			<%} %>
											</select> </td> </tr>
											<tr> <th> Ville : </th> <td> <input type = "text" name = "vill_cree_entr" value = "<%= modele.getVille(modele.getEntrepriseDandVille(entreprise.getId()).getVille()).getNom() %>"> </td> </tr>
											<tr> <th> Type de service : </th> <td> <input type = "text" name = "type_serv_cree_entr" value = "<%= entreprise.getTypeDeService() %>"> </td> </tr>		
											<tr> <th> Adresse : </th> <td> <input type = "text" name = "adress_cree_entr" value = "<%= entreprise.getAdresse() %>"> </td> </tr>
											<tr> <th> Email : </th> <td> <input type = "text" name = "email_cree_entr" value = "<%= entreprise.getEmail() %>"> </td> </tr>
											<tr> <th> Site web : </th> <td> <input type = "text" name = "site_web_cree_entr" value = "<%= entreprise.getSiteWeb() %>"> </td> </tr>
											<tr> <th> Date de création : </th> <td> <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_cree_entr" value = "<%= entreprise.getDateDeCreation().getDay() %>"> Mois :
											<select name = "mois_cree_entr" value = "<%= entreprise.getDateDeCreation().getMonth() %>" >
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
											<select name = "annee_cree_entr">
												
												<% for(int i=2010; i<=Calendar.getInstance().get(Calendar.YEAR); i++){ %>
														<option value = "<%=i%>" ><%=i %></option>
														<%} %>
											</select> </td> </tr>
											</table>
											</fieldset>
											</div>
			<%} %>
			<%} else { %>
				<center><b> il n'a pas créé une entreprise </b></center><br>
			<%} %>
			<% String hasDoneElse = request.getParameterValues("hasDoneAnotheThing")[0]; 
			if(!hasDoneElse.equals(null)){
			Autre autre = modele.hasDoneAnotherThing(Integer.parseInt(hasDoneElse));
		   if((autre == null)){
			  %> <center><b> il n'a pas fourni une expression </b></center><br>
			  <input type = "hidden" value = "pasAutre" name = "autreChs">
			  <%} else{ %>
			<h1> Y avait-il une erreur ? : l'étudiant n'avait jamais  une expression à exprimer (Chomage...) ? </h1> <br> <h2></h2><input type = "radio" name = "autreChs" value = "oui" onclick="hideMe('autreChsDiv', this)"> Oui, il y avait une erreur, il  n' a jamais exprimé <br><input type = "radio" name = "autreChs" checked  value = "non" onclick="showMe('autreChsDiv', this)"> Non, il ne y'a pas d'erreur, et on veut modifier son expression : </h2>
			<div id = "autreChsDiv">								
			<fieldset>											   
			<legend><h2> Détails</h2> </legend>
							<div style = "padding-left:20px;" >	
									<textarea name = "text_area_express" value = "" rows = "5" cols = "80" > 
										<%=  autre.getAutre() %>
									</textarea> <br>
									<% int idAutre = autre.getId(); %>
									<input type = "hidden" value = "<%= idAutre %>" name = "idAutre">
							</div>
							</fieldset>
							</div>
					<%} %>
					<% }
			else{ %>
				<center><b> il n'a pas fourni une expression </b></center><br>
			<%} %>
		 <br> <br>
		<input type = "submit" value = "Sauvegarder" size = "20" style = "background-color : #00008b; color : white" onclick="valider()"> 
		</form>
		<br>
		</div>
		</div>
</body>
</html>
        <%} catch(Exception e){
        	out.print("Erreur a la modification : " + e);
        	//dispatcher = request.getRequestDispatcher("/listerEtudiants.jsp");
			///dispatcher.forward(request, response);
        	}%>
        }
<%} %>
	<%} %>