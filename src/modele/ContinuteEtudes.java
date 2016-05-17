package modele;

import java.util.Date;

public class ContinuteEtudes {

	private int id;
	private int idEtudiant;
	private int faculte;
	private int ville;
	private int filiere;
	private int specialite;
	private String niveau;
	private java.util.Date dateDeDebut;
	private String duree;
	//
	
	public ContinuteEtudes(int id, int idEtudiant, int faculte, int ville,
			int filiere, int specialite, String niveau, Date dateDeDebut,
			String duree) {
		super();
		this.id = id;
		this.idEtudiant = idEtudiant;
		this.faculte = faculte;
		this.ville = ville;
		this.filiere = filiere;
		this.specialite = specialite;
		this.niveau = niveau;
		this.dateDeDebut = dateDeDebut;
		this.duree = duree;
	}
	//
	
	

	public int getId() {
		return id;
	}
	public ContinuteEtudes() {
		super();
	}



	public void setId(int id) {
		this.id = id;
	}
	public int getIdEtudiant() {
		return idEtudiant;
	}
	public void setIdEtudiant(int idEtudiant) {
		this.idEtudiant = idEtudiant;
	}
	public int getFaculte() {
		return faculte;
	}
	public void setFaculte(int faculte) {
		this.faculte = faculte;
	}
	public int getVille() {
		return ville;
	}
	public void setVille(int ville) {
		this.ville = ville;
	}
	public int getFiliere() {
		return filiere;
	}
	public void setFiliere(int filiere) {
		this.filiere = filiere;
	}
	public int getSpecialite() {
		return specialite;
	}
	public void setSpecialite(int specialite) {
		this.specialite = specialite;
	}
	public String getNiveau() {
		return niveau;
	}
	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}
	public java.util.Date getDateDeDebut() {
		return dateDeDebut;
	}
	public void setDateDeDebut(java.util.Date dateDeDebut) {
		this.dateDeDebut = dateDeDebut;
	}
	public String getDuree() {
		return duree;
	}
	public void setDuree(String duree) {
		duree = duree;
	}	
}
