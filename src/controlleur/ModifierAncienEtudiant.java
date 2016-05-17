package controlleur;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import modele.ContinuteEtudes;
import modele.CreationEntreprise;
import modele.Etudiants;
import modele.Faculte;
import modele.Universite;
import modele.Emploi;
import modele.Entreprise;
import modele.Ville;
import modele.DomaineEtudes;
import modele.Filiere;
import modele.Specialite;
import modele.Emploi;
import modele.EntrepriseDansVille;

/**
 * Servlet implementation class ModifierAncienEtudiant
 */
public class ModifierAncienEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierAncienEtudiant() {
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



		Etudiants ajout = new Etudiants();
		RequestDispatcher dispatcher = null;
		// Les informations de l'etudiant
		
		int idEtudiant = Integer.parseInt(request.getParameterValues("ancienEtudiantAModifier")[0]);
		
		if(idEtudiant < 0){
			dispatcher = request.getRequestDispatcher("/modifier_etudiant.jsp");
			dispatcher.forward(request, response);
		}
		else{
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
		java.sql.Date dateN = new Date(anneeN,moisN,jourN); 
		ajout.modifierAncienEtudiant(idEtudiant, nom, prenom, dateN, email, numTel, adresse, spec_iscae,anneeEntree , anneeQuitt, matriculeDansISCAE);
		
		/*
		 * 
		 * 
		 */
		//try{
				
				try{
					System.out.println(request.getParameterValues("contEtud")[0]);
				}
				catch(Exception e){
					System.out.println("Maraytou" + e);
				}
		
				if((request.getParameterValues("contEtud")[0].equals("pasCont"))||(request.getParameterValues("continuteEtudes")[0].equals("pasCont"))){
					System.out.println("Il n'a pas continué ses études");
				}
				else{
					
					String continute = request.getParameterValues("contEtud")[0];
					if(continute.equals("non")){ // il ne y'avait pas d'erreur, donc on modifie : 
						
						//ContinuteEtudes continuteEtudes = ajout.getContinuteEtudes(Integer.parseInt(request.getParameterValues("continuteEtudes")[0]));
						ContinuteEtudes continuteEtudes = ajout.hasContinuedStuding(idEtudiant);
						//
						Faculte faculte = ajout.getFaculte(continuteEtudes.getFaculte());
						Universite universite = ajout.getUniversite(faculte.getUniversite());
						Ville ville = ajout.getVille(continuteEtudes.getVille());
						DomaineEtudes domaineEtudes = ajout.getDomaineEtudes(faculte.getDomaine());
						Filiere filiere = ajout.getFiliere(continuteEtudes.getFiliere());
						Specialite specialite = ajout.getSpecialite(continuteEtudes.getSpecialite());					
						//
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
						String nomFiliere = request.getParameter("filiere");
						String spec = request.getParameter("spec");
						String niv_cont_etud = request.getParameter("nveau_etud_contin");
						int jour_debut_etudes = Integer.parseInt(request.getParameter("jour_debut_etudes"));
						int mois_debut_etudes = Integer.parseInt(request.getParameterValues("mois_debut_etudes")[0]);
						int annee_debut_etudes = Integer.parseInt(request.getParameterValues("annee_debut_etudes")[0]);
						Date date_debut_etudes = new Date(annee_debut_etudes,mois_debut_etudes,jour_debut_etudes);
						String duree = request.getParameter("duree");
						//
						try{
							int idPaysDeContinuteEtudes = ajout.getIdPays(pays_etud);
							ajout.modifierUniversite(universite.getId(), nom_univ, date_cree_univ, adresse_univ, email_univ, site_web_univ);
							ajout.modifierUniversiteDansPays(universite.getId(), idPaysDeContinuteEtudes);
							ajout.modifierVille(ville.getId(), villeEtude, idPaysDeContinuteEtudes);
							ajout.modifierDomainesEtudes(domaineEtudes.getId(), domaine_etud);
							ajout.modifierFaculte(faculte.getId(), nom_faclt, date_cree_faclt, universite.getId(), domaineEtudes.getId(), adresse_faclt, email_faclt, site_web_faclt, ville.getId());
							ajout.modifierFiliere(filiere.getId(), nomFiliere, domaineEtudes.getId());
							ajout.modifierSpecialite(specialite.getId(), spec, filiere.getId());
							ajout.modifierContinuteEtudes(continuteEtudes.getId(), idEtudiant, faculte.getId(), ville.getId(), filiere.getId(), specialite.getId(), niv_cont_etud, date_debut_etudes, duree);
						}
					catch(Exception e){
							dispatcher = request.getRequestDispatcher("/modifier_etudiant.jsp");
							request.getSession().setAttribute("ancienEtudiantAModifier", idEtudiant);
							dispatcher.forward(request, response);
						}
					}
					else if(continute.equals("oui")){ // Il y avait une erreur, on supprime donc la continuté de l'étudiant de ses étues
						try{
							ajout.supprimerContinuteEtudes(idEtudiant);
						}
						catch(Exception e){
							dispatcher = request.getRequestDispatcher("/modifier_etudiant.jsp");
							request.getSession().setAttribute("ancienEtudiantAModifier", idEtudiant);
							dispatcher.forward(request, response);
						}
					}
				}
				
				
				if(request.getParameterValues("empl")[0].equals("pasEmpl")){
					
					System.out.println("Il n'a pas été employé");
				}
				
				else { 
				String doneEmploi = request.getParameterValues("empl")[0];
				
				if(doneEmploi.equals("non")){ // il ne y'avait pas d'erreur, donc on modifie : 
				
					Emploi emploi = ajout.hasBeenEmployee(idEtudiant);
					Entreprise entreprise = ajout.getEntreprise(emploi.getEntrprise());
					EntrepriseDansVille entrepriseDansVille = ajout.getEntrepriseDandVille(entreprise.getId());
					Ville ville = ajout.getVille(entrepriseDansVille.getVille());
					
					
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
					try{
					int idPaysEmploi = ajout.getIdPays(pays_empl);
					ajout.modifierEntreprise(entreprise.getId(), entre_emploi, type_serv_entreprise, date_cree_entr_empl, adress_entreprise, email_entreprise, site_web_entreprise);
					ajout.modifierVille(ville.getId(), vill_entr, idPaysEmploi);
					ajout.modifiererEmploi(idEtudiant, entreprise.getId(), poste_entre, date_debut_empl);
					}
					catch(Exception e){
						dispatcher = request.getRequestDispatcher("/modifier_etudiant.jsp");
						request.getSession().setAttribute("ancienEtudiantAModifier", idEtudiant);
						dispatcher.forward(request, response);
					}
				}
				else if(doneEmploi.equals("oui")){
					try{
						ajout.supprimerEmploi(idEtudiant);
					}
					catch(Exception e){
						dispatcher = request.getRequestDispatcher("/modifier_etudiant.jsp");
						request.getSession().setAttribute("ancienEtudiantAModifier", idEtudiant);
						dispatcher.forward(request, response);
					}
				}
				}
				
				if(request.getParameterValues("cree_entr")[0].equals("pasCreeEntr")){
					System.out.println("Il n'a pas créé une entreprise");
				}
				else {
				String creeEntre = request.getParameterValues("cree_entr")[0];
				
				if(creeEntre.equals("non")){
					try{
						CreationEntreprise creationEntreprise = ajout.hasCreatedEntreprise(idEtudiant);
						Entreprise entreprise = ajout.getEntreprise(creationEntreprise.getEntreprise());
						EntrepriseDansVille entrepriseDansVille = ajout.getEntrepriseDandVille(entreprise.getId());
						Ville ville = ajout.getVille(entrepriseDansVille.getVille());
						//
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
						//
						int idPaysCreationEntreprise = ajout.getIdPays(pays_cree_entr);
						ajout.modifierVille(ville.getId(), vill_cree_entr, idPaysCreationEntreprise );
						ajout.modifierEntreprise(entreprise.getId(), nom_cree_entr, type_serv_cree_entr, date_cree_entr, adress_cree_entr, email_cree_entr, site_web_cree_entr);
					}
					catch(Exception e){
						dispatcher = request.getRequestDispatcher("/modifier_etudiant.jsp");
						request.getSession().setAttribute("ancienEtudiantAModifier", idEtudiant);
						//dispatcher.forward(request, response);
					}
					}
				
				else if(creeEntre.equals("oui")){
				
					try{
						ajout.supprimerCreationEntreprise(idEtudiant);
					}
					catch(Exception e){
						dispatcher = request.getRequestDispatcher("/modifier_etudiant.jsp");
						request.getSession().setAttribute("ancienEtudiantAModifier", idEtudiant);
						dispatcher.forward(request, response);
					}
				}
				}
				if(request.getParameterValues("autreChs")[0].equals("pasAutre")){
					System.out.println("Il n'a pas été en chomage ou autre cas");
				}
				else{
				String hasDoneOtherThing = request.getParameterValues("autreChs")[0];
				int idAutre = Integer.parseInt(request.getParameterValues("idAutre")[0]);
				if(hasDoneOtherThing.equals("non")){
					String autre = request.getParameter("text_area_express");
					ajout.modifierAutreCas(idAutre, autre, idEtudiant);
				}
				else if(hasDoneOtherThing.equals("oui")){
					try{
						ajout.supprimerAutreCas(idEtudiant);
				}
					catch(Exception e){
						dispatcher = request.getRequestDispatcher("/listerEtudiants.jsp");
						request.getSession().setAttribute("ancienEtudiantAModifier", idEtudiant);
						//dispatcher.forward(request, response);
					}
				}
				}
		/*}
		catch(Exception e){
			dispatcher = request.getRequestDispatcher("/listerEtudiants.jsp");
			request.getSession().setAttribute("ancienEtudiantAModifier", idEtudiant);
			dispatcher.forward(request, response);
		}*/
		}
	}

}
