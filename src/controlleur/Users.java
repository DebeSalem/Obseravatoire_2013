package controlleur;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import modele.User;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

/**
 * Servlet implementation class Users
 */
@WebServlet("/Users")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class Users extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Users() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected String getEncodedPassword(String key) throws NoSuchAlgorithmException {
		byte[] uniqueKey = key.getBytes();
		byte[] hash = null;
		hash = MessageDigest.getInstance("MD5").digest(uniqueKey);
		StringBuffer hashString = new StringBuffer();
		for ( int i = 0; i<hash.length; ++i ) {
		String hex = Integer.toHexString(hash[i]);
		if ( hex.length() == 1 ) {
		hashString.append('0');
		hashString.append(hex.charAt(hex.length()-1));
		} else {
		hashString.append(hex.substring(hex.length()-2));
		}
		}
		return hashString.toString();
		}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		modele.Etudiants ajout = new modele.Etudiants();
		RequestDispatcher dispatcher = null;
		
		
		// Les informations de l'etudiant
		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		int jourN = 14;//Integer.parseInt(request.getParameter("jourNaissance"));
		int moisN =  5;//Integer.parseInt(request.getParameterValues("moisNaissance")[0]);
		int anneeN = 2013;//Integer.parseInt(request.getParameterValues("anneeNaissance")[0]);
		Date dateN =  new Date(anneeN,moisN,jourN);
		String email = request.getParameter("email");
		String numTel = request.getParameter("num_telephone");
		String adresse = request.getParameter("adresse");
		String login = request.getParameter("login");
		String password = request.getParameter("psswd");
		
		Part filePart = request.getPart("photo");
		
		/*** Debugging help */
		System.out.println("Le jour : " + jourN);
		if(filePart == null){
			System.out.println("filePart is null");
		}
		else{
			System.out.println("filePart is not null");
		}
		
		/*****/
		
		
		dateN.setDate(jourN);
		System.out.println("Le jour : " + dateN.getDay());
		System.out.println("Le mois : " + dateN.getMonth());
		System.out.println("L'annee : " + dateN.getYear());
		
		
		
		try{
			
			ajout.ajouterUtilisateur(nom, prenom, dateN, email, numTel, adresse, login, getEncodedPassword(password),filePart);
			
			User user = ajout.getUser(login);
			
			request.getSession().setAttribute("user", user);
			dispatcher = request.getRequestDispatcher("/accueil.jsp");
			dispatcher.forward(request, response);
		}
		catch(Exception e){
			//System.out.println("Error while trying to add the user " + e);
			//dispatcher = request.getRequestDispatcher("/index.jsp");
			//dispatcher.forward(request, response);
		}
		
	}

	
}
