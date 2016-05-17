<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "modele.Etudiants" %>
     <%@ page import = "javax.servlet.ServletOutputStream" %>
      <%@ page import = "java.io.IOException" %>
      <%@ page import = "java.io.InputStream" %>
      <%@ page import = "java.sql.Blob" %>
      <%@ page import = "javax.servlet.http.HttpServlet" %>
      
		<% String login = request.getParameter("login");
			  Etudiants modele = new Etudiants();
			  Blob image = null;
              ServletOutputStream out_ = response.getOutputStream();
              try {
             
              image = modele.getProfileImage(login);
			  if(image == null) { %> 
			  <font color='red'>image non trouvée pour ce  login </font>
              <% } else {
				  response.setContentType("image/gif");
				  InputStream in = image.getBinaryStream();
				  int length = (int) image.length();
				  int bufferSize = 1024;
				  byte[] buffer = new byte[bufferSize];
				  while ((length = in.read(buffer)) != -1) {
				  out_.write(buffer, 0, length);			
				} 
        }
              }
              catch (Exception e) {
          response.setContentType("text/html");
          out.println("<html><head><title>Unable To Display image</title></head>");
          out.println("<body><h4><font color='red'>Image Display Error=" + e.getMessage() +
           "</font></h4></body></html>");
          } 
		  %>