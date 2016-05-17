package modele;

public class Pays {

	private int id;
	private String codePays;
	private String fr;
	private String en;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCodePays() {
		return codePays;
	}
	public void setCodePays(String codePays) {
		this.codePays = codePays;
	}
	public String getFr() {
		return fr;
	}
	public void setFr(String fr) {
		this.fr = fr;
	}
	public String getEn() {
		return en;
	}
	public void setEn(String en) {
		this.en = en;
	}
	public Pays(int id, String codePays, String fr, String en) {
		super();
		this.id = id;
		this.codePays = codePays;
		this.fr = fr;
		this.en = en;
	}
	public Pays() {
		super();
	}
	
	
}
