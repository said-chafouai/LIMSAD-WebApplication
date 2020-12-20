function utilisateur() {
			  var xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			      document.getElementById("demo").innerHTML = this.responseText;
			    }
			  };
			  xhttp.open("GET", "C:/Users/chaf-pc/Desktop/presentation/presentation/html/utilisateur.html", true);
			  xhttp.send();
}
function doctorant() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "C:/Users/chaf-pc/Desktop/presentation/presentation/html/doctorant.html", true);
  xhttp.send();
}

