var i =0;

function fun1(n){
	if(n==1)
		document.getElementById("categorylist").style.display = "block";
	else
		document.getElementById("categorylist").style.display = "none";
}

/*function changektaka(n){
	if(n==1)
		i++;
	else
		i--;
	i = i%5; 
	var backgrounds = [ "url(maxresdefault.jpg)", "url(karnataka-shimoga-149525186056-orijgp.jpg)", "url(photo-1519955045385-7cdb8e07c76f.jpg)", "url(kudremukh-tour-head-265.jpeg)", "url(Cocopelli_Sunset2.jpg)" ]
	document.getElementById("karnataka").style.backgroundImage = backgrounds[i];
}*/

function modalOpen(n){
	if(n==1)
		document.getElementById("signinmodal").style.display = "block";
	else
		document.getElementById("signinmodal").style.display = "none";
}