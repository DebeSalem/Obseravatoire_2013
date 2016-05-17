package modele;

import java.sql.Date;

public class Universite {

	private int id;
	private String nom;
	private Date dateCreation;
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
	public Date getDateCreation() {
		return dateCreation;
	}
	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
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
	public Universite(int id, String nom, Date dateCreation, String adresse,
			String email, String siteWeb) {
		super();
		this.id = id;
		this.nom = nom;
		this.dateCreation = dateCreation;
		this.adresse = adresse;
		this.email = email;
		this.siteWeb = siteWeb;
	}
	public Universite() {
		super();
	}
	
	
}
