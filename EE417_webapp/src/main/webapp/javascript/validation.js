window.onload = function(){ formsf(data)};
//Function to suggest full name
function suggest()
{
	var fsugg = document.getElementById("fsug");
	fsugg.innerHTML = "<strong>Ex: John Doe</strong>";
}


//Function to suggest email ID
function suggestemail()
{
	
	var emailsugg = document.getElementById("esug");
	emailsugg.innerHTML ="<strong>Ex.johndoe@gmail.com</strong>";
	
	var fsugg = document.getElementById("fsug");
	fsugg.innerHTML = "";

}
//function to suggest Details to enter
function detsuggest(){
	var dsugg = document.getElementById("dsug");
	dsugg.innerHTML ="<strong>Please enter your Query Details</strong>";
	 
	var fsugg = document.getElementById("esug");
	fsugg.innerHTML = "";
}

function upload()
{
	var fname = document.forms["contact"]["fullname"].value;
	var email = document.getElementById("email").value;
	var query = document.forms["contact"]["query"].value;
	var details = document.forms["contact"]["det"].value;

	//Checks if firstname is empty or not and last name are empty
	if(fname=="")
	{
		alert("Name Field must not be empty");
		return false;
	}
	//The email is checked for empty, valid and local storage is used again to check if emailid already exists or not.If yes, then alert is shown.
	if(email=="")
	{
		alert("Empty emailID field. Please enter your emailID");
		return false;
	
	}
	else
	{	
		if(email!=null){
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			if (!emailReg.test(email)) {
				alert("Enter a Valid Email");
				return false;
			}
		}
	}
	
	if(details=="")
	{
		alert("details must not be empty");
		return false;
	}

	alert("Your Query has been successfully submitted");
	
}



