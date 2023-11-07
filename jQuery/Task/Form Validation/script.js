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

    $("[name|='hobby']").each(function(i) {
        const element = $("[name|='hobby']")[i];
        if (element.checked) {
            checked.push(element.value)
        }
    })

    register(e);
})

function register(e) {
    name = validateFirstandLastName(fname, lname, checked);
    passwd = validatePassword(pwd, cpwd, terms);
    dobdate = validateDobAndGender(dob, gender, file);
    emailphone = validateEmailAndPhone(phone, email, cemail)
    addressdata = validateAddress(address, city, state, code, country)
    const fileName = file.split('\\').pop();
    console.log(name)
    console.log(passwd)
    console.log(dobdate)
    console.log(emailphone)
    console.log(addressdata)
    if (name && passwd && dobdate && emailphone && addressdata && (e==undefined || e=="")) {
        const data = `First Name: ${fname}\nLast Name: ${lname}\nPassword: ${pwd}\nConfirm Password: ${cpwd}\nDate of Birth: ${dob}\nGender: ${gender}\nPhone: ${phone}\nEmail: ${email}\nConfirm Email: ${cemail}\nAddress: ${address}\nCity: ${city}\nState: ${state}\nPostal Code: ${code}\nCountry: ${country}\nFile: ${file}\nFilename: ${fileName}\nHobbies: ${checked}`;

        alert("Data Submitted, Your Data is:\n" + data);
        return true;
    }
    return false;
}

function validateFirstandLastName(fname, lname, checked) {
    let pattern = /^[A-Za-z]+$/;
    if (fname == "") {
        setError("fname", "First Name is required.")
        clearDone("fname");
    }
    else if (!pattern.test(fname)) {
        setError("fname", "First Name Can't be Number or Special Chaarcter.")
        clearDone("fname");
    }
    else if (fname.length < 5) {
        setError("fname", "First Name Length Should be minimum 5.")
        clearDone("fname");
    }
    else if (fname.length>10) {
        setError("fname", "First Name Length Should be maximum 10.")
        clearDone("fname");
    }
    else {
        clearError("fname");
        setDone("fname");

    }
    if (lname == "") {
        setError("lname", "Last Name is required.")
        clearDone("lname");

    }
    else if (!pattern.test(lname)) {
        setError("lname", "Last Name Can't be Number or Special Chaarcter.")

        clearDone("lname");
    }
    else if (lname.length < 5) {
        setError("fname", "First Name Length Should be minimum 5.")
        clearDone("fname");
    }
    else if (lname.length>10) {
        setError("lname", "Last Name Length Should be maximum 10.")
        clearDone("lname");
    }
    else {
        clearError("lname");
        setDone("lname");
    }
    if (checked.length == "") {
        setError("chkerror", "Please Select at least one Hobby.")
        clearDone("chkerror");
    }
    else {
        clearError("chkerror")
        setDone("chkerror");
    }
    return true;
}

function validatePassword(pwd, cpwd, terms) {
    let regexp = /[A-Z]+[a-z]+[!@#$%^&*]\d/
    let isTrue = false;
    if (pwd == "") {
        setError("pwd", "Password Can't Be Empty")
        clearDone("pwd");
    }
    else if (!regexp.test(pwd) || pwd.length <= 8) {
        setError("pwd", "Password Should Contains Captial,Small,Number and Special Character and length 8")
        clearDone("pwd");
    }
    else {
        clearError("pwd")
        isTrue=true;
        setDone("pwd");

    }
    if (pwd=="" || !isTrue) {
        setError("cpwd", "Please First Enter Password Properly.")
        clearDone("cpwd");
    }
    else if (cpwd == "") {
        setError("cpwd", "Confirm Password is required.")
        clearDone("cpwd");
    }
    else if (pwd != cpwd) {
        setError("cpwd", "Both Password is Not Same.")
        clearDone("cpwd");
    }
    else {
        clearError("cpwd")
        setDone("cpwd");
    }
    if (terms) {
        clearError("terms");

    }
    else {
        setError("terms", "You Must Accept Terms And Conditions.");
        return false;
    }
    return true;
}

function validateDobAndGender(dob, gender, file) {

    const enteredDate = new Date(dob);
    const currentDate = new Date();

    if (dob == "") {
        setError("dob", "Date of Birth is required.")
        clearDone("dob")
    }
    else if (enteredDate > currentDate) {
        setError("dob", "Please Enter Valid Date.")
        clearDone("dob")
    }
    else {
        clearError("dob")
        setDone("dob")

    }
    if (file == "") {
        setError("file", "File is required.")
        clearDone("file")
    }
    else {
        clearError("file")
        setDone("file")

    }
    if (gender == "") {
        setError("gender", "Gender is required.")
        clearDone("gender");
        return false
    }
    else {
        clearError("gender")
        setDone("gender");
    }
    return true;
}

function validateEmailAndPhone(phone, email, cemail) {
    if (phone == "") {
        setError("phone", "Phone is required.")
        clearDone("phone")
    }
    else if (phone.length < 10) {
        setError("phone", "Phone Number Length Should be 10")
        clearDone("phone");
    }
    else {
        clearError("phone")
        setDone("phone")
    }
    let regexp = /^([a-z0-9\.-]+)@([a-z0.9-]+).([a-z]{2,8})(.[a-z]{2,8})$/
    if (email == "") {
        setError("email", "Email is required.")
    }
    else if (!regexp.test(email)) {
        setError("email", "Email is Not in Proper Format.")
        clearDone("email")
    }
    else {
        clearError("email")
        setDone("email")
    }
    if (cemail == "") {
        setError("cemail", "Confirm Email is required.")
        clearDone("cemail")
    }
    else if (email != cemail) {
        setError("cemail", "Both Email Should Be Same")
        clearDone("cemail")
    }
    else {
        clearError("cemail")
        setDone("cemail")
    }
    return true;
}

function validateAddress(address, city, state, code, country) {

    if (address == "") {
        setError("address", "Address is required.")
        clearDone("address")
    }
    else {
        clearError("address")
        setDone("address")

    }
    console.log(city)
    if (city == "Select City" || city=="") {
        setError("city", "City is required.")
        clearDone("city")
    }
    else {
        clearError("city")
        setDone("city")

    }
    if (state == "Select State" || state=="") {
        setError("state", "State is required.")
        clearDone("state")
    }
    else {
        clearError("state")
        setDone("state")
    }
    let pattern = /^\d{6}$/;
    if (code == "") {
        setError("code", "Postal Code is required.")
        clearDone("code");
    }
    else if (!pattern.test(code)) {
        setError("code", "Postal Code is Not in Proper format.")
        clearDone("code");
    }
    else {
        clearError("code");
        setDone("code");
    }
    let countryp = /^[A-Za-z]+$/;
    if (country == "") {
        setError("country", "Country is required.")
        clearDone("country")
    }
    else if (!countryp.test(country)) {
        setError("country", "Please Enter Proper Country Name.")
        clearDone("country")
    }
    else {
        clearError("country")
        setDone("country")
    }
    return true;
}

//Registration Form Validaton End