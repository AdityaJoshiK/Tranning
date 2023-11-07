let form = $(".loginform");
let uname = "", loginpwd = "";

// Login Form Validation Start
$(document).ready(function () {
    form.on("input", function (e) {
        uname = form[0].uname.value;
        loginpwd = form[0].loginpwd.value;
        login(e);
    })
})

//Login Validation Function
function login(e) {
    //Validating Username
    let pattern = /^[A-Za-z]+$/;
    if (uname == "") {
        setError("uname", "First Name is required.")
    }
    else if (!pattern.test(uname)) {
        setError("uname", "First Name Can't be Number or Special Chaarcter.")
    }
    else if (uname.length < 5) {
        setError("uname", "First Name Length Should be minimum 5.")
    }
    else if (uname.length > 10) {
        setError("uname", "First Name Length Should be maximum 10.")
    }
    else {
        clearError("uname")
    }

    // Validating Password
    let regexp = /[A-Z]+[a-z]+[!@#$%^&*]\d/
    if (loginpwd == "") {
        setError("loginpwd", "Password Can't Be Empty")
    }
    else if (!regexp.test(loginpwd) || loginpwd.length <= 8) {
        setError("loginpwd", "Password Should Contains Captial,Small,Number and Special Character and length 8")

    }
    else {
        clearError("loginpwd")
        if (e == "" || e == undefined) {
            const data = `\nUsername:${uname}\nPassword:${loginpwd}`;
            alert("Your Entered Data is:" + data)
        }
        return true;
    }

    return false;
}
// Login Form Validation End

// Common Functions Start
function setError(element, error) {
    let errortag = $(`.regerror__${element}`);
    errortag.html(error);
}

function setDone(element) {
    let done = $(`.regdone__${element}`)
    done.css("visibility", "visible");
}

function clearDone(element) {
    let done = $(`.regdone__${element}`)
    done.css("visibility", "hidden");
}

function clearError(element) {
    let errortag = $(`.regerror__${element}`);
    errortag.html("");
}
// Common Functions End

//Registration Form Validaton Start
const regform = $(".regform");

let fname = "";
let lname = "";
let pwd = "";
let cpwd = "";
let dob = "";
let gender = "";
let phone = "";
let email = "";
let cemail = "";
let address = "";
let city = "";
let state = "";
let code = "";
let country = "";
let chks = "";
let file = "";
let terms = "";
let checked = [];

$(document).ready(function () {
    regform.on('input', function (e) {
        fname = regform[0].fname.value;
        lname = regform[0].lname.value;
        pwd = regform[0].pwd.value;
        cpwd = regform[0].cpwd.value;
        dob = regform[0].dob.value;
        gender = regform[0].gender.value;
        phone = regform[0].phone.value;
        email = regform[0].email.value;
        cemail = regform[0].cemail.value;
        address = regform[0].address.value;
        city = regform[0].city.value;
        state = regform[0].state.value;
        code = regform[0].code.value;
        country = regform[0].country.value;
        chks = regform[0].hobby;
        file = regform[0].file.value;
        terms = regform[0].terms.checked;
        checked = [];

        $("[name|='hobby']").each(function (i) {
            const element = $("[name|='hobby']")[i];
            if (element.checked) {
                checked.push(element.value)
            }
        })

        register(e);
    })
})

function register(e) {

    namev = validateFirstandLastName(fname, lname, checked);
    passwd = validatePassword(pwd, cpwd, terms);
    dobdate = validateDobAndGender(dob, gender, file);
    emailphone = validateEmailAndPhone(phone, email, cemail)
    addressdata = validateAddress(address, city, state, code, country)
    const fileName = file.split('\\').pop();
    console.log(namev)
    console.log(passwd)
    console.log(dobdate)
    console.log(emailphone)
    console.log(addressdata)
    if (namev && passwd && dobdate && emailphone && addressdata && (e == undefined || e == "")) {
        const data = `First Name: ${fname}\nLast Name: ${lname}\nPassword: ${pwd}\nConfirm Password: ${cpwd}\nDate of Birth: ${dob}\nGender: ${gender}\nPhone: ${phone}\nEmail: ${email}\nConfirm Email: ${cemail}\nAddress: ${address}\nCity: ${city}\nState: ${state}\nPostal Code: ${code}\nCountry: ${country}\nFile: ${file}\nFilename: ${fileName}\nHobbies: ${checked}`;

        //Send Email to User
        Email.send({
            SecureToken : "c437e42c-4b86-4553-b964-63decbeb71a9",
            From: "demoabcd17@gmail.com",
            To: `${email}`,
            Subject: "Thanks For Submiiting Form",
            Body: `<html>
            <body>
            <h3>Your Submitted Data is</h3><br/> 
                <p><strong>First Name:</strong> ${fname}</p>
                <p><strong>Last Name:</strong> ${lname}</p>
                <p><strong>Password:</strong> ${pwd}</p>
                <p><strong>Confirm Password:</strong> ${cpwd}</p>
                <p><strong>Date of Birth:</strong> ${dob}</p>
                <p><strong>Gender:</strong> ${gender}</p>
                <p><strong>Phone:</strong> ${phone}</p>
                <p><strong>Email:</strong> ${email}</p>
                <p><strong>Confirm Email:</strong> ${cemail}</p>
                <p><strong>Address:</strong> ${address}</p>
                <p><strong>City:</strong> ${city}</p>
                <p><strong>State:</strong> ${state}</p>
                <p><strong>Postal Code:</strong> ${code}</p>
                <p><strong>Country:</strong> ${country}</p>
                <p><strong>File:</strong> ${file}</p>
                <p><strong>Filename:</strong> ${fileName}</p>
                <p><strong>Hobbies:</strong> ${checked}</p>
            </body>
        </html>`
        }).then(
            message => alert("Data is Submitted Sucessfully, Please Check Your Mail. (If you not found then please check your Spam Folder)")
        );
        console.clear();
        alert("Data Submitted, Your Data is:\n" + data);

        return true;
    }
    return false;
}

function validateFirstandLastName(fname, lname, checked) {
    let pattern = /^[A-Za-z]+$/;
    let fnamevalidate=false;
    let lnamevalidate=false;
    let checkedvalidate=false;
    if (fname == "") {
        setError("fname", "First Name is required.")
        clearDone("fname");
        fnamevalidate=false;
    }
    else if (!pattern.test(fname)) {
        setError("fname", "First Name Can't be Number or Special Chaarcter.")
        clearDone("fname");
        fnamevalidate=false;
    }
    else if (fname.length < 5) {
        setError("fname", "First Name Length Should be minimum 5.")
        clearDone("fname");
        fnamevalidate=false;
    }
    else if (fname.length > 10) {
        setError("fname", "First Name Length Should be maximum 10.")
        clearDone("fname");
        fnamevalidate=false;
    }
    else {
        clearError("fname");
        setDone("fname");
        fnamevalidate=true;

    }
    if (lname == "") {
        setError("lname", "Last Name is required.")
        clearDone("lname");
        lnamevalidate=false;

    }
    else if (!pattern.test(lname)) {
        setError("lname", "Last Name Can't be Number or Special Chaarcter.")
        clearDone("lname");
        lnamevalidate=false;
    }
    else if (lname.length < 5) {
        setError("lname", "First Name Length Should be minimum 5.")
        clearDone("fname");
        lnamevalidate=false;
    }
    else if (lname.length > 10) {
        setError("lname", "Last Name Length Should be maximum 10.")
        clearDone("lname");
        lnamevalidate=false;
    }
    else {
        clearError("lname");
        setDone("lname");
        lnamevalidate=true;
    }
    if (checked.length == "") {
        setError("chkerror", "Please Select at least one Hobby.")
        clearDone("chkerror");
        checkedvalidate=false;
    }
    else {
        clearError("chkerror")
        setDone("chkerror");
        checkedvalidate=true;
    }
    if (!checkedvalidate || !fnamevalidate || !lnamevalidate) {
        return false
    }
    return true;
}

function validatePassword(pwd, cpwd, terms) {
    let regexp = /[A-Z]+[a-z]+[!@#$%^&*]\d/
    let pwdvalidate = false;
    let cpwdvalidate = false;
    let termsvalidate = false;
    if (pwd == "") {
        setError("pwd", "Password Can't Be Empty")
        clearDone("pwd");
        pwdvalidate = false;
    }
    else if (!regexp.test(pwd) || pwd.length <= 8) {
        setError("pwd", "Password Should Contains Captial,Small,Number and Special Character and length 8")
        clearDone("pwd");
        pwdvalidate = false;
    }
    else {
        clearError("pwd")
        isTrue = true;
        setDone("pwd");
        pwdvalidate = true;
    }
    if (pwd == "" || !isTrue) {
        setError("cpwd", "Please First Enter Password Properly.")
        clearDone("cpwd");
        cpwdvalidate = false;
    }
    else if (cpwd == "") {
        setError("cpwd", "Confirm Password is required.")
        clearDone("cpwd");
        cpwdvalidate = false;
    }
    else if (pwd != cpwd) {
        setError("cpwd", "Both Password is Not Same.")
        clearDone("cpwd");
        cpwdvalidate = false;
    }
    else {
        clearError("cpwd")
        setDone("cpwd");
        cpwdvalidate = true;
    }
    if (terms) {
        clearError("terms");
        termsvalidate = true;
    }
    else {
        setError("terms", "You Must Accept Terms And Conditions.");
        termsvalidate = false;;
    }
    if (!pwdvalidate || !cpwdvalidate || !termsvalidate) {
        return false;
    }
    return true;
}

function validateDobAndGender(dob, gender, file) {
    let dobvalidate = false;
    let gendervalidate = false;
    let filevalidate = false;
    const enteredDate = new Date(dob);
    const currentDate = new Date();

    if (dob == "") {
        setError("dob", "Date of Birth is required.")
        clearDone("dob")
        dobvalidate = false;
    }
    else if (enteredDate > currentDate) {
        setError("dob", "Please Enter Valid Date.")
        clearDone("dob")
        dobvalidate = false;
    }
    else {
        clearError("dob")
        setDone("dob")
        dobvalidate = true;
    }
    console.log("file"+file)
    if (file == "") {
        setError("file", "File is required.")
        clearDone("file")
        filevalidate = false;
    }
    else {
        clearError("file")
        setDone("file")
        filevalidate = true;
    }
    if (gender == "") {
        setError("gender", "Gender is required.")
        clearDone("gender");
        gendervalidate = false;
    }
    else {
        clearError("gender")
        setDone("gender");
        gendervalidate = true;
    }
    
    if (!dobvalidate || !gendervalidate || !filevalidate) {
        return false;
    }
    return true;
}

function validateEmailAndPhone(phone, email, cemail) {
    let phonevalidate=false;
    let emailvalidate=false;
    let cemailvalidate=false;
    if (phone == "") {
        setError("phone", "Phone is required.")
        clearDone("phone")
        phonevalidate = false;
    }
    else if (phone.length < 10) {
        setError("phone", "Phone Number Length Should be 10")
        clearDone("phone");
        phonevalidate = false;
    }
    else {
        clearError("phone")
        setDone("phone")
        phonevalidate = true;
    }
    let regexp = /^([a-z0-9\.-]+)@([a-z0.9-]+).([a-z]{2,8})(.[a-z]{2,8})$/
    if (email == "") {
        setError("email", "Email is required.")
        emailvalidate = false;
    }
    else if (!regexp.test(email)) {
        setError("email", "Email is Not in Proper Format.")
        clearDone("email")
        emailvalidate = false;
    }
    else {
        clearError("email")
        setDone("email")
        emailvalidate = true;
    }
    if (cemail == "") {
        setError("cemail", "Confirm Email is required.")
        clearDone("cemail")
        cemailvalidate = false;
    }
    else if (email != cemail) {
        setError("cemail", "Both Email Should Be Same")
        clearDone("cemail")
        cemailvalidate = false;
    }
    else {
        clearError("cemail")
        setDone("cemail")
        cemailvalidate = true;
    }
    if (!phonevalidate || !emailvalidate || !cemailvalidate) {
        return false;
    }
    return true;
}

function validateAddress(address, city, state, code, country) {
    let addressvalidate = false;
    let cityvalidate = false;
    let statevalidate = false;
    let codevalidate = false;
    let countryvalidate = false;
    if (address == "") {
        setError("address", "Address is required.")
        clearDone("address")
        addressvalidate = false;
    }
    else {
        clearError("address")
        setDone("address")
        addressvalidate = true;

    }
    if (city == "Select City" || city == "") {
        setError("city", "City is required.")
        clearDone("city")
        cityvalidate = false;
    }
    else {
        clearError("city")
        setDone("city")
        cityvalidate = true;

    }
    if (state == "Select State" || state == "") {
        setError("state", "State is required.")
        clearDone("state")
        statevalidate = false;
    }
    else {
        clearError("state")
        setDone("state")
        statevalidate = true;
    }
    let pattern = /^\d{6}$/;
    if (code == "") {
        setError("code", "Postal Code is required.")
        clearDone("code");
        codevalidate = false;
    }
    else if (!pattern.test(code)) {
        setError("code", "Postal Code is Not in Proper format.")
        clearDone("code");
        codevalidate = false;
    }
    else {
        clearError("code");
        setDone("code");
        codevalidate = true;
    }
    let countryp = /^[A-Za-z]+$/;
    if (country == "") {
        setError("country", "Country is required.")
        clearDone("country")
        countryvalidate = false;
    }
    else if (!countryp.test(country)) {
        setError("country", "Please Enter Proper Country Name.")
        clearDone("country")
        countryvalidate = false;
    }
    else {
        clearError("country")
        setDone("country")
        countryvalidate = true;
    }

    if (!addressvalidate || !cityvalidate || !statevalidate || !codevalidate || !countryvalidate) {
        return false;
    }
    return true;
}

//Toggle Password Icons

$(".eyeicon:eq(0)").click(function () {
    const pwd = $("#pwd");

    if (pwd.attr("type") === "password") {
        pwd.attr("type", "text");
        $(".eyeicon:eq(0) i").attr("class", "fa-regular fa-eye-slash");
    } else {
        pwd.attr("type", "password");
        $(".eyeicon:eq(0) i").attr("class", "fa-regular fa-eye");
    }
});

$(".eyeicon:eq(1)").click(function () {
    const cpwd = $("#cpwd");

    if (cpwd.attr("type") === "password") {
        cpwd.attr("type", "text");
        $(".eyeicon:eq(1) i").attr("class", "fa-regular fa-eye-slash");
    } else {
        cpwd.attr("type", "password");
        $(".eyeicon:eq(1) i").attr("class", "fa-regular fa-eye");
    }
});


//Registration Form Validaton End