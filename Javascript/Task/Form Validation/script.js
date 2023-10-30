let commonerror = "This Field Is Required"

function login() {
    const loginform = document.querySelector(".loginform");
    console.log(loginform)

    const uname = document.loginform.uname.value;
    const pwd = document.loginform.pwd.value;

    console.log(uname,pwd)

    const uerror = document.querySelector(".error__uname")
    const pwderror = document.querySelector(".error__pwd")

    if (uname=="") {
        uerror.innerHTML="Username Field Is Required"
        return false;
    }
    else{
        uerror.innerHTML="";
    }
    if (pwd=="") {
        pwderror.innerHTML="Password Field Is Required"
        return false;
    }
    else{
        pwderror.innerHTML=""
    }
    return true;
}

function setError(element,error) {
    let errortag = document.querySelector(`.regerror__${element}`)
    errortag.innerHTML= error;

}

function clearError(element) {
    let errortag = document.querySelector(`.regerror__${element}`)
    errortag.innerHTML= "";

    const inputElement = document.getElementById(element);

    // Create the icon element
    // const iconElement = document.createElement("i");
    // iconElement.className = "fa-solid fa-circle-check";
    // iconElement.style.color = "#24ae66";

    // // Append the icon after the input element
    // inputElement.insertAdjacentElement("afterend", iconElement);
}

function clearErrors() {
    let errors = document.querySelectorAll(".regerror");
    errors.forEach((error)=>{
        error.innerHTML="";
    })
}

function setAllErrors() {
    let errors = document.querySelectorAll(".regerror");
    errors.forEach((error)=>{
        error.innerHTML="Please Fill This Field";
    })
}
const regform = document.querySelector(".regform");

regform.addEventListener('input',(e)=>{
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
    let checked=[];

    for (let index = 0; index < chks.length; index++) {
        
        const element = chks[index];
        if (element.checked) {
            checked.push(element.value)
            // console.log(element.value)
        }
    }

    validateFirstandLastName(fname,lname,checked);
    validatePassword(pwd,cpwd);
    validateDobAndGender(dob,gender);
    validateEmailAndPhone(phone,email,cemail)
    validateAddress(address,city,state,code,country)
})



function register() {
   
    // clearErrors()
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
    console.log(fname);
    console.log(lname);
    console.log(pwd);
    console.log(cpwd);
    console.log(dob);
    console.log(gender);
    console.log(phone);
    console.log(email);
    console.log(cemail);
    console.log(address);
    console.log(city);
    console.log(state);
    console.log(code);
    console.log(country);
    let checked=[];

    for (let index = 0; index < chks.length; index++) {
        
        const element = chks[index];
        if (element.checked) {
            checked.push(element.value)
            console.log(element.value)
        }
    }
    name = validateFirstandLastName(fname,lname,checked);
    passwd = validatePassword(pwd,cpwd);
    dobdate = validateDobAndGender(dob,gender);
    emailphone = validateEmailAndPhone(phone,email,cemail)
    addressdata = validateAddress(address,city,state,code,country)

    if (name && passwd && dobdate && emailphone && addressdata) {
        const data = `First Name: ${fname}\nLast Name: ${lname}\nPassword: ${pwd}\nConfirm Password: ${cpwd}\nDate of Birth: ${dob}\nGender: ${gender}\nPhone: ${phone}\nEmail: ${email}\nConfirm Email: ${cemail}\nAddress: ${address}\nCity: ${city}\nState: ${state}\nPostal Code: ${code}\nCountry: ${country}\nHobbies: ${checked}`;

alert("Data Submitted, Your Data is:\n" + data);
        return true;
    }
    return false;

    // ferror.innerHTML=`<i class="fa-solid fa-circle-check" style="color: #24ae66;"></i>`
   
    // console.log(checked)
   

    return false;
}
const ferror = document.querySelector(".regerror__fname");
const lerror = document.querySelector(".regerror__lname");
const pwderror = document.querySelector(".regerror__pwd");
const cpwderror = document.querySelector(".regerror__cpwd");
const doberror = document.querySelector(".regerror__dob");
const gendererror = document.querySelector(".regerror__gender");
const phoneerror = document.querySelector(".regerror__phone");
const emailerror = document.querySelector(".regerror__email");
const cemailerror = document.querySelector(".regerror__cemail");
const chkerror = document.querySelector(".regerror__chkerror");

function validateFirstandLastName(fname,lname,checked) {
    if (fname=="" || fname.length<5) {
        setError("fname","Name Not Empty")
    }
    else{
        clearError("fname");

    }
    if (lname=="" || lname.length<5) {
        setError("lname","Name Not Empty")
        
    }
    else{
        clearError("lname");
    }
    if (checked.length=="") {
        setError("chkerror","Please Select Any One Check Box")
    }
    else{
        clearError("chkerror")
    }
    return true;
}

function validatePassword(pwd,cpwd){
    if (pwd=="") {
        setError("pwd","Password Can't Be Empty")
    }
    else{
        clearError("pwd")

    }
    if (cpwd=="") {
        setError("cpwd","Password Can't Be Empty")
        return false
    }
    else if (pwd!=cpwd) {
        setError("cpwd","Both Password Should Be Same")
    }
    else{
        clearError("cpwd")
    }
    return true;
}

function validateDobAndGender(dob,gender){

    if (dob=="") {
        setError("dob","DOB Can't Be Empty")

    }
    else{
        clearError("dob")

    }
    if (gender=="") {
        setError("gender","Please Select Any One")
        return false
    }
    else{
        clearError("gender")
    }
    return true;
}

function validateEmailAndPhone(phone,email,cemail) {
    if (phone=="") {
        setError("phone","Phone No. Can't Be Empty")
    }
    else if (phone.length<10) {
        setError("phone","Phone Number Length Should be 10")
    }
    else{
        clearError("phone")
    }
    if (email=="") {
        setError("email","Email Can't Be Empty")
    }
    else{
        clearError("email")
    }
    if (cemail=="") {
        setError("cemail","Confirm Email Can't Be Empty")
    }
    else if (email!=cemail) {
        alert(email,cemail)
        setError("cemail","Both Email Should Be Same")
    }
    else{
        clearError("cemail")
    }
    return true;
}

function validateAddress(address,city,state,code,country) {
 
    if (address=="") {
        setError("address","Address NoT Empty")
    }
    else{
        clearError("address")

    }
    if (city=="Select City") {
        setError("city","City NoT Empty")
    }
    else{
        clearError("city")

    }
    if (state=="Select State") {
        setError("state","State NoT Empty")
    }
    else{
        clearError("state")
    }
    if (code=="") {
        setError("code","Code NoT Empty")
    }
    else{
        clearError("code")
    }
    if (country=="") {
        setError("country","country NoT Empty")
    }
    else{
        clearError("country")
    }
    return true;
}