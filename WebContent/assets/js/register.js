function checkIfExists(emailAddress){
	if(emailAddress!= undefined && emailAddress!="" && emailAddress.indexOf('@') > 0){
	var params = {
		    email: emailAddress

		};


	 $.get("/MyMoney/CheckUserExistsServlet", $.param(params), function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
        if(responseText=="true"){
        	document.getElementById("emailExistsError").style.display = "";
        	document.getElementById("finishButton").style.display="none";
        	document.getElementById("Email").style.color="red";
        }

        else{
        	document.getElementById("emailExistsError").style.display = "none";
        	document.getElementById("finishButton").style.display="";
        	document.getElementById("Email").style.color="";
        }
     });
	}


}
function lastNameValidate(lastName){
	if(lastName!=undefined && lastName!=""){
		document.getElementById("salutLastname").style.display="";
		document.getElementById("salutLastnameLabel").innerHtml="Este o onoare sa te cunoastem!";



	}
	else{
		document.getElementById("salutLastname").style.display="none";

	}

}
function firstNameValidate(firstName){
	if(firstName!=undefined && firstName!=""){
		document.getElementById("salutFirstname").style.display="";


	}
	else{
		document.getElementById("salutFirstname").style.display="none";

	}
}
function validatePhone(phone){
if(phone!=undefined && phone!=""){
document.getElementById("phoneNumberSpan").style.display="";


}
else{
document.getElementById("phoneNumberSpan").style.display="none";

}


}

