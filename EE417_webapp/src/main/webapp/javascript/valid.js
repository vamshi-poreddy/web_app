window.onload = function(){ newdata()};
var data = [];

function newdata(){
	
	//localStoragegetItem and store it in arr
	var arr = localStorage.getItem('users');
		
	console.log(arr);
	if (arr!= null)
	{
	//need to parse the arr into JSON objectand store it in data array.Each index will have one JSON object
		data = JSON.parse(arr);
		console.log(data.length);
		for (var i=0; i<data.length;i++)
		{
//Each iteration will get the JSON object values using the keynames and send to table() method for updating the table.
		table(data[i].Firstname, data[i].Lastname, data[i].Email, data[i].Password, data[i].Gender,data[i].Dob, data[i].Address, data[i].Telephone, data[i].Card);
		}
		console.log(data[0]);
	}
}


//This function suggest the username next to the signup page form username input field when user clicks on it.
function suggest()
{
	var fsugg = document.getElementById("fsug");
	fsugg.innerHTML = "<strong>Ex: John</strong>";
}

function suggest2()
{
	var lsugg = document.getElementById("lsug");
	lsugg.innerHTML = "<strong>Ex. Doe</strong>";
	var fsugg = document.getElementById("fsug");
	fsugg.innerHTML = "";
}

//Same suggestion is given to emailid field of Signup page.
function suggestemail()
{
	
	var emailsugg = document.getElementById("emailsug");
	emailsugg.innerHTML ="<strong>Ex.johndoe@gmail.com</strong>";
	
	var lsugg = document.getElementById("lsug");
	lsugg.innerHTML = "";
	
}

function passug()
{
	var psugg = document.getElementById("psug");
	psugg.innerHTML = "<strong>Password must be min. of 8 characters long</strong>";
	var emailsugg = document.getElementById("emailsug");
	emailsugg.innerHTML ="";
}

function cpassug()
{
	var psugg = document.getElementById("psug");
	psugg.innerHTML = "";
}

function telsug(){
	var tsugg = document.getElementById("tsug");
	tsugg.innerHTML = "<strong>Phone Number must be all digits</strong>";
}


function upload()
{

 	var dt = document.forms["signup"]["dateob"].value;
	//var email = document.forms["signup"]["Email"].value;
	var str =dt.toString();
	var fname = document.forms["signup"]["firstname"].value;
	var lname = document.forms["signup"]["lastname"].value;
	var email = document.getElementById("email").value;
	var pass = document.forms["signup"]["pas"].value;
	var passconf = document.forms["signup"]["passconf"].value;
	var gender = document.forms["signup"]["gen"].value;
	var address = document.forms["signup"]["addr"].value;
	var telephone = document.forms["signup"]["tel"].value;
	var card = document.forms["signup"]["mc"].value;

	//Checks if firstname is empty or not and last name are empty
	if(fname=="")
	{
		alert("First name must not be empty"+gender);
		return false;
	}
	if(lname=="")
	{
		alert("Last name must not be empty "+card);
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
		var data =[];
		var array = [];
		var array = localStorage.getItem('users');
		console.log(array);
				if (array!= null)
				{
						data = JSON.parse(array);
						console.log(data.length);
						for (var i=0; i<data.length;i++)
						{
							if(email == data[i].Email){
								alert("Account with that EmailID already Exists");
								return false;
							}	
						}		
				}
	}

	if(pass=="")
	{
		alert("Password must not be empty");
		return false;
	}

	if(passconf=="")
	{
		alert("Confirm Password must not be empty");
		return false;
	}
	if(pass.length<8){
		alert("Password must be 8 characters long");
		return false;
	}
	//comparing the password with confirm password.
	if(pass!=passconf)
	{
		alert("Password are not matching");
		return false;
	}

	if(gender=="NA"){

		gender="Prefer not to say";		
	}

	if(str=="")
	{
		alert("Please enter your BirthDate");
		return false;
	}
	
	if(address=="")
	{
		alert("Address must not be empty");
		return false;
	}
	
	if(telephone=="")
	{
		alert("Contact no. must not be empty");
		return false;
	}
	//Valid phone number check
	else{
		var filter = /^[0-9-+]+$/;
		if (!filter.test(telephone)) {
			alert("Enter a Valid Phone number");
			return false;
		}	
	}

	if(card == "")
	{
		alert("BnP card is not selected");
		return false;
	}

	data.push(
		{
			Firstname: fname,
			Lastname: lname,
			Email: email,
			Password: "********",
			Gender: gender,
			Dob: dt,
			Address: address,
			Telephone: telephone,
			Card: card
		});
	console.log(data);
	//And JSON is stringified and set in the local storage to be called afterwards to update the table.
	localStorage.setItem('users', JSON.stringify(data));
	alert("Your Account has been successfully Created");
	
}


function table(fname,lname,email,pass,gender,dob,address,telephone,card)
{
	
	//insertrow() and insertcell() used to append in the table and store the above values as they come.
	var tab = document.getElementById("Users");
	var row = tab.insertRow();
	var firstcell = row.insertCell(0);
	firstcell.innerHTML = fname;
	var secondcell = row.insertCell(1);
	secondcell.innerHTML = lname;
	var thirdcell = row.insertCell(2);
	thirdcell.innerHTML = email;
	var fourthcell = row.insertCell(3);
	fourthcell.innerHTML = pass;
	var fifthcell = row.insertCell(4);
	fifthcell.innerHTML = gender;
	var sixthcell = row.insertCell(5);
	sixthcell.innerHTML = dob;
	var seventhcell = row.insertCell(6);
	seventhcell.innerHTML = address;
	var eighthcell = row.insertCell(7);
	eighthcell.innerHTML = telephone;
	var ninthcell = row.insertCell(8);
	ninthcell.innerHTML = card;
}

//Display users after clicking on the button.Once button click event this function will display the table which has the users who had registered.
function userdisplay()
{
	var userdisplay = document.getElementById("Users");
	userdisplay.style.removeProperty("display");
}

