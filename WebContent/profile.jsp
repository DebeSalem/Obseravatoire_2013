<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "modele.User" %>
    <% User user = (User) request.getSession().getAttribute("user"); %>
	<% if(user == null) { %>
		<b> Access denied</b>
	<%} else { %>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title><%= user.getPrenom() + "  " + user.getNom() + "  " %> - Observatoire de l'ISCAE </title>
		<style>
			th{
				background-color : #00008b;
				color : white;
			}
			td{
				background-color : green;
				color : white;
			}
		</style>
		</head>
		<body>	
			<div align = "center">
				<table width = "70%" >
					<tr> <th colspan = "3" height = "20%"> Mon Profil </th> </tr> 
					<tr> <th> Nom : </th> <td> <%= user.getNom() %></td> <td valign = "right" rowspan = "4" width = "25%"> <img width = "100%" height = "100%" src = "./photo.jsp?login=<%= user.getLogin() %>"> </td> </tr>
					<tr> <th> Prénom : </th> <td> <%= user.getPrenom() %></td> </tr>
					<tr> <th> Date de naissance : </th> <td> <%= user.getDateDeNaissance() %></td> </tr>
					<tr> <th> Email : </th> <td> <%= user.getEmail() %></td> </tr>
					<tr> <th> Numéro de téléphone : </th> <td> <%= user.getNumeroDeTelephone() %></td>  <th rowspan = "2"> Modifier mon profile </th></tr>
					<tr> <th> Adresse : </th> <td> <%= user.getAdresse() %> </td></tr> 
				</table>
			</div>
		</body>
		</html>
  <%} %>