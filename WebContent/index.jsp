<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.Calendar" %>
    <%@ page import = "java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="shortcut icon" href="/Observatoire_2013/images/id.png"  />
<script type="text/javascript" src = "JavaScript/inscription.js"></script>
<script type="text/javascript" src = "JavaScript/index.js"></script>
<link rel = "stylesheet" href = "CSS/form.css">
</head>
<body style = "background-image:url(./images/background_Green.png);">
	<br> 
	<h1 align = "center"> Observatoire de l'ISCAE</h1>
	<br> 
	<div   width = "65%">
					<div align = "center" >
						<form onsubmit = "return bs(this);" method = "POST" action = "http://localhost:8080/Observatoire_2013/Login">
							<fieldset style = "width : 30%;">
							<legend>Connexion</legend>
							<div class = "collection" >
							<table>
							<tr> <th> Login : <font class = "oblig"> * </font></th> <td > <input id  = "log" type = "text" name = "login" size = "20" onclick = "f()"> </td><td rowspan = "3" VALIGN="bottom" ALIGN="right"><img  style = "margin-bottom : 0" width = "70%"  src = "./images/log.jpg"> </td> </tr>
							<tr> <th > Mot de Passe : <font class = "oblig"> * </font></th> <td> <input id = "psswd" type = "password" name = "password" size = "20" > </td>  </tr>
							<tr> <th> <input type = "submit" style = "background-color:#00008b;color : white" value = "Connecter" onclick = "f()"> </th><% if(request.getSession().getAttribute("faildLogin") != null ){ %><td class = "faildLogin"> Login ou mot de passe invalide </td> <%} %> </tr>
							</table>
							</div>
							</fieldset>
						</form>
					</div>
	</div>
	
	<div align = "center">
		<br> <br> 
	<form onsubmit = "return valider(this); " method = "POST" action = "http://localhost:8080/Observatoire_2013/Users"  enctype="multipart/form-data">
	<fieldset style = "width : 60%;">
							<legend>Inscription</legend>
		<div class = "collection" >
		<table width = "100%">
			<tr>
				<th>
					Nom : <font class = "oblig"> * </font>
				</th>
				<td>
					<input type = "text" value = "nom" name = "nom" id = "nom">
				</td>
			</tr>
			<tr>
				<th>
					Prénom : <font class = "oblig"> * </font>
				</th>
				<td>
					<input type = "text" value = "prenom" name = "prenom" id = "prenom">
				</td>
			</tr>
			<tr>
				<th>
					Date de naissance : <font class = "oblig"> * </font>
				</th>
				<td>
				 Jour : <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jourNaissance" id = "jourNaissance"> Mois :
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
			</select> 
				</td>
			</tr>
			<tr>
				<th>
					Email : <font class = "oblig"> * </font>
				</th>
				<td>
					<input type = "text" value = "email" id = "email" name = "email">
				</td>
			</tr>
			<tr>
				<th>
					Numéro de téléphone : <font class = "oblig"> * </font>
				</th>
				<td>
					<input type = "text" value = "Numéro de téléphone" id = "num_telephone" name = "num_telephone">
				</td>
			</tr>
			<tr>
				<th>
					Adresse : <font class = "oblig"> * </font>
				</th>
				<td>
					<input type = "text" value = "adresse" id = "adresse" name = "adresse">
				</td>
			</tr>
			<tr>
				<th>
					Login : <font class = "oblig"> * </font>
				</th>
				<td>
					<input type = "text" maxvalue = "20" value = "login" id = "login" name = "login">
				</td>
			</tr>
			<tr>
				<th>
					Mot de passe : <font class = "oblig"> * </font>
				</th>
				<td>
					<input type = "password"  value = "" name = "psswd" id = "psswd">
				</td>
			</tr>
			<tr>
				<th>
					Retapez votre mot de passe : <font class = "oblig"> * </font>
				</th>
				<td>
					<input type = "password"  value = "" name = "repsswd" id = "repsswd">
				</td>
			</tr>
			<tr>
                    <th>
                    	Photo du profile : <font class = "oblig"> * </font>
                    </th>
                    <td> <input type="file" name="photo" size="20" id = "photo"></td>
            </tr>
			<tr>
				<th>
					<input type = "submit" style = "background-color:#00008b;color : white" value = "M'inscrire" onclick = "valider()">
				</th>
			</tr>
		</table>
		</div>>
		</fieldset>
	</form>
</div>
</body>
</html>