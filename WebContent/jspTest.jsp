<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rechercher un Etudiant</title>
<link type="text/css" rel="stylesheet" href="page.css"/></head>
<body>
<form action="http://localhost:8080/Observatoire 2013/ServletRechercher"method="POST">
<table border="0" cellspacing="0" cellpadding="0"></table>
<table  align="center" cellspacing="0" cellpadding="0" style="border-top:black;border-bottom:black;">
 <th><tr>id :<input type="text" name="id"> </th></tr><br/>
 <th><tr>Nom :<input type="text" name="nom"> </th></tr><br/>
 <th><tr>Prenom :<input type="text" name="prenom"> </th></tr>
<tr  bgcolor=""><td colspan="2" align="center"><input type="image" src="rechercher.png" height="60" width="150"></td>
</table>
</form>
</div>

</body>
</html>