function bs(formulaire) {
	if (formulaire.elements["login"].value == ""
			|| formulaire.elements["password"].value == "") {
		alert("Veillez entrer votre nom d'utilisateur et votre mot de passe tous deux")
		return false;
	} else {
		return true;
	}
}