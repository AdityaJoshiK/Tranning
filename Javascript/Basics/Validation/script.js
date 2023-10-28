function formVal(event) {
    event.preventDefault();
    let error="";
    let full_name       = document.forms['myForms']['full_name'].value;
    let dob             = document.forms['myForms']['dob'].value;
    let gender          = document.forms['myForms']['gender'].value;
    let contact_number  = document.forms['myForms']['contact_number'].value;
    let email           = document.forms['myForms']['email'].value;
    let roll_number     = document.forms['myForms']['roll_number'].value;
    let department      = document.forms['myForms']['department'].value;
    let year            = document.forms['myForms']['year'].value;
    let checkboxes      = document.forms['myForms']['subjects'];
    let comments        = document.forms['myForms']['comments'].value;
    let file            = document.forms['myForms']['file'].value;

    
        let selectedSubjects = [];

        for (let i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                selectedSubjects.push(checkboxes[i].value);
            }
        }

        if (selectedSubjects.length === 0) {
            error += "Please select at least one subject.";
        }

        console.log(selectedSubjects);
        console.log(full_name);
        console.log(dob);
        console.log(gender);
        console.log(contact_number);
        console.log(email);
        console.log(roll_number);
        console.log(department);
        console.log(year);
        console.log(comments);
        console.log(file);

        if (full_name === "") {
            error += "<br/> Please Enter Full Name";
        }

        if (dob == "" ) {
            error += " <br/>Please Enter DOB";
        }

        if (gender === "") {
            error += " <br/>Please Enter gender";
        }

        if (contact_number === "") {
            error += " <br/>Please Enter contact number";
        }

        if (email === "") {
            error += " <br/>Please Enter email";
        }

        if (roll_number === "") {
            error += " <br/>Please Enter number";
        }

        if (year === "") {
            error += " <br/>Please Enter year";
        }

        if (comments === "") {
            error += " <br/>Please Enter roll comments";
        }

        let enteredDate  = new Date(dob);
        let currentDate = new Date();

        if (currentDate <= enteredDate) {
            error += "<br/> Please Enter Valid Date";
        }
        console.log(enteredDate)

        document.querySelector(".error").innerHTML = error;


    return false;
}