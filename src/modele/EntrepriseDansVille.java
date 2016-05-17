package modele;

public class EntrepriseDansVille {

	private int entreprise;
	private int ville;
	public int getEntreprise() {
		return entreprise;
	}
	public void setEntreprise(int entreprise) {
		this.entreprise = entreprise;
	}
	public int getVille() {
		return ville;
	}
	public void setVille(int ville) {
		this.ville = ville;
	}
	public EntrepriseDansVille(int entreprise, int ville) {
		super();
		this.entreprise = entreprise;
		this.ville = ville;
	}
	
	
}
