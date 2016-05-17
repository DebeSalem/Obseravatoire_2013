package modele;

public class CreationEntreprise {



	private int etudiant;
	private int entreprise;
	public int getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(int etudiant) {
		this.etudiant = etudiant;
	}
	public int getEntreprise() {
		return entreprise;
	}
	public void setEntreprise(int entreprise) {
		this.entreprise = entreprise;
	}
	public CreationEntreprise(int etudiant, int entreprise) {
		super();
		this.etudiant = etudiant;
		this.entreprise = entreprise;
	}
	public CreationEntreprise() {
		super();
	}
	
	
	

}
