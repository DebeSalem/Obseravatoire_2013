package modele;

public class Specialite {

	private int id;
	private String nom;
	private int filiere;
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
	public int getFiliere() {
		return filiere;
	}
	public void setFiliere(int filiere) {
		this.filiere = filiere;
	}
	public Specialite(int id, String nom, int filiere) {
		super();
		this.id = id;
		this.nom = nom;
		this.filiere = filiere;
	}
	public Specialite() {
		super();
	}
	
	
}
