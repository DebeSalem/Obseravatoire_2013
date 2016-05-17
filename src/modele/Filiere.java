package modele;

public class Filiere {

	private int id;
	private String nom;
	private int domaine;
	public int getDomaine(){
		return domaine;
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
	public Filiere(int id, String nom) {
		super();
		this.id = id;
		this.nom = nom;
	}
	public Filiere() {
		super();
	}
	public Filiere(int id, String nom, int domaine) {
		super();
		this.id = id;
		this.nom = nom;
		this.domaine = domaine;
	}
	
	
	
}
