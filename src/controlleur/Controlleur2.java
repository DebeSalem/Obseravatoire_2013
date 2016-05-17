package controlleur;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 * Servlet implementation class Controlleur2
 */
public class Controlleur2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controlleur2() {
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


		modele.Etudiants ajout = new modele.Etudiants();
		RequestDispatcher dispatcher = null;
		// Les informations de l'etudiant
		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		int jourN = Integer.parseInt(request.getParameter("jourNaissance"));
		int moisN = Integer.parseInt(request.getParameterValues("moisNaissance")[0]);
		int anneeN = Integer.parseInt(request.getParameterValues("anneeNaissance")[0]);
		String email = request.getParameter("email");
		String numTel = request.getParameter("numTel");
		String adresse = request.getParameter("adresse");
		String spec_iscae = request.getParameter("spec_iscae");
		String anneeEntree = request.getParameter("anneEntr");
		String anneeQuitt = request.getParameter("anneeQuitt");
		String matriculeDansISCAE = request.getParameter("matricule_dans_iscae");
		Date dateN = new Date(anneeN,moisN,jourN); 
		ajout.ajouterEtudiant(nom, prenom, dateN, email, numTel, adresse, spec_iscae, anneeQuitt, anneeEntree, matriculeDansISCAE);
		int idEtudiant = ajout.getIdEtudiant();
		System.out.println("idEtudiant " + idEtudiant);
		
		try{
		//Cas de continuté d'études
		if(request.getParameterValues("contEtud")[0].equals("oui")){
			String nom_univ = request.getParameter("nom_univ");
			int jour_cree_univ = Integer.parseInt(request.getParameter("jour_cree_univ"));
			int mois_cree_univ = Integer.parseInt(request.getParameterValues("mois_cree_univ")[0]);
			int annee_cree_univ = Integer.parseInt(request.getParameterValues("annee_cree_univ")[0]);
			Date date_cree_univ = new Date(annee_cree_univ,mois_cree_univ,jour_cree_univ);
			String pays_etud = request.getParameterValues("pays_cont_etudes")[0];
			String adresse_univ = request.getParameter("adresse_univ");
			String villeEtude = request.getParameter("vill_entr");
			String email_univ = request.getParameter("email_univ");
			String site_web_univ = request.getParameter("site_web_univ");
			String nom_faclt = request.getParameter("nom_faclt");
			String adresse_faclt = request.getParameter("adresse_fclt");
			String email_faclt = request.getParameter("email_fclt");
			String site_web_faclt = request.getParameter("site_web_fclt");
			int jour_cree_faclt = Integer.parseInt(request.getParameter("jour_cree_faclt"));
			int mois_cree_faclt = Integer.parseInt(request.getParameterValues("mois_cree_faclt")[0]);
			int annee_cree_faclt = Integer.parseInt(request.getParameterValues("annee_cree_faclt")[0]);
			Date date_cree_faclt= new Date(annee_cree_faclt,mois_cree_faclt,jour_cree_faclt);
			String domaine_etud = request.getParameter("domaine_etud");
			String filiere = request.getParameter("filiere");
			String spec = request.getParameter("spec");
			String niv_cont_etud = request.getParameter("nveau_etud_contin");
			int jour_debut_etudes = Integer.parseInt(request.getParameter("jour_debut_etudes"));
			int mois_debut_etudes = Integer.parseInt(request.getParameterValues("mois_debut_etudes")[0]);
			int annee_debut_etudes = Integer.parseInt(request.getParameterValues("annee_debut_etudes")[0]);
			Date date_debut_etudes = new Date(annee_debut_etudes,mois_debut_etudes,jour_debut_etudes);
			String duree = request.getParameter("duree");
			//
			try{
				ajout.ajouterUniversite(nom_univ, date_cree_univ, adresse_univ, email_univ, site_web_univ);
				int idUniversiteContinuteEtudes = ajout.getIdUniversite();
				int idPaysContinuteEtudes = ajout.getIdPays(pays_etud);
				ajout.ajouterVille(villeEtude, idPaysContinuteEtudes);
				int idVilleContinuteEtudes = ajout.getIdVille();
				ajout.ajouterDomaineEtudes(domaine_etud);
				int idDomaineEtud = ajout.getIdDomaineEtudes();
				ajout.ajouterFaculte(nom_faclt, date_cree_faclt, idUniversiteContinuteEtudes,idDomaineEtud, adresse_faclt, email_faclt, site_web_faclt, idVilleContinuteEtudes);
				int idFaculteContinuteEtudes = ajout.getIdFaculte();
				ajout.ajouterFiliere(filiere, idDomaineEtud);
				int idFiliereContinuteEtudes = ajout.getIdFiliere();
				ajout.ajouterSpecialite(spec, idFiliereContinuteEtudes);
				int idSpecialiteContinuteEtudes = ajout.getIdSpecialit();
				ajout.ajouterUniversiteDansPays(idUniversiteContinuteEtudes, idPaysContinuteEtudes);
				ajout.ajouterContinuteEtud(idEtudiant, idFaculteContinuteEtudes, idVilleContinuteEtudes, idFiliereContinuteEtudes, idSpecialiteContinuteEtudes, niv_cont_etud, date_debut_etudes, duree);
			}
			catch(Exception e){
			}
		}
		
		//Cas d'emploi de l'étudiant
		if(request.getParameterValues("empl")[0].equals("oui")){
			String entre_emploi = request.getParameter("entre_emploi");
			int jour_cree_entr_empl = Integer.parseInt(request.getParameter("jour_cree_entr_empl"));
			int mois_cree_entr_empl = Integer.parseInt(request.getParameterValues("mois_cree_entr_empl")[0]);
			int annee_cree_entr_empl = Integer.parseInt(request.getParameterValues("annee_cree_entr_empl")[0]);
			Date date_cree_entr_empl= new Date(annee_cree_entr_empl,mois_cree_entr_empl,jour_cree_entr_empl);
			String poste_entre = request.getParameter("poste_entre");
			String pays_empl = request.getParameterValues("pays_empl")[0];
			String vill_entr = request.getParameter("vill_empl");
			String type_serv_entreprise = request.getParameter("type_serv_entreprise");
			String adress_entreprise = request.getParameter("adress_entreprise");
			String email_entreprise = request.getParameter("email_entreprise");
			String site_web_entreprise = request.getParameter("site_web_entreprise");
			int jour_debut_empl = Integer.parseInt(request.getParameter("jour_debut_empl"));
			int mois_debut_empl = Integer.parseInt(request.getParameterValues("mois_debut_empl")[0]);
			int annee_debut_empl = Integer.parseInt(request.getParameterValues("annee_debut_empl")[0]);
			Date date_debut_empl = new Date(annee_debut_empl,mois_debut_empl,jour_debut_empl);
			//
			//
			ajout.ajouterEntreprise(entre_emploi, type_serv_entreprise,date_cree_entr_empl, adress_entreprise, email_entreprise, site_web_entreprise);
			int idEntrepriseEmploi = ajout.getIdEntreprise();
			ajout.ajouterEmploi(idEtudiant, idEntrepriseEmploi, poste_entre, date_debut_empl);
			int idPaysEmploi = ajout.getIdPays(pays_empl);
			ajout.ajouterVille(vill_entr, idPaysEmploi);
			int idVilleEmploi  = ajout.getIdVille();
			ajout.ajouterEntrepriseDansVille(idEntrepriseEmploi, idVilleEmploi);
		}
		
		
		
		//Cas de création d'une entreprise <% if(request.getParameterValues("listerEtudiants")[0].equals("ParSpecialite")){ %>cree_entr"oui
		if(request.getParameterValues("cree_entr")[0].equals("oui")){
			String nom_cree_entr = request.getParameter("nom_cree_entr");
			String pays_cree_entr = request.getParameterValues("pays_cree_entr")[0];
			String vill_cree_entr = request.getParameter("vill_cree_entr");
			String type_serv_cree_entr = request.getParameter("type_serv_cree_entr");
			String adress_cree_entr = request.getParameter("adress_cree_entr");
			String email_cree_entr = request.getParameter("email_cree_entr");
			String site_web_cree_entr = request.getParameter("site_web_cree_entr");
			int jour_cree_entr = Integer.parseInt(request.getParameter("jour_cree_entr"));
			int mois_cree_entr = Integer.parseInt(request.getParameterValues("mois_cree_entr")[0]);
			int annee_cree_entr = Integer.parseInt(request.getParameterValues("annee_cree_entr")[0]);
			Date date_cree_entr = new Date(annee_cree_entr,mois_cree_entr,jour_cree_entr);
			ajout.ajouterEntreprise(nom_cree_entr, type_serv_cree_entr, date_cree_entr, adress_cree_entr, email_cree_entr, site_web_cree_entr);
			int idEntrepriseCreee = ajout.getIdEntreprise();
			ajout.ajouterCreationEntreprise(idEtudiant, idEntrepriseCreee);
			int idPaysCreationEntreprise = ajout.getIdPays(pays_cree_entr);
			ajout.ajouterVille(vill_cree_entr, idPaysCreationEntreprise);
			int idVilleCreationEntreprise = ajout.getIdVille();
			ajout.ajouterEntrepriseDansVille(idEntrepriseCreee, idVilleCreationEntreprise);
		}
		
		
		
		//Autre cas
		if(request.getParameterValues("autre_chs")[0].equals("oui")){
			String autre = request.getParameter("text_area_express");
			ajout.ajouterAutreChose(autre, idEtudiant);
		}
		dispatcher = request.getRequestDispatcher("/listerEtudiants.jsp");
		dispatcher.forward(request, response);
		}
		catch(Exception e){
			dispatcher = request.getRequestDispatcher("/ajouter_etudiant.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
