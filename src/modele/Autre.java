package modele;

public class Autre {

	private int id;
	private int etudiant;
	private String autre;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAutre() {
		return autre;
	}
	public void setAutre(String autre) {
		this.autre = autre;
	}
	public Autre(int id, int etudiant, String autre) {
		super();
		this.id = id;
		this.etudiant = etudiant;
		this.autre = autre;
	}
	public int getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(int etudiant) {
		this.etudiant = etudiant;
	}
	public Autre() {
		super();
	}
	
	
}
