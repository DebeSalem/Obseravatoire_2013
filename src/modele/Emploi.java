package modele;

import java.sql.Date;

public class Emploi {

	private int etudiant;
	private int entrprise;
	private String poste;
	private Date dateDeDebut;
	public int getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(int etudiant) {
		this.etudiant = etudiant;
	}
	public int getEntrprise() {
		return entrprise;
	}
	public void setEntrprise(int entrprise) {
		this.entrprise = entrprise;
	}
	public String getPoste() {
		return poste;
	}
	public void setPoste(String poste) {
		this.poste = poste;
	}
	public Date getDateDeDebut() {
		return dateDeDebut;
	}
	public void setDateDeDebut(Date dateDeDebut) {
		this.dateDeDebut = dateDeDebut;
	}
	public Emploi(int etudiant, int entrprise, String poste, Date dateDeDebut) {
		super();
		this.etudiant = etudiant;
		this.entrprise = entrprise;
		this.poste = poste;
		this.dateDeDebut = dateDeDebut;
	}
	public Emploi() {
		super();
	}
	
	
}
