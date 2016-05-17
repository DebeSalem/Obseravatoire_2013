package modele;

import java.sql.Date;

public class Faculte {

	private int id;
	private String nom;
	private Date dateCreation;
	private int universite;
	private int domaine;
	private String adresse;
	private String email;
	private String siteWeb;
	private int ville;
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
	public int getUniversite() {
		return universite;
	}
	public void setUniversite(int universite) {
		this.universite = universite;
	}
	public int getDomaine() {
		return domaine;
	}
	public void setDomaine(int domaine) {
		this.domaine = domaine;
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
	public int getVille() {
		return ville;
	}
	public void setVille(int ville) {
		this.ville = ville;
	}
	public Faculte(int id, String nom, Date dateCreation, int universite,
			int domaine, String adresse, String email, String siteWeb,
			int ville) {
		super();
		this.id = id;
		this.nom = nom;
		this.dateCreation = dateCreation;
		this.universite = universite;
		this.domaine = domaine;
		this.adresse = adresse;
		this.email = email;
		this.siteWeb = siteWeb;
		this.ville = ville;
	}
	public Faculte() {
		super();
	}
	
	
}
