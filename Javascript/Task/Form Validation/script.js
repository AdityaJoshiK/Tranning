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

function register() {
    const regform = document.querySelector(".regform");

    const fname = document.regform.fname.value;
    const lname = document.regform.lname.value;
    const pwd = document.regform.pwd.value;
    const cpwd = document.regform.cpwd.value;
    const dob = document.regform.dob.value;
    const phone = document.regform.phone.value;
    const email = document.regform.email.value;
    const cemail = document.regform.cemail.value;
    const address = document.regform.address.value;
    const city = document.regform.city.value;
    const state = document.regform.state.value;
    const code = document.regform.code.value;
    const country = document.regform.country.value;
    console.log(fname);
    console.log(lname);
    console.log(pwd);
    console.log(cpwd);
    console.log(dob);
    console.log(phone);
    console.log(email);
    console.log(cemail);
    console.log(address);
    console.log(city);
    console.log(state);
    console.log(code);
    console.log(country);

    return false;
}