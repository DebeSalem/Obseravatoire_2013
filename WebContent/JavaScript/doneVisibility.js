function showMe(it, box) {
	var vis = box.checked ? "block" : "none";
	document.getElementById(it).style.display = vis;
}
function hideMe(it, box) {
	var vis = box.checked ? "none" : "block";
	document.getElementById(it).style.display = vis;
}