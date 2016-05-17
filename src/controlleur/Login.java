package controlleur;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		 modele.Etudiants verif = new modele.Etudiants();
		 modele.User user = null;
		 Users hash = new Users();
		 RequestDispatcher dispatcher = null;
		 
		 
		 String login = request.getParameter("login");
		 String psswd = request.getParameter("password");
		 
		 try {
			psswd = hash.getEncodedPassword(psswd);
			user = verif.validerLogin(login, psswd);
			if(!(user == null)){
				request.getSession().setAttribute("user", user);
				dispatcher = request.getRequestDispatcher("/accueil.jsp");
				dispatcher.forward(request, response);
			}
			else{
				dispatcher = request.getRequestDispatcher("/index.jsp");
				request.getSession().setAttribute("faildLogin", "faildLogin");
				dispatcher.forward(request, response);
			}
		} catch (NoSuchAlgorithmException e) {
			
		}
		 
		 
		 
	}

}
