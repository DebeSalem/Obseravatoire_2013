function bs(formulaire) {
	if (formulaire.elements["login"].value == ""
			|| formulaire.elements["password"].value == "") {
		alert("Veillez entrer votre nom d'utilisateur et votre mot de passe tous deux")
		return false;
	} else {
		return true;
	}
}
function is_int(value) {
	if (parseFloat(value) == parseInt(value) && !isNaN(value)) {
		return true;
	} else {
		return false;
	}
}
function valider(formulaire) {
	for ( var i = 0; i < formulaire.elements.length; i++) {
		if (formulaire.elements[i].value == "") {
			alert("Veillez remplir tous les champs svp , ils sont obligatoires");
			return false;
		}
	}
	if (!is_int(document.getElementById("jourNaissance").value)) {
		alert("Veillez donner un nombre entier pour votre jour de naissance");
		return false;
	}
	if (formulaire.elements["repsswd"].value != formulaire.elements["psswd"].value) {
		alert("Mots de passe non identiques");
		return false;
	} else {
		return true;
	}
}