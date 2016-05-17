package modele;

import java.sql.Date;


public class AncienEtudiant {
	
	public AncienEtudiant() {
		super();
	}
	private int id;
	private String nom;
	private String prenom;
	private Date dateNaissance;
	private String email;
	private String num_telephone;
	private String adresse;
	private String specialite_iscae;
	private String annee_quitt_iscae;
	private String annee_entree_iscae;
	private String matriculeISCAE;
	public AncienEtudiant(int id, String nom, String prenom,
			Date dateNaissance, String email, String num_telephone,
			String adresse, String specialite_iscae, String annee_quitt_iscae,
			String annee_entree_iscae, String matriculeISCAE) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNaissance = dateNaissance;
		this.email = email;
		this.num_telephone = num_telephone;
		this.adresse = adresse;
		this.specialite_iscae = specialite_iscae;
		this.annee_quitt_iscae = annee_quitt_iscae;
		this.annee_entree_iscae = annee_entree_iscae;
		this.matriculeISCAE = matriculeISCAE;
	}
	public String getMatriculeISCAE() {
		return matriculeISCAE;
	}
	public void setMatriculeISCAE(String matriculeISCAE) {
		this.matriculeISCAE = matriculeISCAE;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public java.util.Date getDateNaissance() {
		return (java.util.Date) dateNaissance;
	}
	public void setDateNaissance(Date dateNaissance) {
		this.dateNaissance = dateNaissance;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNum_telephone() {
		return num_telephone;
	}
	public void setNum_telephone(String num_telephone) {
		this.num_telephone = num_telephone;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getSpecialite_iscae() {
		return specialite_iscae;
	}
	public void setSpecialite_iscae(String specialite_iscae) {
		this.specialite_iscae = specialite_iscae;
	}
	public String getAnnee_quitt_iscae() {
		return annee_quitt_iscae;
	}
	public void setAnnee_quitt_iscae(String annee_quitt_iscae) {
		this.annee_quitt_iscae = annee_quitt_iscae;
	}
	public String getAnnee_entree_iscae() {
		return annee_entree_iscae;
	}
	public void setAnnee_entree_iscae(String annee_entree_iscae) {
		this.annee_entree_iscae = annee_entree_iscae;
	}
	public AncienEtudiant(int id, String nom, String prenom, Date dateNaissance,
			String email, String num_telephone, String adresse,
			String specialite_iscae, String annee_quitt_iscae,
			String annee_entree_iscae) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNaissance = dateNaissance;
		this.email = email;
		this.num_telephone = num_telephone;
		this.adresse = adresse;
		this.specialite_iscae = specialite_iscae;
		this.annee_quitt_iscae = annee_quitt_iscae;
		this.annee_entree_iscae = annee_entree_iscae;
	}
	/*public AncienEtudiant() {
		// TODO Auto-generated constructor stub
	}*/
	
}
