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