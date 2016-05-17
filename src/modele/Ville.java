package modele;

public class Ville {

	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String nom;
	private int pays;
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public int getPays() {
		return pays;
	}
	public void setPays(int pays) {
		this.pays = pays;
	}
	public Ville(int id, String nom, int pays) {
		super();
		this.id = id;
		this.nom = nom;
		this.pays = pays;
	}
	public Ville() {
		super();
	}
	
	
}
