package testPackage;

import java.util.ArrayList;
import java.util.List;

import modele.AncienEtudiant;
import modele.ContinuteEtudes;
import modele.Etudiants;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		modele.Etudiants ajout = new modele.Etudiants();
		System.out.println("The last student id is " + ajout.getIdEtudiant());
		System.out.println("The last entreprise id is " + ajout.getIdEntreprise());
		System.out.println("The id of Mauritania is " + ajout.getIdPays("Mauritanie "));
		System.out.println("The last town id is " + ajout.getIdVille());
		System.out.println("The last university id is " + ajout.getIdUniversite());
		System.out.println("The last entreprise id is " + ajout.getIdEntreprise());
		
		//
		List<AncienEtudiant> etudiants =  new ArrayList<AncienEtudiant>();
		etudiants = ajout.tousLesEtudiants();
		
		System.out.println("The number of all students is = " + etudiants.size());
		System.out.println("******************************************");
		//String rechercheString = "";
		//List<AncienEtudiant>  etudiants_ = ajout.rechercherEtudiants(rechercheString);
		//System.out.println("Le nombre des etudiants trouves = " + etudiants_.size());
		//ContinuteEtudes continuteEtudes = ajout.hasContinuedStuding(34);
		//System.out.println("Fabio university : " + ajout.getUniversite(ajout.hasContinuedStuding(41).getFaculte()).getNom());
		//System.out.println("The Length = " + continuteEtudes.getDuree());
		 String[] mois = {"", "Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Decembre" }; 
			for(int i=1; i<=12; i++)
				System.out.println(mois[i]);
		ajout.modifierAncienEtudiant(45,"Mohameden", "Farouk Luka", new java.sql.Date(1990, 07, 02), "faroukmohameden92@yahoo.fr", "+22244603576", "@farouki", "ID", "2011/2012", "2012/2013");
		System.out.println(ajout.getIdUniversite());
	}

}
