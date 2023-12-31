let commonerror = "This Field Is Required"

function login() {
    const loginform = document.querySelector(".loginform");

    const uname = document.loginform.uname.value;
    const pwd = document.loginform.pwd.value;

    console.log(uname, pwd)

    let pattern = /^[A-Za-z]+$/;

    const uerror = document.querySelector(".error__uname")
    const pwderror = document.querySelector(".error__pwd")

    if (uname == "") {
        uerror.innerHTML = "Username Field Is Required"
        return false;
    }
    else if (!pattern.test(uname)) {
        uerror.innerHTML = "User Name Can't be Number or Special Chaarcter."
        return false;
    }
    else {
        uerror.innerHTML = "";
    }
    if (pwd == "") {
        pwderror.innerHTML = "Password Field Is Required"
        return false;
    }
    else {
        pwderror.innerHTML = ""
    }
    const data = `\nUsername:${uname}\nPassword:${pwd}`;
    alert("Your Entered Data is:" + data)
    return true;
}

function setError(element, error) {
    let errortag = document.querySelector(`.regerror__${element}`)
    errortag.innerHTML = error
}

function setDone(element) {
    let done = document.querySelector(`.regdone__${element}`)
    done.style.visibility = "visible"
}

function clearDone(element) {
    let done = document.querySelector(`.regdone__${element}`)
    done.style.visibility = "hidden"
}

function clearError(element) {
    let errortag = document.querySelector(`.regerror__${element}`)
    errortag.innerHTML = "";
}

function clearErrors() {
    let errors = document.querySelectorAll(".regerror");
    errors.forEach((error) => {
        error.innerHTML = "";
    })
}

function setAllErrors() {
    let errors = document.querySelectorAll(".regerror");
    errors.forEach((error) => {
        error.innerHTML = "This Field Is Required";
    })
}
const regform = document.querySelector(".regform");

regform.addEventListener('input', (e) => {
    const fname = document.regform.fname.value;
    const lname = document.regform.lname.value;
    const pwd = document.regform.pwd.value;
    const cpwd = document.regform.cpwd.value;
    const dob = document.regform.dob.value;
    const gender = document.regform.gender.value;
    const phone = document.regform.phone.value;
    const email = document.regform.email.value;
    const cemail = document.regform.cemail.value;
    const address = document.regform.address.value;
    const city = document.regform.city.value;
    const state = document.regform.state.value;
    const code = document.regform.code.value;
    const country = document.regform.country.value;
    const chks = document.regform.hobby;
    const file = document.regform.file.value;
    const terms = document.regform.terms.checked;
    let checked = [];

    for (let index = 0; index < chks.length; index++) {

        const element = chks[index];
        if (element.checked) {
            checked.push(element.value)
        }
    }

    validateFirstandLastName(fname, lname, checked);
    validatePassword(pwd, cpwd, terms);
    validateDobAndGender(dob, gender, file);
    validateEmailAndPhone(phone, email, cemail)
    validateAddress(address, city, state, code, country)
})

const pwdicon = document.querySelectorAll(".eyeicon")[0];
const cpwdicon = document.querySelectorAll(".eyeicon")[1];
pwdicon.addEventListener('click',()=>{
    const pwd=document.getElementById("pwd");

    if (pwd.type=="password") {
        pwd.type = "text"
        pwdicon.children[0].className='fa-regular fa-eye-slash'
    }
    else{
        pwd.type="password"
        pwdicon.children[0].className='fa-regular fa-eye'
        // console.log()
    }
})
cpwdicon.addEventListener('click',()=>{
    const pwd=document.getElementById("cpwd");

    if (cpwd.type=="password") {
        cpwd.type = "text"
        cpwdicon.children[0].className="fa-regular fa-eye-slash"
    }
    else{
        cpwd.type="password"
        cpwdicon.children[0].className='fa-regular fa-eye'
    }
})

function register() {

    const fname = document.regform.fname.value;
    const lname = document.regform.lname.value;
    const pwd = document.regform.pwd.value;
    const cpwd = document.regform.cpwd.value;
    const dob = document.regform.dob.value;
    const gender = document.regform.gender.value;
    const phone = document.regform.phone.value;
    const email = document.regform.email.value;
    const cemail = document.regform.cemail.value;
    const address = document.regform.address.value;
    const city = document.regform.city.value;
    const state = document.regform.state.value;
    const code = document.regform.code.value;
    const country = document.regform.country.value;
    const chks = document.regform.hobby;
    const file = document.regform.file.value;
    const terms = document.regform.terms.checked;
    const fileName = file.split('\\').pop();

    let checked = [];

    for (let index = 0; index < chks.length; index++) {

        const element = chks[index];
        if (element.checked) {
            checked.push(element.value)
            console.log(element.value)
        }
    }
    name = validateFirstandLastName(fname, lname, checked);
    passwd = validatePassword(pwd, cpwd, terms);
    dobdate = validateDobAndGender(dob, gender, file);
    emailphone = validateEmailAndPhone(phone, email, cemail)
    addressdata = validateAddress(address, city, state, code, country)
    console.log(name)
    console.log(passwd)
    console.log(dobdate)
    console.log(emailphone)
    console.log(addressdata)

    if (name && passwd && dobdate && emailphone && addressdata) {
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
    if (city == "Select City") {
        setError("city", "City is required.")
        clearDone("city")
    }
    else {
        clearError("city")
        setDone("city")

    }
    if (state == "Select State") {
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
    debugger
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