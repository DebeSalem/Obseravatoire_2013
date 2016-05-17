package modele;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;

public class Etudiants {
	
	private static String driver = "com.mysql.jdbc.Driver";
	private static String db = "jdbc:mysql://localhost:3306/projet";
	private static String user = "root";
	private static String password = "";
	//
	private static Connection conn;
	private static Statement stmt;
	private static ResultSet result;
	//
	private  String insert;
	//
	private static void connecter()
	{
				try {
					Class.forName(driver);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					// tu sais pas bien coder///
					
					e.printStackTrace();
				}
				try {
					conn = DriverManager.getConnection(db,user,password);
					stmt = conn.createStatement();
				} 
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
	}
	
	public int getIdEtudiant(){
		String req = "SELECT MAX(id) FROM  anc_etudiant;";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
				id = result.getInt("MAX(id)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	
	public int getIdUniversite(){
		String req = "SELECT MAX(id) FROM  universite;";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
				id = result.getInt("MAX(id)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	public int getIdFaculte(){
		String req = "SELECT MAX(id) FROM faculte;";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
				id = result.getInt("MAX(id)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	public int getIdVille(){
		String req = "SELECT MAX(id) FROM ville;";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
				id = result.getInt("MAX(id)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	public int getIdFiliere(){
		String req = "SELECT MAX(id) FROM  filiere;";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
				id = result.getInt("MAX(id)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	public int getIdSpecialit(){
		String req = "SELECT MAX(id) FROM specialite;";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
				id = result.getInt("MAX(id)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	public int getIdPays(String nomPays){
		String req = "SELECT id FROM pays WHERE fr = '"+nomPays+"';";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
			 id = result.getInt("id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	
	public int getIdEntreprise(){
		String req = "SELECT MAX(id) FROM  entreprise;";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
				id = result.getInt("MAX(id)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	private void inserer(){
		try{
			connecter();
			stmt.execute("SET foreign_key_checks = 0;");
			stmt.execute(insert);
			stmt.execute("SET foreign_key_checks = 1;");
			conn.close();
		}
		catch(Exception e){
			System.out.println("Erreur lors de l'ajout " + e);
		}
	}
	private String delete;
	private void supprimer(){
		try{
			connecter();
			stmt.execute("SET foreign_key_checks = 0;");
			stmt.execute(delete);
			stmt.execute("SET foreign_key_checks = 1;");
			conn.close();
		}
		catch(Exception e){
			System.out.println("Erreur lors de la suppression " + e);
		}
	}
	private String update ;
	private  void modifier(){
		try{
			connecter();
			stmt.execute("SET foreign_key_checks = 0;");
			stmt.executeUpdate(update);
			stmt.execute("SET foreign_key_checks = 1;");
			conn.close();
		}
		catch(Exception e){
			System.out.println("Erreur ç la modification  " + e);
		}
	}
	public void setForeignKeyOn()
	{
		try{
			connecter();
			stmt.execute("SET foreign_key_checks = 1");
			conn.close();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	
	public void setForeignKeyOff()
	{
		try{
			connecter();
			stmt.execute( "SET foreign_key_checks = 0");
			conn.close();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public  void ajouterEtudiant(String nom, String prenom, Date dateNaissance,
			String email, String num_telephone, String adresse,
			String specialite_iscae, String annee_quitt_iscae,
			String annee_entree_iscae, String matriculeDansISCAE){
		String dateN = dateNaissance.getYear() + "-" + dateNaissance.getMonth() + "-" + dateNaissance.getDay();
		 insert = "INSERT into anc_etudiant (nom,prenom,dateNaissance,email,num_telephone,adresse,specialite_iscae,annee_quitt_iscae,annee_entree_iscae, Matricule_dans_ISCAE) VALUES ('"+nom+"','"+prenom+"','"+dateN+"','"+email+"','"+num_telephone+"','"+adresse+"','"+specialite_iscae+"','"+annee_quitt_iscae+"','"+annee_entree_iscae+"', '"+matriculeDansISCAE+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur a l'ajout de l'etudiant " + e);
		}
	}
	
	public  void ajouterContinuteEtud(int id_etudiant, int faculte , int ville, int filiere , int specialit ,String niveau, Date dateDebut, String duree){
		String dateDebutString = dateDebut.getYear() + "-" + dateDebut.getMonth() + "-" + dateDebut.getDay();
		 insert = "INSERT into continute_etud (id_etudiant, faculte ,  ville,  filiere , specialit , niveau, date_debut, duree) VALUES ('"+id_etudiant+"','"+faculte+"','"+ville+"','"+filiere+"','"+specialit+"','"+niveau+"','"+dateDebutString+"','"+duree+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public  void ajouterUniversite(String nom, Date dateCreation,	String adresse , String email, String siteWeb){
		String dateCreationString = dateCreation.getYear() + "-" + dateCreation.getMonth() + "-" + dateCreation.getDay();
		 insert = "INSERT into universite (nom , date_creation, adresse, email, site_web) VALUES ('"+nom+"','"+dateCreationString+"','"+adresse+"','"+email+"','"+siteWeb+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur lors de l'ajout de l'université " + e);
		}
	}
	
	public  void ajouterFaculte(String nom, Date dateCreation, int universite ,int domaine,String adresse,	String email ,  String siteWeb , int ville){
		String dateCreationString = dateCreation.getYear() + "-" + dateCreation.getMonth() + "-" + dateCreation.getDay();
		 insert = "INSERT into faculte (nom ,date_creation,universite,domaine,  adresse, email, site_web, ville) VALUES ('"+nom+"','"+dateCreationString+"','"+universite+"','"+domaine+"','"+adresse+"','"+email+"','"+siteWeb+"','"+ville+"');";
		try{
			connecter();
			stmt.execute("SET foreign_key_checks = 0;");
			stmt.execute(insert);
			stmt.execute("SET foreign_key_checks = 1;");
			conn.close();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	
	public  void ajouterDomaineEtudes(String nom){
		 insert = "INSERT into domaineetudes(nom) VALUES ('"+nom+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public int getIdDomaineEtudes(){
		String req = "SELECT MAX(id) FROM domaineetudes;";
		int id =0;
		connecter();
		try {
			result = stmt.executeQuery(req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next())
				id = result.getInt("MAX(id)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	public  void ajouterVille(String nom, int pays){
		 insert = "INSERT into ville (nom ,pays) VALUES ('"+nom+"','"+pays+"');";
		try{
			connecter();
			stmt.execute("SET foreign_key_checks = 0;");
			stmt.execute(insert);
			stmt.execute("SET foreign_key_checks = 1;");
			conn.close();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e.getMessage());
		}
	}
	public void ajouterFiliere(String nom, int idDomaineEtud){
		
		insert = "INSERT into filiere (nom, domaine) VALUES ('"+nom+"', '"+idDomaineEtud+"');";
		try{
			connecter();
			//stmt.execute("SET foreign_key_checks = 0;");
			stmt.execute(insert);
			//stmt.execute("SET foreign_key_checks = 1;");
			conn.close();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public  void ajouterSpecialite(String nom, int filiere){
		 insert = "INSERT into specialite (nom ,filiere) VALUES ('"+nom+"','"+filiere+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public  void ajouterUniversiteDansPays(int universite, int pays){
		 insert = "INSERT into universite_dans_pays (universite , pays) VALUES ('"+universite+"','"+pays+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	//
	//
	public  void ajouterEntreprise(String nom, String typeDeService , Date dateDeCreation , String adresse , String email , String siteWeb){
		String dateCreationString = dateDeCreation.getYear() + "-" + dateDeCreation.getMonth() + "-" + dateDeCreation.getDay();
		 insert = "INSERT into entreprise (nom , type_serv , date_creat , adresse , email , site_web) VALUES ('"+nom+"','"+typeDeService+"', '"+dateCreationString+"', '"+adresse+"','"+email+"','"+siteWeb+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public  void ajouterEmploi(int idEtudiant, int idEntreprise , String poste , Date dateDeDebutDEmploi){
		String dateDeDebutDEmploiString = dateDeDebutDEmploi.getYear() + "-" + dateDeDebutDEmploi.getMonth() + "-" + dateDeDebutDEmploi.getDay();
		 insert = "INSERT into emploi (etudiant, entreprise , poste , date_Debut) VALUES ('"+idEtudiant+"','"+idEntreprise+"','"+poste+"', '"+dateDeDebutDEmploiString +"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public void ajouterUtilisateur(String nom, String prenom, Date dateDeNaissance, String email, String numeroDeTelephone, String adresse, String login, String password,Part filePart){
		String dateN = dateDeNaissance.getYear() + "-" + dateDeNaissance.getMonth() + "-" + dateDeNaissance.getDay();
		InputStream inputStream = null;
          if (!(filePart == null)) {
              try {
				inputStream = filePart.getInputStream();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("Error while trying to add the user " + e);
				e.printStackTrace();
			}
          }
          try {
              connecter();
              String sql = "INSERT INTO user (photo,nom, prenom, dateNaissance, email, num_telephone, adresse, login, password, type) VALUES (?, ?, ?,?,?,?, ?, ?,?,?);";
              PreparedStatement statement = conn.prepareStatement(sql);

              if (!(inputStream == null)) {
                  statement.setBlob(1, inputStream);
              }

              statement.setString(2, nom);
              statement.setString(3, prenom);
              statement.setString(4, dateN);
              statement.setString(5, email);
              statement.setString(6, numeroDeTelephone);
              statement.setString(7, adresse);
              statement.setString(8, login);
              statement.setString(9, password);
              statement.setInt(10, 0);
              
              int row = statement.executeUpdate();
            
          } catch (SQLException ex) {
        	  System.out.println("Error while trying to add the user " + ex);
              ex.printStackTrace();
          } 
          finally {
              if (conn != null) {
                  try {
                      conn.close();
                  } catch (SQLException ex) {
                	  System.out.println("Error while trying to add the user " + ex);
                      ex.printStackTrace();
                  }
              }
          }
	}
	
	public Blob getProfileImage(String login){
		
		Blob image = null;
		String recherche = "select photo from user where login = '"+login+"';  ";
		try {
			result = stmt.executeQuery(recherche);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(result.next()){
				try {
					image = result.getBlob(1);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}
	
	public  void ajouterEntrepriseDansVille(int entreprise, int ville){
		 insert = "INSERT into entreprise_dans_ville (ville , entreprise) VALUES ('"+ville+"','"+entreprise+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public  void ajouterCreationEntreprise(int idEtudiant , int entreprise){
		 insert = "INSERT into creation_entreprise(etudiant , entreprise) VALUES ('"+idEtudiant+"','"+entreprise+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public  void ajouterAutreChose(String autre, int idEtudiant){
		 insert = "INSERT into autre(autre, etudiant) VALUES ('"+autre+"', '"+idEtudiant+"');";
		try{
			inserer();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	
	//**************/
	public java.util.List<AncienEtudiant> tousLesEtudiants(){
		
		List<AncienEtudiant> etudiants = new ArrayList<AncienEtudiant>();
		try{
			connecter();
			String recherche = "SELECT * FROM anc_etudiant;";
			result = stmt.executeQuery(recherche);
			while(result.next()){
				String adresse = result.getString("adresse");
				String annee_entree_iscae = result.getString("annee_entree_iscae");
				String annee_quitt_iscae = result.getString("annee_quitt_iscae");
				java.sql.Date dateNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String num_telephone = result.getString("num_telephone");
				String prenom = result.getString("prenom");
				String specialite_iscae = result.getString("specialite_iscae");
				String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
				etudiants.add(new AncienEtudiant(id, nom,prenom,   dateNaissance, email,  num_telephone,  adresse, specialite_iscae,  annee_quitt_iscae,annee_entree_iscae,matriculeISCAE));
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche des étudiants hh  " + e);
			//return null;
		}
		return etudiants;
	}
public java.util.List<AncienEtudiant> tousLesEtudiants(int debut, int nombreDeLignes){
		
		List<AncienEtudiant> etudiants = new ArrayList<AncienEtudiant>();
		try{
			connecter();
			String recherche = "SELECT * FROM anc_etudiant LIMIT "+debut+", "+nombreDeLignes+";";
			result = stmt.executeQuery(recherche);
			while(result.next()){
				String adresse = result.getString("adresse");
				String annee_entree_iscae = result.getString("annee_entree_iscae");
				String annee_quitt_iscae = result.getString("annee_quitt_iscae");
				java.sql.Date dateNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String num_telephone = result.getString("num_telephone");
				String prenom = result.getString("prenom");
				String specialite_iscae = result.getString("specialite_iscae");
				String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
				etudiants.add(new AncienEtudiant(id, nom,prenom,   dateNaissance, email,  num_telephone,  adresse, specialite_iscae,  annee_quitt_iscae,annee_entree_iscae, matriculeISCAE));
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche des étudiants hh  " + e);
			//return null;
		}
		return etudiants;
	}
public ContinuteEtudes hasContinuedStuding(int idEtudiantR){
		
		ContinuteEtudes continuteEtudes = null;
		
		try{
			connecter();
			String recherche = "SELECT * FROM continute_etud WHERE id_etudiant = '"+idEtudiantR+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				java.sql.Date dateDebut = (result.getDate("date_debut"));
				String duree = (result.getString("duree"));
				int faculte = (result.getInt("faculte"));
				int filiere = (result.getInt("filiere"));
				int id = (result.getInt("id"));
				int idEtudiant = (result.getInt("id_etudiant"));
				String niveau  = (result.getString("niveau"));
				int specialite = (result.getInt("specialit"));
				int ville = (result.getInt("ville"));
				continuteEtudes = new ContinuteEtudes(id, idEtudiant, faculte, ville, filiere, specialite, niveau, dateDebut, duree);
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche de contunité d'études  " + e);
			//return null;
		}
		return continuteEtudes;
	}
	
	public List<AncienEtudiant> rechercherEtudiants(String rechercheString)
	{
		List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
		try{
			connecter();
			String recherche = "SELECT * FROM anc_etudiant WHERE nom LIKE '%"+rechercheString+"%' OR prenom LIKE '%"+rechercheString+"%'" +
					" OR email LIKE '%"+rechercheString+"%' OR num_telephone LIKE '%"+rechercheString+"%' OR adresse LIKE '%"+rechercheString+"%'" +
							" OR specialite_iscae LIKE '%"+rechercheString+"%' OR annee_quitt_iscae LIKE '%"+rechercheString+"%'" +
									" OR annee_entree_iscae LIKE '%"+rechercheString+"%' OR Matricule_dans_ISCAE LIKE '%"+rechercheString+"%';";
			result = stmt.executeQuery(recherche);
			while (result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				java.sql.Date dateNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				String num_telephone = result.getString("num_telephone");
				String adresse = result.getString("adresse");
				String specialite_iscae = result.getString("specialite_iscae");
				String annee_quitt_iscae = result.getString("annee_quitt_iscae");
				String annee_entree_iscae = result.getString("annee_entree_iscae");
				String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
				anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche des anciens étudiants  " + e);
			return null;
		}
		return anciensEtudiants;
	}
	
	public List<AncienEtudiant> rechercherEtudiantsParNom(String rechercheString){
		
		List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
		try{
			connecter();
			String recherche = "SELECT * FROM anc_etudiant WHERE nom LIKE '%"+rechercheString+"%' ;";
			result = stmt.executeQuery(recherche);
			while (result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				java.sql.Date dateNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				String num_telephone = result.getString("num_telephone");
				String adresse = result.getString("adresse");
				String specialite_iscae = result.getString("specialite_iscae");
				String annee_quitt_iscae = result.getString("annee_quitt_iscae");
				String annee_entree_iscae = result.getString("annee_entree_iscae");
				String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
				anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche des anciens étudiants  " + e);
			return null;
		}
		return anciensEtudiants;
	}
public List<AncienEtudiant> rechercherEtudiantsParPrenom(String rechercheString){
		
		List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
		try{
			connecter();
			String recherche = "SELECT * FROM anc_etudiant WHERE prenom LIKE '%"+rechercheString+"%' ;";
			result = stmt.executeQuery(recherche);
			while (result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				java.sql.Date dateNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				String num_telephone = result.getString("num_telephone");
				String adresse = result.getString("adresse");
				String specialite_iscae = result.getString("specialite_iscae");
				String annee_quitt_iscae = result.getString("annee_quitt_iscae");
				String annee_entree_iscae = result.getString("annee_entree_iscae");
				String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
				anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche des anciens étudiants  " + e);
			return null;
		}
		return anciensEtudiants;
	}
public List<AncienEtudiant> rechercherEtudiantsParEmail(String rechercheString){
	
	List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
	try{
		connecter();
		String recherche = "SELECT * FROM anc_etudiant WHERE email LIKE '%"+rechercheString+"%' ;";
		result = stmt.executeQuery(recherche);
		while (result.next()){
			int id = result.getInt("id");
			String nom = result.getString("nom");
			String prenom = result.getString("prenom");
			java.sql.Date dateNaissance = result.getDate("dateNaissance");
			String email = result.getString("email");
			String num_telephone = result.getString("num_telephone");
			String adresse = result.getString("adresse");
			String specialite_iscae = result.getString("specialite_iscae");
			String annee_quitt_iscae = result.getString("annee_quitt_iscae");
			String annee_entree_iscae = result.getString("annee_entree_iscae");
			String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
			anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
		}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche des anciens étudiants  " + e);
		return null;
	}
	return anciensEtudiants;
}
public List<AncienEtudiant> rechercherEtudiantsParNumeroDeTelephone(String rechercheString){
	
	List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
	try{
		connecter();
		String recherche = "SELECT * FROM anc_etudiant WHERE num_telephone LIKE '%"+rechercheString+"%' ;";
		result = stmt.executeQuery(recherche);
		while (result.next()){
			int id = result.getInt("id");
			String nom = result.getString("nom");
			String prenom = result.getString("prenom");
			java.sql.Date dateNaissance = result.getDate("dateNaissance");
			String email = result.getString("email");
			String num_telephone = result.getString("num_telephone");
			String adresse = result.getString("adresse");
			String specialite_iscae = result.getString("specialite_iscae");
			String annee_quitt_iscae = result.getString("annee_quitt_iscae");
			String annee_entree_iscae = result.getString("annee_entree_iscae");
			String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
			anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
		}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche des anciens étudiants  " + e);
		return null;
	}
	return anciensEtudiants;
}

public List<AncienEtudiant> rechercherEtudiantsParAdresse(String rechercheString){
	
	List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
	try{
		connecter();
		String recherche = "SELECT * FROM anc_etudiant WHERE adresse LIKE '%"+rechercheString+"%' ;";
		result = stmt.executeQuery(recherche);
		while (result.next()){
			int id = result.getInt("id");
			String nom = result.getString("nom");
			String prenom = result.getString("prenom");
			java.sql.Date dateNaissance = result.getDate("dateNaissance");
			String email = result.getString("email");
			String num_telephone = result.getString("num_telephone");
			String adresse = result.getString("adresse");
			String specialite_iscae = result.getString("specialite_iscae");
			String annee_quitt_iscae = result.getString("annee_quitt_iscae");
			String annee_entree_iscae = result.getString("annee_entree_iscae");
			String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
			anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
		}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche des anciens étudiants  " + e);
		return null;
	}
	return anciensEtudiants;
}
public List<AncienEtudiant> rechercherEtudiantsParSpecialiteIscae(String rechercheString){
	
	List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
	try{
		connecter();
		String recherche = "SELECT * FROM anc_etudiant WHERE specialite_iscae LIKE '%"+rechercheString+"%' ;";
		result = stmt.executeQuery(recherche);
		while (result.next()){
			int id = result.getInt("id");
			String nom = result.getString("nom");
			String prenom = result.getString("prenom");
			java.sql.Date dateNaissance = result.getDate("dateNaissance");
			String email = result.getString("email");
			String num_telephone = result.getString("num_telephone");
			String adresse = result.getString("adresse");
			String specialite_iscae = result.getString("specialite_iscae");
			String annee_quitt_iscae = result.getString("annee_quitt_iscae");
			String annee_entree_iscae = result.getString("annee_entree_iscae");
			String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
			anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
		}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche des anciens étudiants  " + e);
		return null;
	}
	return anciensEtudiants;
}
public List<AncienEtudiant> rechercherEtudiantsParAnneeQuittIscae(String rechercheString){
	
	List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
	try{
		connecter();
		String recherche = "SELECT * FROM anc_etudiant WHERE annee_quitt_iscae LIKE '%"+rechercheString+"%' ;";
		result = stmt.executeQuery(recherche);
		while (result.next()){
			int id = result.getInt("id");
			String nom = result.getString("nom");
			String prenom = result.getString("prenom");
			java.sql.Date dateNaissance = result.getDate("dateNaissance");
			String email = result.getString("email");
			String num_telephone = result.getString("num_telephone");
			String adresse = result.getString("adresse");
			String specialite_iscae = result.getString("specialite_iscae");
			String annee_quitt_iscae = result.getString("annee_quitt_iscae");
			String annee_entree_iscae = result.getString("annee_entree_iscae");
			String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
			anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
		}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche des anciens étudiants  " + e);
		return null;
	}
	return anciensEtudiants;
}
public List<AncienEtudiant> rechercherEtudiantsParAnneeEntreeIscae(String rechercheString){
	
	List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
	try{
		connecter();
		String recherche = "SELECT * FROM anc_etudiant WHERE annee_entree_iscae LIKE '%"+rechercheString+"%' ;";
		result = stmt.executeQuery(recherche);
		while (result.next()){
			int id = result.getInt("id");
			String nom = result.getString("nom");
			String prenom = result.getString("prenom");
			java.sql.Date dateNaissance = result.getDate("dateNaissance");
			String email = result.getString("email");
			String num_telephone = result.getString("num_telephone");
			String adresse = result.getString("adresse");
			String specialite_iscae = result.getString("specialite_iscae");
			String annee_quitt_iscae = result.getString("annee_quitt_iscae");
			String annee_entree_iscae = result.getString("annee_entree_iscae");
			String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
			anciensEtudiants.add(new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE));
		}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche des anciens étudiants  " + e);
		return null;
	}
	return anciensEtudiants;
}

public AncienEtudiant rechercherEtudiantsParMatriculeDansISCAE(String rechercheString)
{
	AncienEtudiant ancienEtudiant = new AncienEtudiant();
	try{
		connecter();
		String recherche = "SELECT * FROM anc_etudiant WHERE Matricule_dans_ISCAE LIKE '%"+rechercheString+"%' ;";
		result = stmt.executeQuery(recherche);
		while (result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				java.sql.Date dateNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				String num_telephone = result.getString("num_telephone");
				String adresse = result.getString("adresse");
				String specialite_iscae = result.getString("specialite_iscae");
				String annee_quitt_iscae = result.getString("annee_quitt_iscae");
				String annee_entree_iscae = result.getString("annee_entree_iscae");
				String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
				ancienEtudiant = new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE);
			}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche de l'étudiant  " + e);
		return null;
	}
	return ancienEtudiant;
}

	public Universite getUniversite(int idFaculte)
	{
		Universite universite = new Universite();
		try{
			connecter();
			String recherche = "SELECT * FROM universite WHERE id = '"+idFaculte+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				Date dateCreation = result.getDate("date_creation");
				String adresse = result.getString("adresse");
				String email = result.getString("email");
				String siteWeb = result.getString("site_web");
				universite = new Universite(id, nom, dateCreation, adresse, email, siteWeb);
			}
		}
		catch(Exception e){
			
		}
		return universite;
	}

	public Faculte getFaculte(int idFaculte)
	{
		Faculte faculte = new Faculte();
		try{
			connecter();
			String recherche = "SELECT * FROM faculte WHERE id = '"+idFaculte+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				Date dateCreation = result.getDate("date_creation");
				int universite = result.getInt("universite");
				int domaine = result.getInt("domaine");
				String adresse = result.getString("adresse");
				String email = result.getString("email");
				String siteWeb = result.getString("site_web");
				int ville = result.getInt("ville");
				faculte = new Faculte(id, nom, dateCreation, universite, domaine, adresse, email, siteWeb, ville);
			}
		}
		catch(Exception e){
			
		}
		return faculte;
	}
	
	public Ville getVille(int idVille)
	{
		Ville ville = new Ville();
		try{
			connecter();
			String recherche = "SELECT * FROM ville WHERE id = '"+idVille+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				int pays = result.getInt("pays");
				ville = new Ville(id, nom, pays);
			}
		}
		catch(Exception e){
			
		}
		return ville;
	}
	
	public Pays getPays(int idPays)
	{
		Pays pays = new Pays();
		try{
			connecter();
			String recherche = "SELECT * FROM pays WHERE id = '"+idPays+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = result.getInt("id");
				String codePays = result.getString("code_pays");
				String fr = result.getString("fr");
				String en = result.getString("en");
				pays = new Pays(id, codePays, fr, en);
			}
		}
		catch(Exception e){
			
		}
		return pays;
	}
	
	public Filiere getFiliere(int idFiliere)
	{
		Filiere filiere = new Filiere();
		try{
			connecter();
			String recherche = "SELECT * FROM filiere WHERE id = '"+idFiliere+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				int domaine = result.getInt("domaine");
				filiere = new Filiere(id, nom, domaine);
			}
		}
		catch(Exception e){
			
		}
		return filiere;
	}
	public Specialite getSpecialite(int idSpecialite)
	{
		Specialite specialite = new Specialite();
		try{
			connecter();
			String recherche = "SELECT * FROM specialite WHERE id = '"+idSpecialite+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				int filiere = result.getInt("filiere");
				specialite = new Specialite(id, nom, filiere);
			}
		}
		catch(Exception e){
			
		}
		return specialite;
	}

	
public Emploi hasBeenEmployee(int idEtudiantR){
		
	Emploi emploi = null;
		
		try{
			connecter();
			String recherche = "SELECT * FROM emploi WHERE etudiant = '"+idEtudiantR+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int etudiant = (result.getInt("etudiant"));
				int entreprise = (result.getInt("entreprise"));
				String poste = (result.getString("poste"));
				Date dateDebut = (result.getDate("date_Debut"));
				emploi = new Emploi(etudiant, entreprise, poste, dateDebut);
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche   " + e);
			//return null;
		}
		return emploi;
	}
	
	
public Entreprise getEntreprise(int idEntreprise){
	
	Entreprise entreprise = new Entreprise();
		
		try{
			connecter();
			String recherche = "SELECT * FROM entreprise WHERE id = '"+idEntreprise+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = (result.getInt("id"));
				String nom = (result.getString("nom"));
				String typeDeService = (result.getString("type_serv"));
				Date dateDeCreation = (result.getDate("date_creat"));
				String adresse = (result.getString("adresse"));
				String email = (result.getString("email"));
				String siteWeb = (result.getString("site_web"));
				entreprise = new Entreprise(id, nom, typeDeService, dateDeCreation, adresse, email, siteWeb);
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche de l'entreprise  " + e);
			//return null;
		}
		return entreprise;
	}
	
public Emploi getEmploi(int idEtudiant){
	Emploi emploi = null;
	try{
		connecter();
		String recherche = "SELECT * FROM emploi WHERE etudiant = '"+idEtudiant+"';";
		result = stmt.executeQuery(recherche);
		if(result.next()){
			int etudiant = (result.getInt("etudiant"));
			int entreprise = (result.getInt("entreprise"));
			String poste = (result.getString("poste"));
			Date dateDeDebut = (result.getDate("date_Debut"));
			emploi = new Emploi(etudiant, entreprise, poste, dateDeDebut);
		}
	}
	catch(Exception e){
		System.out.println("Erreur   " + e);
		//return null;
	}
	return emploi;
}
	
public CreationEntreprise hasCreatedEntreprise(int idEtudiantR){
	
	CreationEntreprise creationEntreprise = null;
	
	try{
		connecter();
		String recherche = "SELECT * FROM creation_entreprise WHERE etudiant = '"+idEtudiantR+"';";
		result = stmt.executeQuery(recherche);
		if(result.next()){
			int etudiant = (result.getInt("etudiant"));
			int entreprise = (result.getInt("entreprise"));
			creationEntreprise = new CreationEntreprise(etudiant, entreprise);
		}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche de contunité d'études  " + e);
		//return null;
	}
	return creationEntreprise;
}
	
public Autre hasDoneAnotherThing(int idEtudiantR){
	
	Autre autre = null;
	
	try{
		connecter();
		String recherche = "SELECT * FROM autre WHERE etudiant = '"+idEtudiantR+"';";
		result = stmt.executeQuery(recherche);
		if(result.next()){
			int id = (result.getInt("id"));
			int etudiant = (result.getInt("etudiant"));
			String text = result.getString("autre");
			autre = new Autre(id, etudiant, text);
		}
	}
	catch(Exception e){
		System.out.println("Erreur à la recherche de contunité d'études  " + e);
		//return null;
	}
	return autre;
}
	public List<String> sepcialitesISCAE()
	{
		List<String> specialites = new ArrayList<String>();
		try{
			connecter();
			String recherche = "SELECT DISTINCT specialite_iscae from anc_etudiant;";
			result = stmt.executeQuery(recherche);
			while(result.next()){
				specialites.add(result.getString("specialite_iscae"));
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche des specialiés " + e);
		}
		return specialites ;
	}
	public List<String> promotionsISCAE(){
		List<String> promotions = new ArrayList<String>();
		try{
			connecter();
			String recherche = "SELECT DISTINCT annee_entree_iscae from anc_etudiant;";
			result = stmt.executeQuery(recherche);
			while(result.next()){
				promotions.add(result.getString("annee_entree_iscae"));
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche des specialiés " + e);
		}
		return promotions ;
	}
	public List<AncienEtudiant> EtudiantsAyantsContinueLesEtudes(){
		
		List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
		for(int i=0; i<tousLesEtudiants().size(); i++)
			if(this.hasContinuedStuding(this.tousLesEtudiants().get(i).getId())!= null)
				anciensEtudiants.add(tousLesEtudiants().get(i));
		return anciensEtudiants;
	}
	public List<AncienEtudiant> EtudiantsAyantsEuUnEmploi(){
		
		List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
		for(int i=0; i<tousLesEtudiants().size(); i++)
			if(this.hasBeenEmployee(this.tousLesEtudiants().get(i).getId())!= null)
				anciensEtudiants.add(tousLesEtudiants().get(i));
		return anciensEtudiants;
	}public List<AncienEtudiant> EtudiantsAyantsCreeeUneEntreprise(){
		
		List<AncienEtudiant> anciensEtudiants = new ArrayList<AncienEtudiant>();
		for(int i=0; i<tousLesEtudiants().size(); i++)
			if(this.hasCreatedEntreprise(this.tousLesEtudiants().get(i).getId())!= null)
				anciensEtudiants.add(tousLesEtudiants().get(i));
		return anciensEtudiants;
	}
	public User validerLogin(String login, String password){
		
		User user =  null;
		String recherche = "SELECT * FROM user WHERE login = '"+login+"' AND password = '"+password+"'; ";
		
		try{
			connecter();
			result = stmt.executeQuery(recherche);
			while(result.next()){
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				Date dateDeNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				String numeroDeTelephone = result.getString("num_telephone");
				String adresse = result.getString("adresse");
				String log = result.getString("login");
				String psswd = result.getString("password");
				int type = result.getInt("type");
				user = new User(nom, prenom, dateDeNaissance, email, numeroDeTelephone, adresse, log, psswd, type);
			}
		}
		catch(Exception e){
			
		}
		return user;
	}
	public AncienEtudiant getAncienEtudiant(int idEtudiant){
		AncienEtudiant ancienEtudiant =  null;
		String recherche = "SELECT * FROM anc_etudiant WHERE id = '"+idEtudiant+"';";
		try{
			connecter();
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				java.sql.Date dateNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				String num_telephone = result.getString("num_telephone");
				String adresse = result.getString("adresse");
				String specialite_iscae = result.getString("specialite_iscae");
				String annee_quitt_iscae = result.getString("annee_quitt_iscae");
				String annee_entree_iscae = result.getString("annee_entree_iscae");
				String matriculeISCAE = result.getString("Matricule_dans_ISCAE");
				ancienEtudiant = new AncienEtudiant(id, nom, prenom,  dateNaissance, email, num_telephone, adresse, specialite_iscae, annee_quitt_iscae, annee_entree_iscae, matriculeISCAE);
			}
		}
		catch(Exception e){
			
		}
		return ancienEtudiant;
	}
	
	public User getUser(String userLogin){
		User user = null;
		String recherche = "SELECT * FROM user WHERE id = '"+userLogin+"';";
		try{
			connecter();
			result = stmt.executeQuery(recherche);
			if(result.next()){
				String nom = result.getString("nom");
				String prenom = result.getString("prenom");
				Date dateNaissance = result.getDate("dateNaissance");
				String email = result.getString("email");
				String num_telephone = result.getString("num_telephone");
				String adresse = result.getString("adresse");
				String login = result.getString("login");
				String password = result.getString("password");
				int type = result.getInt("type");
				user = new User(nom, prenom, dateNaissance, email, num_telephone, adresse, login, password, type);
			}
		}
		catch(Exception e){
			
		}
		return user;
	}
	
	public DomaineEtudes getDomaineEtudes(int idDomaineEtudes){
		DomaineEtudes domaineEtudes = null;
		String recherche = "SELECT * FROM domaineetudes WHERE id = '"+idDomaineEtudes+"';";
		try{
			connecter();
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = result.getInt("id");
				String nom = result.getString("nom");
				domaineEtudes = new DomaineEtudes(id, nom);
			}
		}
		catch(Exception e){
			
		}
		return domaineEtudes;
	}
	public Ville getVilleEntreprise(Entreprise entreprise){
		Ville ville = null;
			String recherche = "SELECT ville FROM entreprise_dans_ville WHERE entreprise_dans_ville.entreprise = '"+entreprise.getId()+"';";
			try{
				result = stmt.executeQuery(recherche);
				if(result.next()){
					ville = getVille(result.getInt("ville"));
				}
			}
			catch(Exception e){
				
			}
			return ville;
	}
	public void modifierAncienEtudiant(int id, String nom, String prenom , Date dateNaissance, String email, String numeroDeTelephone, String adresse, String specialiteISCAE, String anneeEntreeISCAE, String anneeFinISCAE, String matriculeDansISCAE){
		String dateN = dateNaissance.getYear() + "-" + dateNaissance.getMonth() + "-" + dateNaissance.getDay();
		update = "UPDATE anc_etudiant SET nom = '"+nom+"', prenom = '"+prenom+"',  dateNaissance = '"+dateN+"', email = '"+email+"', num_telephone = '"+numeroDeTelephone+"', adresse = '"+adresse+"', specialite_iscae = '"+specialiteISCAE+"', annee_quitt_iscae = '"+anneeFinISCAE+"', annee_entree_iscae = '"+anneeEntreeISCAE+"', Matricule_dans_ISCAE = '"+matriculeDansISCAE+"' WHERE id = '"+id+"';";
		try{
			modifier();
		}
		
		catch(Exception e){
			
		}			
	}
	public void modifierUniversite(int id, String nom, Date dateCreation, String adresse,String email, String siteWeb){
		String dateN = dateCreation.getYear() + "-" + dateCreation.getMonth() + "-" + dateCreation.getDay();
		update = "UPDATE universite SET nom = '"+nom+"', date_creation = '"+dateN+"', email = '"+email+"',  adresse = '"+adresse+"', site_web = '"+siteWeb+"' WHERE id = '"+id+"';";
		try{
			modifier();
		}
		
		catch(Exception e){
			
		}			
	}
	
	public void modifierUniversiteDansPays(int universite, int pays){
		update = "UPDATE universite_dans_pays SET universite = '"+universite+"', pays = '"+pays+"';";
		try{
			modifier();
		}
		
		catch(Exception e){
			
		}			
	}
	
	public void modifierVille(int id, String nom, int pays){
		update = "UPDATE ville SET nom = '"+nom+"', pays = '"+pays+"' WHERE id = '"+id+"' ;";
		try{
			modifier();
		}
		
		catch(Exception e){
			
		}			
	}
	public void modifierFaculte(int id, String nom, Date dateCreation, int universite,int domaine, String adresse,String email, String siteWeb, int ville){
		String dateN = dateCreation.getYear() + "-" + dateCreation.getMonth() + "-" + dateCreation.getDay();
		update = "UPDATE faculte SET nom = '"+nom+"', date_creation = '"+dateN+"', universite = '"+universite+"', domaine = '"+domaine+"',email = '"+email+"',  adresse = '"+adresse+"', site_web = '"+siteWeb+"', ville = '"+ville+"' WHERE id = '"+id+"';";
		try{
			modifier();
		}
		
		catch(Exception e){
			
		}			
	}
	public void modifierDomainesEtudes(int id, String nom){
		update = "UPDATE domaineetudes SET nom = '"+nom+"' WHERE id = '"+id+"' ;";
		try{
			modifier();
		}
		
		catch(Exception e){
			
		}			
	}
	public void modifierFiliere(int id, String nom, int domaine){
		update = "UPDATE filiere SET nom = '"+nom+"', domaine = '"+domaine+"' WHERE id = '"+id+"' ;";
		try{
			modifier();
		}
		
		catch(Exception e){
			
		}			
	}
	
	public void modifierSpecialite(int id, String nom, int filiere){
		update = "UPDATE specialite SET nom = '"+nom+"', filiere = '"+filiere+"' WHERE id = '"+id+"' ;";
		try{
			modifier();
		}
		
		catch(Exception e){
			
		}			
	}
	
	public  void modifierEntreprise(int id, String nom, String typeDeService , Date dateDeCreation , String adresse , String email , String siteWeb){
		String dateCreationString = dateDeCreation.getYear() + "-" + dateDeCreation.getMonth() + "-" + dateDeCreation.getDay();
		update = "UPDATE entreprise SET nom =  '"+nom+"', type_serv = '"+typeDeService+"', date_creat = '"+dateCreationString+"', adresse = '"+adresse+"', email = '"+email+"', site_web = '"+siteWeb+"' WHERE id = '"+id+"';";
		try{
			modifier();
		}
		catch(Exception e){
			System.out.println("Erreur  " + e);
		}
	}
	public  void modifiererEmploi(int idEtudiant, int idEntreprise , String poste , Date dateDeDebutDEmploi){
		String dateDeDebutDEmploiString = dateDeDebutDEmploi.getYear() + "-" + dateDeDebutDEmploi.getMonth() + "-" + dateDeDebutDEmploi.getDay();
		update = "UPDATE  emploi SET poste = '"+poste+"', date_Debut = '"+dateDeDebutDEmploiString +"' WHERE etudiant = '"+idEtudiant+"' AND entreprise = '"+idEntreprise+"';";
		 try{
				modifier();
			}
			catch(Exception e){
				System.out.println("Erreur  " + e);
			}
	}
	
	public  void modifierEntrepriseDansVille(int entreprise, int ville){
		update = "UPDATE entreprise_dans_ville SET ville = '"+ville+"', entreprise = '"+entreprise+"';";
		 try{
				modifier();
			}
			catch(Exception e){
				System.out.println("Erreur  " + e);
			}
	}
	
	public  void modifierCreationEntreprise(int entreprise, int etudiant){
		update = "UPDATE creation_entreprise SET etudiant = '"+etudiant+"', entreprise = '"+entreprise+"';";
		 try{
				modifier();
			}
			catch(Exception e){
				System.out.println("Erreur  " + e);
			}
	}
	public  void modifierAutreCas(int id, String expression, int etudiant){
		update = "UPDATE autre SET etudiant = '"+etudiant+"', autre = '"+expression+"' WHERE id = '"+id+"';";
		 try{
				modifier();
			}
			catch(Exception e){
				System.out.println("Erreur  " + e);
			}
	}
	public void supprimerContinuteEtudes(int idEtudiant){
		delete = "DELETE FROM continute_etud WHERE id_etudiant = '"+idEtudiant+"'; ";
		try{
			supprimer();
		}
		catch(Exception e){
			System.out.println("Erreur à la suppression de continuté d'études de l'étudiant " + e);
		}
	}
	public void supprimerEmploi(int idEtudiant){
		delete = "DELETE FROM emploi WHERE etudiant = '"+idEtudiant+"'; ";
		try{
			supprimer();
		}
		catch(Exception e){
			System.out.println(" Erreur à la suppression de l'emploi de l'étudiant  " + e);
		}
	}
	public void supprimerCreationEntreprise(int idEtudiant){
		delete = "DELETE FROM creation_entreprise WHERE etudiant = '"+idEtudiant+"'; ";
		try{
			supprimer();
		}
		catch(Exception e){
			System.out.println("Erreur à la suppression de creation de l'entreprise de l'étudiant  " + e);
		}
	}
	public void supprimerAutreCas(int idEtudiant){
		delete = "DELETE FROM autre WHERE etudiant = '"+idEtudiant+"'; ";
		try{
			supprimer();
		}
		catch(Exception e){
			System.out.println("Erreur Erreur à la suppression de l'expression d'un autre cas  de l'étudiant   " + e);
		}
	}

	public ContinuteEtudes getContinuteEtudes(int idContinuteEtudes) {
		ContinuteEtudes continuteEtudes = null;
		try{
			connecter();
			String recherche = "SELECT * FROM continute_etud WHERE id = '"+idContinuteEtudes+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int id = (result.getInt("id"));
				int etudiant = (result.getInt("id_etudiant"));
				int faculte = (result.getInt("faculte"));
				int ville = (result.getInt("ville"));
				int filiere = (result.getInt("filiere"));
				int specialite = (result.getInt("specialit"));
				Date dateDeDebut = (result.getDate("date_debut"));
				String niveau = (result.getString("niveau"));
				String duree = (result.getString("duree"));
				continuteEtudes = new ContinuteEtudes(id, etudiant, faculte, ville, filiere, specialite, niveau, dateDeDebut, duree);
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche de continuté d'études  " + e);
			//return
		}
		return continuteEtudes;
	}

	public void modifierContinuteEtudes(int id, int idEtudiant, int faculte,
			int ville, int filiere, int specialite, String niv_cont_etud,
			Date date_debut_etudes, String duree) {
		String dateN = date_debut_etudes.getYear() + "-" + date_debut_etudes.getMonth() + "-" + date_debut_etudes.getDay();
		update = "UPDATE continute_etud SET id_etudiant = '"+idEtudiant+"', faculte = '"+faculte+"', ville = '"+ville+"', filiere = '"+filiere+"', specialit = '"+specialite+"', niveau = '"+niv_cont_etud+"', date_debut = '"+dateN+"', duree = '"+duree+"' WHERE id = '"+id+"'	;";
		try{
			modifier();
		}
		catch(Exception e){
			
		}
	}

	public EntrepriseDansVille getEntrepriseDandVille(int idEntreprise) {
		EntrepriseDansVille entrepriseDansVille = null;
		String recherche = "SELECT * FROM entreprise_dans_ville WHERE entreprise = '"+idEntreprise+"';";
		try{
			connecter();
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int entreprise = (result.getInt("entreprise"));
				int ville = (result.getInt("ville"));
				entrepriseDansVille = new EntrepriseDansVille(entreprise, ville);
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche de l'entreprise dans la ville" + e);
			//return
		}
		return entrepriseDansVille;
	}
	public CreationEntreprise getCreationEntreprise(int idEntreprise) {
		CreationEntreprise creationEntreprise = null;
		try{
			connecter();
			String recherche = "SELECT * FROM creation_entreprise WHERE entreprise = '"+idEntreprise+"';";
			result = stmt.executeQuery(recherche);
			if(result.next()){
				int entreprise = (result.getInt("entreprise"));
				int etudiant = (result.getInt("etudiant"));
				creationEntreprise = new CreationEntreprise(etudiant, entreprise);
			}
		}
		catch(Exception e){
			System.out.println("Erreur à la recherche de la creation de l'entreprise  " + e);
			//return
		}
		return creationEntreprise;
	}
	
		public java.util.List<Pays> tousLesPays(){
			
			List<Pays> pays = new ArrayList<Pays>();
			try{
				connecter();
				String recherche = "SELECT * FROM pays;";
				result = stmt.executeQuery(recherche);
				while(result.next()){
					int id = result.getInt("id");
					String codePays = result.getString("code_pays");
					String fr = result.getString("fr");
					String en = result.getString("en");
					pays.add(new Pays(id, codePays,fr,   en ));
				}
			}
			catch(Exception e){
				System.out.println("Erreur à la recherche des étudiants hh  " + e);
				//return null;
			}
			return pays;
		}
	}