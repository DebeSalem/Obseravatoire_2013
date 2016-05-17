function is_int(value) {
	if (parseFloat(value) == parseInt(value) && !isNaN(value)) {
		return true;
	} else {
		return false;
	}
}
function valider(formulaire) {
	for ( var i = 0; i < formulaire.elements.length; i++) {
		if (formulaire.elements[i].style.display == "block"
				&& formulaire.elements[i].value == "") {
			alert("Veillez remplir tous les champs svp , ils sont obligatoires");
			return false;
		}
	}
	if (!is_int(document.getElementById("jourNaissance").value)) {
		alert("Veillez donner un nombre entier pour votre jour de naissance");
		return false;
	} else {
		return true;
	}
}