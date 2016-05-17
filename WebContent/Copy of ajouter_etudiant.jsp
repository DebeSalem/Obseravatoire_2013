<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/Observatoire_2013/CSS/ajouter_etudiant.css" />
<title>Ajouter un nouveau etudiant</title>

</head>
<body bgcolor = "#387C1C">
	<div align = "center">
	<form action = "http://localhost:8080/Observatoire_2013/Controlle1" method = "POST">
		<div class = "collection" >
			<h1>Les informations de l'étudiant</h1>
			<hr width = "50%" align = "center">
			Nom <input type = "text" name = "nom"> <br>
			Prénom <input type = "text" name = "prenom"> <br>
			Date de Naissance : Jour : <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jourNaissance"> Mois :
			<select name = "moisNaissance">
				<option value="01">Janvier</option>
				<option value="02">Février</option> 
				<option value="03">Mars</option>
				<option value="04">Avril</option> 
				<option value="05">Mai</option>
				<option value="06">Juin</option> 
				<option value="07">Juillet</option>
				<option value="08">Aout</option> 
				<option value="09">Septembre</option>
				<option value="10">Octobre</option> 
				<option value="11">Novembre</option>
				<option value="12">Décembre</option> 
			</select>
			 <!-- input type = "text" name = "moisNaissance"--> Année : 
			<!-- input type = "text" name = "anneeNaissance"--> 
			<select name = "anneeNaissance">
				<option> 571</option>
				<% for(int i=571; i<=2013; i++){ %>
					<option value = "<%=i%>" ><%=i %></option>
					<%} %>
				}
			</select> <br>
			email <input type = "text" name = "email"><br>
			Numéro de téléphone <input type = "text" name = "numTel"><br>
			Adresse   <input type = "text" name = "adresse"> <br>
			Spécialité ISCAE <input type = "text" name = "spec_iscae"><br>
			Année d'entrée à l'ISCAE <input type = "text" name = "anneEntr"><br>
			Année de fin de formation à l'ISCAE <input type = "text" name = "anneeQuitt"><br>
			<br>
			<br>
			<h1><input type = "checkbox" name = "contEtud"> L'étudiant a-t-il continué ses études ? </h1>
			<hr width = "50%" align = "center">
			Nom de l'université <input type = "text" name = "nom_univ"> <br>  <br>
			Date de création de l'université <input type = "text" name = "date_cree_univ"> <br>  <br>
			Pays 
			<select name="pays"> 
				<option value="France">France </option>
				<option value="Afghanistan">Afghanistan </option>
				<option value="Afrique_Centrale">Afrique_Centrale </option>
				<option value="Afrique_du_sud">Afrique_du_Sud </option> 
				<option value="Albanie">Albanie </option>
				<option value="Algerie">Algerie </option>
				<option value="Allemagne">Allemagne </option>
				<option value="Andorre">Andorre </option>
				<option value="Angola">Angola </option>
				<option value="Anguilla">Anguilla </option>
				<option value="Arabie_Saoudite">Arabie_Saoudite </option>
				<option value="Argentine">Argentine </option>
				<option value="Armenie">Armenie </option> 
				<option value="Australie">Australie </option>
				<option value="Autriche">Autriche </option>
				<option value="Azerbaidjan">Azerbaidjan </option>
				<option value="Bahamas">Bahamas </option>
				<option value="Bangladesh">Bangladesh </option>
				<option value="Barbade">Barbade </option>
				<option value="Bahrein">Bahrein </option>
				<option value="Belgique">Belgique </option>
				<option value="Belize">Belize </option>
				<option value="Benin">Benin </option>
				<option value="Bermudes">Bermudes </option>
				<option value="Bielorussie">Bielorussie </option>
				<option value="Bolivie">Bolivie </option>
				<option value="Botswana">Botswana </option>
				<option value="Bhoutan">Bhoutan </option>
				<option value="Boznie_Herzegovine">Boznie_Herzegovine </option>
				<option value="Bresil">Bresil </option>
				<option value="Brunei">Brunei </option>
				<option value="Bulgarie">Bulgarie </option>
				<option value="Burkina_Faso">Burkina_Faso </option>
				<option value="Burundi">Burundi </option>
				<option value="Caiman">Caiman </option>
				<option value="Cambodge">Cambodge </option>
				<option value="Cameroun">Cameroun </option>
				<option value="Canada">Canada </option>
				<option value="Canaries">Canaries </option>
				<option value="Cap_vert">Cap_Vert </option>
				<option value="Chili">Chili </option>
				<option value="Chine">Chine </option> 
				<option value="Chypre">Chypre </option> 
				<option value="Colombie">Colombie </option>
				<option value="Comores">Colombie </option>
				<option value="Congo">Congo </option>
				<option value="Congo_democratique">Congo_democratique </option>
				<option value="Cook">Cook </option>
				<option value="Coree_du_Nord">Coree_du_Nord </option>
				<option value="Coree_du_Sud">Coree_du_Sud </option>
				<option value="Costa_Rica">Costa_Rica </option>
				<option value="Cote_d_Ivoire">Côte_d_Ivoire </option>
				<option value="Croatie">Croatie </option>
				<option value="Cuba">Cuba </option>
				<option value="Danemark">Danemark </option>
				<option value="Djibouti">Djibouti </option>
				<option value="Dominique">Dominique </option>
				<option value="Egypte">Egypte </option> 
				<option value="Emirats_Arabes_Unis">Emirats_Arabes_Unis </option>
				<option value="Equateur">Equateur </option>
				<option value="Erythree">Erythree </option>
				<option value="Espagne">Espagne </option>
				<option value="Estonie">Estonie </option>
				<option value="Etats_Unis">Etats_Unis </option>
				<option value="Ethiopie">Ethiopie </option>
				<option value="Falkland">Falkland </option>
				<option value="Feroe">Feroe </option>
				<option value="Fidji">Fidji </option>
				<option value="Finlande">Finlande </option>
				<option value="France">France </option>
				<option value="Gabon">Gabon </option>
				<option value="Gambie">Gambie </option>
				<option value="Georgie">Georgie </option>
				<option value="Ghana">Ghana </option>
				<option value="Gibraltar">Gibraltar </option>
				<option value="Grece">Grece </option>
				<option value="Grenade">Grenade </option>
				<option value="Groenland">Groenland </option>
				<option value="Guadeloupe">Guadeloupe </option>
				<option value="Guam">Guam </option>
				<option value="Guatemala">Guatemala</option>
				<option value="Guernesey">Guernesey </option>
				<option value="Guinee">Guinee </option>
				<option value="Guinee_Bissau">Guinee_Bissau </option>
				<option value="Guinee equatoriale">Guinee_Equatoriale </option>
				<option value="Guyana">Guyana </option>
				<option value="Guyane_Francaise ">Guyane_Francaise </option>
				<option value="Haiti">Haiti </option>
				<option value="Hawaii">Hawaii </option> 
				<option value="Honduras">Honduras </option>
				<option value="Hong_Kong">Hong_Kong </option>
				<option value="Hongrie">Hongrie </option>
				<option value="Inde">Inde </option>
				<option value="Indonesie">Indonesie </option>
				<option value="Iran">Iran </option>
				<option value="Iraq">Iraq </option>
				<option value="Irlande">Irlande </option>
				<option value="Islande">Islande </option>
				<option value="Israel">Israel </option>
				<option value="Italie">italie </option>
				<option value="Jamaique">Jamaique </option>
				<option value="Jan Mayen">Jan Mayen </option>
				<option value="Japon">Japon </option>
				<option value="Jersey">Jersey </option>
				<option value="Jordanie">Jordanie </option>
				<option value="Kazakhstan">Kazakhstan </option>
				<option value="Kenya">Kenya </option>
				<option value="Kirghizstan">Kirghizistan </option>
				<option value="Kiribati">Kiribati </option>
				<option value="Koweit">Koweit </option>
				<option value="Laos">Laos </option>
				<option value="Lesotho">Lesotho </option>
				<option value="Lettonie">Lettonie </option>
				<option value="Liban">Liban </option>
				<option value="Liberia">Liberia </option>
				<option value="Liechtenstein">Liechtenstein </option>
				<option value="Lituanie">Lituanie </option> 
				<option value="Luxembourg">Luxembourg </option>
				<option value="Lybie">Lybie </option>
				<option value="Macao">Macao </option>
				<option value="Macedoine">Macedoine </option>
				<option value="Madagascar">Madagascar </option>
				<option value="Madère">Madère </option>
				<option value="Malaisie">Malaisie </option>
				<option value="Malawi">Malawi </option>
				<option value="Maldives">Maldives </option>
				<option value="Mali">Mali </option>
				<option value="Malte">Malte </option>
				<option value="Man">Man </option>
				<option value="Mariannes du Nord">Mariannes du Nord </option>
				<option value="Maroc">Maroc </option>
				<option value="Marshall">Marshall </option>
				<option value="Martinique">Martinique </option>
				<option value="Maurice">Maurice </option>
				<option value="Mauritanie" selected="selected">Mauritanie </option>
				<option value="Mayotte">Mayotte </option>
				<option value="Mexique">Mexique </option>
				<option value="Micronesie">Micronesie </option>
				<option value="Midway">Midway </option>
				<option value="Moldavie">Moldavie </option>
				<option value="Monaco">Monaco </option>
				<option value="Mongolie">Mongolie </option>
				<option value="Montserrat">Montserrat </option>
				<option value="Mozambique">Mozambique </option>
				<option value="Namibie">Namibie </option>
				<option value="Nauru">Nauru </option>
				<option value="Nepal">Nepal </option>
				<option value="Nicaragua">Nicaragua </option>
				<option value="Niger">Niger </option>
				<option value="Nigeria">Nigeria </option>
				<option value="Niue">Niue </option>
				<option value="Norfolk">Norfolk </option>
				<option value="Norvege">Norvege </option>
				<option value="Nouvelle_Caledonie">Nouvelle_Caledonie </option>
				<option value="Nouvelle_Zelande">Nouvelle_Zelande </option>
				<option value="Oman">Oman </option>
				<option value="Ouganda">Ouganda </option>
				<option value="Ouzbekistan">Ouzbekistan </option>
				<option value="Pakistan">Pakistan </option>
				<option value="Palau">Palau </option>
				<option value="Palestine">Palestine </option>
				<option value="Panama">Panama </option>
				<option value="Papouasie_Nouvelle_Guinee">Papouasie_Nouvelle_Guinee </option>
				<option value="Paraguay">Paraguay </option>
				<option value="Pays_Bas">Pays_Bas </option>
				<option value="Perou">Perou </option>
				<option value="Philippines">Philippines </option> 
				<option value="Pologne">Pologne </option>
				<option value="Polynesie">Polynesie </option>
				<option value="Porto_Rico">Porto_Rico </option>
				<option value="Portugal">Portugal </option>
				<option value="Qatar">Qatar </option>
				<option value="Republique_Dominicaine">Republique_Dominicaine </option>
				<option value="Republique_Tcheque">Republique_Tcheque </option>
				<option value="Reunion">Reunion </option>
				<option value="Roumanie">Roumanie </option>
				<option value="Royaume_Uni">Royaume_Uni </option>
				<option value="Russie">Russie </option>
				<option value="Rwanda">Rwanda </option>
				<option value="Sahara Occidental">Sahara Occidental </option>
				<option value="Sainte_Lucie">Sainte_Lucie </option>
				<option value="Saint_Marin">Saint_Marin </option>
				<option value="Salomon">Salomon </option>
				<option value="Salvador">Salvador </option>
				<option value="Samoa_Occidentales">Samoa_Occidentales</option>
				<option value="Samoa_Americaine">Samoa_Americaine </option>
				<option value="Sao_Tome_et_Principe">Sao_Tome_et_Principe </option> 
				<option value="Senegal">Senegal </option> 
				<option value="Seychelles">Seychelles </option>
				<option value="Sierra Leone">Sierra Leone </option>
				<option value="Singapour">Singapour </option>
				<option value="Slovaquie">Slovaquie </option>
				<option value="Slovenie">Slovenie</option>
				<option value="Somalie">Somalie </option>
				<option value="Soudan">Soudan </option> 
				<option value="Sri_Lanka">Sri_Lanka </option> 
				<option value="Suede">Suede </option>
				<option value="Suisse">Suisse </option>
				<option value="Surinam">Surinam </option>
				<option value="Swaziland">Swaziland </option>
				<option value="Syrie">Syrie </option>
				<option value="Tadjikistan">Tadjikistan </option>
				<option value="Taiwan">Taiwan </option>
				<option value="Tonga">Tonga </option>
				<option value="Tanzanie">Tanzanie </option>
				<option value="Tchad">Tchad </option>
				<option value="Thailande">Thailande </option>
				<option value="Tibet">Tibet </option>
				<option value="Timor_Oriental">Timor_Oriental </option>
				<option value="Togo">Togo </option> 
				<option value="Trinite_et_Tobago">Trinite_et_Tobago </option>
				<option value="Tristan da cunha">Tristan de cuncha </option>
				<option value="Tunisie">Tunisie </option>
				<option value="Turkmenistan">Turmenistan </option> 
				<option value="Turquie">Turquie </option>
				<option value="Ukraine">Ukraine </option>
				<option value="Uruguay">Uruguay </option>
				<option value="Vanuatu">Vanuatu </option>
				<option value="Vatican">Vatican </option>
				<option value="Venezuela">Venezuela </option>
				<option value="Vierges_Americaines">Vierges_Americaines </option>
				<option value="Vierges_Britanniques">Vierges_Britanniques </option>
				<option value="Vietnam">Vietnam </option>
				<option value="Wake">Wake </option>
				<option value="Wallis et Futuma">Wallis et Futuma </option>
				<option value="Yemen">Yemen </option>
				<option value="Yougoslavie">Yougoslavie </option>
				<option value="Zambie">Zambie </option>
				<option value="Zimbabwe">Zimbabwe </option>
		</select> <br> <br>
		Adresse de l'université<input type = "text" name = "adresse_univ"> <br> <br>
		Email de l'université<input type = "text" name = "email_univ"> <br> <br>
		Site web de l'université <input type = "text" name = "site_web_univ"> <br> <br>
		Ville: <input type = "text" name = "vill_entr"> <br>
		Nom de la faculté <input type = "text" name = "nom_faclt"> <br>  <br>
		Domaine  <input type = "text" name = "domaine_etud"> <br>  <br>
		Filière <input type = "text" name = "filiere"> <br>  <br>
		Spécialité <input type = "text" name = "spec"> <br>  <br>
		Niveau <input type = "text" name = "nveau_etud_contin"> <br>  <br>
		Date du début d'études <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_debut_etudes"> Mois :
											<select name = "mois_debut_etudes">
												<option value="01">Janvier</option>
												<option value="02">Février</option> 
												<option value="03">Mars</option>
												<option value="04">Avril</option> 
												<option value="05">Mai</option>
												<option value="06">Juin</option> 
												<option value="07">Juillet</option>
												<option value="08">Aout</option> 
												<option value="09">Septembre</option>
												<option value="10">Octobre</option> 
												<option value="11">Novembre</option>
												<option value="12">Décembre</option> 
											</select>
											 <!-- input type = "text" name = "moisNaissance"--> Année : 
											<!-- input type = "text" name = "anneeNaissance"--> 
											<select name = "annee_debut_etudes">
												<option> 571</option>
												<% for(int i=571; i<=2013; i++){ %>
													<option value = "<%=i%>" ><%=i %></option>
													<%} %>
												}
											</select><br>  <br>
		Durée: <input type = "text" name = "duree"> <br>
		<h1><input type = "checkbox" name = "empl"> L'étudiant a-t-il été employé ? </h1> 
			<hr width = "50%" align = "center"> 
												Nom de l'entreprise : <input type = "text" name = "entre_emploi"> <br>
									 Poste : <input type = "text" name = "poste_entre"> <br>
									Pays : <select name="pays_empl"> 
											<option value="France" >France </option>
											<option value="Afghanistan">Afghanistan </option>
											<option value="Afrique_Centrale">Afrique_Centrale </option>
											<option value="Afrique_du_sud">Afrique_du_Sud </option> 
											<option value="Albanie">Albanie </option>
											<option value="Algerie">Algerie </option>
											<option value="Allemagne">Allemagne </option>
											<option value="Andorre">Andorre </option>
											<option value="Angola">Angola </option>
											<option value="Anguilla">Anguilla </option>
											<option value="Arabie_Saoudite">Arabie_Saoudite </option>
											<option value="Argentine">Argentine </option>
											<option value="Armenie">Armenie </option> 
											<option value="Australie">Australie </option>
											<option value="Autriche">Autriche </option>
											<option value="Azerbaidjan">Azerbaidjan </option>
											<option value="Bahamas">Bahamas </option>
											<option value="Bangladesh">Bangladesh </option>
											<option value="Barbade">Barbade </option>
											<option value="Bahrein">Bahrein </option>
											<option value="Belgique">Belgique </option>
											<option value="Belize">Belize </option>
											<option value="Benin">Benin </option>
											<option value="Bermudes">Bermudes </option>
											<option value="Bielorussie">Bielorussie </option>
											<option value="Bolivie">Bolivie </option>
											<option value="Botswana">Botswana </option>
											<option value="Bhoutan">Bhoutan </option>
											<option value="Boznie_Herzegovine">Boznie_Herzegovine </option>
											<option value="Bresil">Bresil </option>
											<option value="Brunei">Brunei </option>
											<option value="Bulgarie">Bulgarie </option>
											<option value="Burkina_Faso">Burkina_Faso </option>
											<option value="Burundi">Burundi </option>
											<option value="Caiman">Caiman </option>
											<option value="Cambodge">Cambodge </option>
											<option value="Cameroun">Cameroun </option>
											<option value="Canada">Canada </option>
											<option value="Canaries">Canaries </option>
											<option value="Cap_vert">Cap_Vert </option>
											<option value="Chili">Chili </option>
											<option value="Chine">Chine </option> 
											<option value="Chypre">Chypre </option> 
											<option value="Colombie">Colombie </option>
											<option value="Comores">Colombie </option>
											<option value="Congo">Congo </option>
											<option value="Congo_democratique">Congo_democratique </option>
											<option value="Cook">Cook </option>
											<option value="Coree_du_Nord">Coree_du_Nord </option>
											<option value="Coree_du_Sud">Coree_du_Sud </option>
											<option value="Costa_Rica">Costa_Rica </option>
											<option value="Cote_d_Ivoire">Côte_d_Ivoire </option>
											<option value="Croatie">Croatie </option>
											<option value="Cuba">Cuba </option>
											<option value="Danemark">Danemark </option>
											<option value="Djibouti">Djibouti </option>
											<option value="Dominique">Dominique </option>
											<option value="Egypte">Egypte </option> 
											<option value="Emirats_Arabes_Unis">Emirats_Arabes_Unis </option>
											<option value="Equateur">Equateur </option>
											<option value="Erythree">Erythree </option>
											<option value="Espagne">Espagne </option>
											<option value="Estonie">Estonie </option>
											<option value="Etats_Unis">Etats_Unis </option>
											<option value="Ethiopie">Ethiopie </option>
											<option value="Falkland">Falkland </option>
											<option value="Feroe">Feroe </option>
											<option value="Fidji">Fidji </option>
											<option value="Finlande">Finlande </option>
											<option value="France">France </option>
											<option value="Gabon">Gabon </option>
											<option value="Gambie">Gambie </option>
											<option value="Georgie">Georgie </option>
											<option value="Ghana">Ghana </option>
											<option value="Gibraltar">Gibraltar </option>
											<option value="Grece">Grece </option>
											<option value="Grenade">Grenade </option>
											<option value="Groenland">Groenland </option>
											<option value="Guadeloupe">Guadeloupe </option>
											<option value="Guam">Guam </option>
											<option value="Guatemala">Guatemala</option>
											<option value="Guernesey">Guernesey </option>
											<option value="Guinee">Guinee </option>
											<option value="Guinee_Bissau">Guinee_Bissau </option>
											<option value="Guinee equatoriale">Guinee_Equatoriale </option>
											<option value="Guyana">Guyana </option>
											<option value="Guyane_Francaise ">Guyane_Francaise </option>
											<option value="Haiti">Haiti </option>
											<option value="Hawaii">Hawaii </option> 
											<option value="Honduras">Honduras </option>
											<option value="Hong_Kong">Hong_Kong </option>
											<option value="Hongrie">Hongrie </option>
											<option value="Inde">Inde </option>
											<option value="Indonesie">Indonesie </option>
											<option value="Iran">Iran </option>
											<option value="Iraq">Iraq </option>
											<option value="Irlande">Irlande </option>
											<option value="Islande">Islande </option>
											<option value="Israel">Israel </option>
											<option value="Italie">italie </option>
											<option value="Jamaique">Jamaique </option>
											<option value="Jan Mayen">Jan Mayen </option>
											<option value="Japon">Japon </option>
											<option value="Jersey">Jersey </option>
											<option value="Jordanie">Jordanie </option>
											<option value="Kazakhstan">Kazakhstan </option>
											<option value="Kenya">Kenya </option>
											<option value="Kirghizstan">Kirghizistan </option>
											<option value="Kiribati">Kiribati </option>
											<option value="Koweit">Koweit </option>
											<option value="Laos">Laos </option>
											<option value="Lesotho">Lesotho </option>
											<option value="Lettonie">Lettonie </option>
											<option value="Liban">Liban </option>
											<option value="Liberia">Liberia </option>
											<option value="Liechtenstein">Liechtenstein </option>
											<option value="Lituanie">Lituanie </option> 
											<option value="Luxembourg">Luxembourg </option>
											<option value="Lybie">Lybie </option>
											<option value="Macao">Macao </option>
											<option value="Macedoine">Macedoine </option>
											<option value="Madagascar">Madagascar </option>
											<option value="Madère">Madère </option>
											<option value="Malaisie">Malaisie </option>
											<option value="Malawi">Malawi </option>
											<option value="Maldives">Maldives </option>
											<option value="Mali">Mali </option>
											<option value="Malte">Malte </option>
											<option value="Man">Man </option>
											<option value="Mariannes du Nord">Mariannes du Nord </option>
											<option value="Maroc">Maroc </option>
											<option value="Marshall">Marshall </option>
											<option value="Martinique">Martinique </option>
											<option value="Maurice">Maurice </option>
											<option value="Mauritanie" selected="selected">Mauritanie </option>
											<option value="Mayotte">Mayotte </option>
											<option value="Mexique">Mexique </option>
											<option value="Micronesie">Micronesie </option>
											<option value="Midway">Midway </option>
											<option value="Moldavie">Moldavie </option>
											<option value="Monaco">Monaco </option>
											<option value="Mongolie">Mongolie </option>
											<option value="Montserrat">Montserrat </option>
											<option value="Mozambique">Mozambique </option>
											<option value="Namibie">Namibie </option>
											<option value="Nauru">Nauru </option>
											<option value="Nepal">Nepal </option>
											<option value="Nicaragua">Nicaragua </option>
											<option value="Niger">Niger </option>
											<option value="Nigeria">Nigeria </option>
											<option value="Niue">Niue </option>
											<option value="Norfolk">Norfolk </option>
											<option value="Norvege">Norvege </option>
											<option value="Nouvelle_Caledonie">Nouvelle_Caledonie </option>
											<option value="Nouvelle_Zelande">Nouvelle_Zelande </option>
											<option value="Oman">Oman </option>
											<option value="Ouganda">Ouganda </option>
											<option value="Ouzbekistan">Ouzbekistan </option>
											<option value="Pakistan">Pakistan </option>
											<option value="Palau">Palau </option>
											<option value="Palestine">Palestine </option>
											<option value="Panama">Panama </option>
											<option value="Papouasie_Nouvelle_Guinee">Papouasie_Nouvelle_Guinee </option>
											<option value="Paraguay">Paraguay </option>
											<option value="Pays_Bas">Pays_Bas </option>
											<option value="Perou">Perou </option>
											<option value="Philippines">Philippines </option> 
											<option value="Pologne">Pologne </option>
											<option value="Polynesie">Polynesie </option>
											<option value="Porto_Rico">Porto_Rico </option>
											<option value="Portugal">Portugal </option>
											<option value="Qatar">Qatar </option>
											<option value="Republique_Dominicaine">Republique_Dominicaine </option>
											<option value="Republique_Tcheque">Republique_Tcheque </option>
											<option value="Reunion">Reunion </option>
											<option value="Roumanie">Roumanie </option>
											<option value="Royaume_Uni">Royaume_Uni </option>
											<option value="Russie">Russie </option>
											<option value="Rwanda">Rwanda </option>
											<option value="Sahara Occidental">Sahara Occidental </option>
											<option value="Sainte_Lucie">Sainte_Lucie </option>
											<option value="Saint_Marin">Saint_Marin </option>
											<option value="Salomon">Salomon </option>
											<option value="Salvador">Salvador </option>
											<option value="Samoa_Occidentales">Samoa_Occidentales</option>
											<option value="Samoa_Americaine">Samoa_Americaine </option>
											<option value="Sao_Tome_et_Principe">Sao_Tome_et_Principe </option> 
											<option value="Senegal">Senegal </option> 
											<option value="Seychelles">Seychelles </option>
											<option value="Sierra Leone">Sierra Leone </option>
											<option value="Singapour">Singapour </option>
											<option value="Slovaquie">Slovaquie </option>
											<option value="Slovenie">Slovenie</option>
											<option value="Somalie">Somalie </option>
											<option value="Soudan">Soudan </option> 
											<option value="Sri_Lanka">Sri_Lanka </option> 
											<option value="Suede">Suede </option>
											<option value="Suisse">Suisse </option>
											<option value="Surinam">Surinam </option>
											<option value="Swaziland">Swaziland </option>
											<option value="Syrie">Syrie </option>
											<option value="Tadjikistan">Tadjikistan </option>
											<option value="Taiwan">Taiwan </option>
											<option value="Tonga">Tonga </option>
											<option value="Tanzanie">Tanzanie </option>
											<option value="Tchad">Tchad </option>
											<option value="Thailande">Thailande </option>
											<option value="Tibet">Tibet </option>
											<option value="Timor_Oriental">Timor_Oriental </option>
											<option value="Togo">Togo </option> 
											<option value="Trinite_et_Tobago">Trinite_et_Tobago </option>
											<option value="Tristan da cunha">Tristan de cuncha </option>
											<option value="Tunisie">Tunisie </option>
											<option value="Turkmenistan">Turmenistan </option> 
											<option value="Turquie">Turquie </option>
											<option value="Ukraine">Ukraine </option>
											<option value="Uruguay">Uruguay </option>
											<option value="Vanuatu">Vanuatu </option>
											<option value="Vatican">Vatican </option>
											<option value="Venezuela">Venezuela </option>
											<option value="Vierges_Americaines">Vierges_Americaines </option>
											<option value="Vierges_Britanniques">Vierges_Britanniques </option>
											<option value="Vietnam">Vietnam </option>
											<option value="Wake">Wake </option>
											<option value="Wallis et Futuma">Wallis et Futuma </option>
											<option value="Yemen">Yemen </option>
											<option value="Yougoslavie">Yougoslavie </option>
											<option value="Zambie">Zambie </option>
											<option value="Zimbabwe">Zimbabwe </option>
											</select> <br>
											Ville: <input type = "text" name = "vill_entr"> <br>
											Type de service : <input type = "text" name = "type_serv_entreprise"> <br>
		
											Adresse de l'entreprise : <input type = "text" name = "adress_entreprise"> <br>
											Email de l'entreprse<input type = "text" name = "email_entreprise"> <br> <br>
											Site web de l'entreprise <input type = "text" name = "site_web_entreprise"> <br> <br>
											Date du début de l'emploi: <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_debut_empl"> Mois :
											<select name = "mois_debut_empl">
												<option value="01">Janvier</option>
												<option value="02">Février</option> 
												<option value="03">Mars</option>
												<option value="04">Avril</option> 
												<option value="05">Mai</option>
												<option value="06">Juin</option> 
												<option value="07">Juillet</option>
												<option value="08">Aout</option> 
												<option value="09">Septembre</option>
												<option value="10">Octobre</option> 
												<option value="11">Novembre</option>
												<option value="12">Décembre</option> 
											</select>
											 <!-- input type = "text" name = "moisNaissance"--> Année : 
											<!-- input type = "text" name = "anneeNaissance"--> 
											<select name = "annee_debut_empl">
												<option> 571</option>
												<% for(int i=571; i<=2013; i++){ %>
													<option value = "<%=i%>" ><%=i %></option>
													<%} %>
												}
											</select> <br>
											   
			<!--  Cas de création d'une entreprise-->
			<h1><input type = "checkbox" name = "cree_entr"> L'étudiant a-t-il créé une entreprise ?|</h1> 
			<hr width = "50%" align = "center"> 
												Nom de l'entreprise : <input type = "text" name = "nom_cree_entr"> <br>
									 Poste : <input type = "text" name = "poste_cree_entr"> <br>
									Pays : <select name="pays_cree_entr"> 
											<option value="France" >France </option>
											<option value="Afghanistan">Afghanistan </option>
											<option value="Afrique_Centrale">Afrique_Centrale </option>
											<option value="Afrique_du_sud">Afrique_du_Sud </option> 
											<option value="Albanie">Albanie </option>
											<option value="Algerie">Algerie </option>
											<option value="Allemagne">Allemagne </option>
											<option value="Andorre">Andorre </option>
											<option value="Angola">Angola </option>
											<option value="Anguilla">Anguilla </option>
											<option value="Arabie_Saoudite">Arabie_Saoudite </option>
											<option value="Argentine">Argentine </option>
											<option value="Armenie">Armenie </option> 
											<option value="Australie">Australie </option>
											<option value="Autriche">Autriche </option>
											<option value="Azerbaidjan">Azerbaidjan </option>
											<option value="Bahamas">Bahamas </option>
											<option value="Bangladesh">Bangladesh </option>
											<option value="Barbade">Barbade </option>
											<option value="Bahrein">Bahrein </option>
											<option value="Belgique">Belgique </option>
											<option value="Belize">Belize </option>
											<option value="Benin">Benin </option>
											<option value="Bermudes">Bermudes </option>
											<option value="Bielorussie">Bielorussie </option>
											<option value="Bolivie">Bolivie </option>
											<option value="Botswana">Botswana </option>
											<option value="Bhoutan">Bhoutan </option>
											<option value="Boznie_Herzegovine">Boznie_Herzegovine </option>
											<option value="Bresil">Bresil </option>
											<option value="Brunei">Brunei </option>
											<option value="Bulgarie">Bulgarie </option>
											<option value="Burkina_Faso">Burkina_Faso </option>
											<option value="Burundi">Burundi </option>
											<option value="Caiman">Caiman </option>
											<option value="Cambodge">Cambodge </option>
											<option value="Cameroun">Cameroun </option>
											<option value="Canada">Canada </option>
											<option value="Canaries">Canaries </option>
											<option value="Cap_vert">Cap_Vert </option>
											<option value="Chili">Chili </option>
											<option value="Chine">Chine </option> 
											<option value="Chypre">Chypre </option> 
											<option value="Colombie">Colombie </option>
											<option value="Comores">Colombie </option>
											<option value="Congo">Congo </option>
											<option value="Congo_democratique">Congo_democratique </option>
											<option value="Cook">Cook </option>
											<option value="Coree_du_Nord">Coree_du_Nord </option>
											<option value="Coree_du_Sud">Coree_du_Sud </option>
											<option value="Costa_Rica">Costa_Rica </option>
											<option value="Cote_d_Ivoire">Côte_d_Ivoire </option>
											<option value="Croatie">Croatie </option>
											<option value="Cuba">Cuba </option>
											<option value="Danemark">Danemark </option>
											<option value="Djibouti">Djibouti </option>
											<option value="Dominique">Dominique </option>
											<option value="Egypte">Egypte </option> 
											<option value="Emirats_Arabes_Unis">Emirats_Arabes_Unis </option>
											<option value="Equateur">Equateur </option>
											<option value="Erythree">Erythree </option>
											<option value="Espagne">Espagne </option>
											<option value="Estonie">Estonie </option>
											<option value="Etats_Unis">Etats_Unis </option>
											<option value="Ethiopie">Ethiopie </option>
											<option value="Falkland">Falkland </option>
											<option value="Feroe">Feroe </option>
											<option value="Fidji">Fidji </option>
											<option value="Finlande">Finlande </option>
											<option value="France">France </option>
											<option value="Gabon">Gabon </option>
											<option value="Gambie">Gambie </option>
											<option value="Georgie">Georgie </option>
											<option value="Ghana">Ghana </option>
											<option value="Gibraltar">Gibraltar </option>
											<option value="Grece">Grece </option>
											<option value="Grenade">Grenade </option>
											<option value="Groenland">Groenland </option>
											<option value="Guadeloupe">Guadeloupe </option>
											<option value="Guam">Guam </option>
											<option value="Guatemala">Guatemala</option>
											<option value="Guernesey">Guernesey </option>
											<option value="Guinee">Guinee </option>
											<option value="Guinee_Bissau">Guinee_Bissau </option>
											<option value="Guinee equatoriale">Guinee_Equatoriale </option>
											<option value="Guyana">Guyana </option>
											<option value="Guyane_Francaise ">Guyane_Francaise </option>
											<option value="Haiti">Haiti </option>
											<option value="Hawaii">Hawaii </option> 
											<option value="Honduras">Honduras </option>
											<option value="Hong_Kong">Hong_Kong </option>
											<option value="Hongrie">Hongrie </option>
											<option value="Inde">Inde </option>
											<option value="Indonesie">Indonesie </option>
											<option value="Iran">Iran </option>
											<option value="Iraq">Iraq </option>
											<option value="Irlande">Irlande </option>
											<option value="Islande">Islande </option>
											<option value="Israel">Israel </option>
											<option value="Italie">italie </option>
											<option value="Jamaique">Jamaique </option>
											<option value="Jan Mayen">Jan Mayen </option>
											<option value="Japon">Japon </option>
											<option value="Jersey">Jersey </option>
											<option value="Jordanie">Jordanie </option>
											<option value="Kazakhstan">Kazakhstan </option>
											<option value="Kenya">Kenya </option>
											<option value="Kirghizstan">Kirghizistan </option>
											<option value="Kiribati">Kiribati </option>
											<option value="Koweit">Koweit </option>
											<option value="Laos">Laos </option>
											<option value="Lesotho">Lesotho </option>
											<option value="Lettonie">Lettonie </option>
											<option value="Liban">Liban </option>
											<option value="Liberia">Liberia </option>
											<option value="Liechtenstein">Liechtenstein </option>
											<option value="Lituanie">Lituanie </option> 
											<option value="Luxembourg">Luxembourg </option>
											<option value="Lybie">Lybie </option>
											<option value="Macao">Macao </option>
											<option value="Macedoine">Macedoine </option>
											<option value="Madagascar">Madagascar </option>
											<option value="Madère">Madère </option>
											<option value="Malaisie">Malaisie </option>
											<option value="Malawi">Malawi </option>
											<option value="Maldives">Maldives </option>
											<option value="Mali">Mali </option>
											<option value="Malte">Malte </option>
											<option value="Man">Man </option>
											<option value="Mariannes du Nord">Mariannes du Nord </option>
											<option value="Maroc">Maroc </option>
											<option value="Marshall">Marshall </option>
											<option value="Martinique">Martinique </option>
											<option value="Maurice">Maurice </option>
											<option value="Mauritanie" selected="selected">Mauritanie </option>
											<option value="Mayotte">Mayotte </option>
											<option value="Mexique">Mexique </option>
											<option value="Micronesie">Micronesie </option>
											<option value="Midway">Midway </option>
											<option value="Moldavie">Moldavie </option>
											<option value="Monaco">Monaco </option>
											<option value="Mongolie">Mongolie </option>
											<option value="Montserrat">Montserrat </option>
											<option value="Mozambique">Mozambique </option>
											<option value="Namibie">Namibie </option>
											<option value="Nauru">Nauru </option>
											<option value="Nepal">Nepal </option>
											<option value="Nicaragua">Nicaragua </option>
											<option value="Niger">Niger </option>
											<option value="Nigeria">Nigeria </option>
											<option value="Niue">Niue </option>
											<option value="Norfolk">Norfolk </option>
											<option value="Norvege">Norvege </option>
											<option value="Nouvelle_Caledonie">Nouvelle_Caledonie </option>
											<option value="Nouvelle_Zelande">Nouvelle_Zelande </option>
											<option value="Oman">Oman </option>
											<option value="Ouganda">Ouganda </option>
											<option value="Ouzbekistan">Ouzbekistan </option>
											<option value="Pakistan">Pakistan </option>
											<option value="Palau">Palau </option>
											<option value="Palestine">Palestine </option>
											<option value="Panama">Panama </option>
											<option value="Papouasie_Nouvelle_Guinee">Papouasie_Nouvelle_Guinee </option>
											<option value="Paraguay">Paraguay </option>
											<option value="Pays_Bas">Pays_Bas </option>
											<option value="Perou">Perou </option>
											<option value="Philippines">Philippines </option> 
											<option value="Pologne">Pologne </option>
											<option value="Polynesie">Polynesie </option>
											<option value="Porto_Rico">Porto_Rico </option>
											<option value="Portugal">Portugal </option>
											<option value="Qatar">Qatar </option>
											<option value="Republique_Dominicaine">Republique_Dominicaine </option>
											<option value="Republique_Tcheque">Republique_Tcheque </option>
											<option value="Reunion">Reunion </option>
											<option value="Roumanie">Roumanie </option>
											<option value="Royaume_Uni">Royaume_Uni </option>
											<option value="Russie">Russie </option>
											<option value="Rwanda">Rwanda </option>
											<option value="Sahara Occidental">Sahara Occidental </option>
											<option value="Sainte_Lucie">Sainte_Lucie </option>
											<option value="Saint_Marin">Saint_Marin </option>
											<option value="Salomon">Salomon </option>
											<option value="Salvador">Salvador </option>
											<option value="Samoa_Occidentales">Samoa_Occidentales</option>
											<option value="Samoa_Americaine">Samoa_Americaine </option>
											<option value="Sao_Tome_et_Principe">Sao_Tome_et_Principe </option> 
											<option value="Senegal">Senegal </option> 
											<option value="Seychelles">Seychelles </option>
											<option value="Sierra Leone">Sierra Leone </option>
											<option value="Singapour">Singapour </option>
											<option value="Slovaquie">Slovaquie </option>
											<option value="Slovenie">Slovenie</option>
											<option value="Somalie">Somalie </option>
											<option value="Soudan">Soudan </option> 
											<option value="Sri_Lanka">Sri_Lanka </option> 
											<option value="Suede">Suede </option>
											<option value="Suisse">Suisse </option>
											<option value="Surinam">Surinam </option>
											<option value="Swaziland">Swaziland </option>
											<option value="Syrie">Syrie </option>
											<option value="Tadjikistan">Tadjikistan </option>
											<option value="Taiwan">Taiwan </option>
											<option value="Tonga">Tonga </option>
											<option value="Tanzanie">Tanzanie </option>
											<option value="Tchad">Tchad </option>
											<option value="Thailande">Thailande </option>
											<option value="Tibet">Tibet </option>
											<option value="Timor_Oriental">Timor_Oriental </option>
											<option value="Togo">Togo </option> 
											<option value="Trinite_et_Tobago">Trinite_et_Tobago </option>
											<option value="Tristan da cunha">Tristan de cuncha </option>
											<option value="Tunisie">Tunisie </option>
											<option value="Turkmenistan">Turmenistan </option> 
											<option value="Turquie">Turquie </option>
											<option value="Ukraine">Ukraine </option>
											<option value="Uruguay">Uruguay </option>
											<option value="Vanuatu">Vanuatu </option>
											<option value="Vatican">Vatican </option>
											<option value="Venezuela">Venezuela </option>
											<option value="Vierges_Americaines">Vierges_Americaines </option>
											<option value="Vierges_Britanniques">Vierges_Britanniques </option>
											<option value="Vietnam">Vietnam </option>
											<option value="Wake">Wake </option>
											<option value="Wallis et Futuma">Wallis et Futuma </option>
											<option value="Yemen">Yemen </option>
											<option value="Yougoslavie">Yougoslavie </option>
											<option value="Zambie">Zambie </option>
											<option value="Zimbabwe">Zimbabwe </option>
											</select> <br>
											Ville: <input type = "text" name = "vill_cree_entr"> <br>
											Type de service : <input type = "text" name = "type_serv_cree_entr"> <br>
		
											Adresse : <input type = "text" name = "adress_cree_entr"> <br>
											Email : <input type = "text" name = "email_cree_entr"> <br>
											Site web: <input type = "text" name = "site_web_cree_entr"> <br>
											Date de création : <input type = "text" maxvalue = "2" maxlength = "2" size = "2" name = "jour_cree_entr"> Mois :
											<select name = "mois_cree_entr">
												<option value="01">Janvier</option>
												<option value="02">Février</option> 
												<option value="03">Mars</option>
												<option value="04">Avril</option> 
												<option value="05">Mai</option>
												<option value="06">Juin</option> 
												<option value="07">Juillet</option>
												<option value="08">Aout</option> 
												<option value="09">Septembre</option>
												<option value="10">Octobre</option> 
												<option value="11">Novembre</option>
												<option value="12">Décembre</option> 
											</select>
											 <!-- input type = "text" name = "moisNaissance"--> Année : 
											<!-- input type = "text" name = "anneeNaissance"--> 
											<select name = "annee_cree_entr">
												<option> 571</option>
												<% for(int i=571; i<=2013; i++){ %>
													<option value = "<%=i%>" ><%=i %></option>
													<%} %>
												}
											</select> <br>
											   
			<h1><input type = "checkbox" name = "autre_chs"> Autre chose ?</h1> 
				<hr width = "50%" >
							<div style = "padding-left:20px;">	
									<textarea name = "text_area_express" value = "" rows = "5" cols = "80" > 
										Veillez vous vous exprimer ici
									</textarea> <br>

							</div>
		<input type = "submit" value = "Envoyer"> 	 
		</div>
	</form>
	</div>
</body>
</html>