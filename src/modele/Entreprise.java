package modele;

import java.sql.Date;

public class Entreprise {

	/**
	 * @param args
	 */
	private int id;
	private String nom;
	private String typeDeService;
	private Date dateDeCreation;
	private String adresse;
	private String email;
	private String siteWeb;
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
	public String getTypeDeService() {
		return typeDeService;
	}
	public void setTypeDeService(String typeDeService) {
		this.typeDeService = typeDeService;
	}
	public Date getDateDeCreation() {
		return dateDeCreation;
	}
	public void setDateDeCreation(Date dateDeCreation) {
		this.dateDeCreation = dateDeCreation;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSiteWeb() {
		return siteWeb;
	}
	public void setSiteWeb(String siteWeb) {
		this.siteWeb = siteWeb;
	}
	public Entreprise(int id, String nom, String typeDeService,
			Date dateDeCreation, String adresse, String email, String siteWeb) {
		super();
		this.id = id;
		this.nom = nom;
		this.typeDeService = typeDeService;
		this.dateDeCreation = dateDeCreation;
		this.adresse = adresse;
		this.email = email;
		this.siteWeb = siteWeb;
	}
	public Entreprise() {
		super();
	}
	
	

}
