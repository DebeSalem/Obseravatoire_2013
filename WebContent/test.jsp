<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "modele.Etudiants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
</head>
<body>
	<form method = "POST" action = "http://localhost:8080/Observatoire_2013/Test">
		<input type = "radio" name  = "contEtudes" value = "has_continued" checked> has continued <br>
		<input type = "radio" name  = "contEtudes" value = "has_not_continued"> has not continued <br>
		<select>
		<% Etudiants modele = new Etudiants(); %>
		<% for(int i=0; i<modele.tousLesPays().size(); i++){ %>
			<option value = "<%= modele.tousLesPays().get(i).getFr() %>"> <%= modele.tousLesPays().get(i).getFr() %></option>
			<%} %>
		</select>
		<input type = "submit" value = "Test">
	</form>
</body>
</html>