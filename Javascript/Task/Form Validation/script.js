
function login() {
    const loginform = document.querySelector(".loginform");
    console.log(loginform)

    const uname = document.loginform.uname.value;
    const pwd = document.loginform.pwd.value;

    console.log(uname,pwd)

    const uerror = document.querySelector(".error__uname")
    const pwderror = document.querySelector(".error__pwd")


    if (uname=="") {
        uerror.innerHTML="This Field Is Required"
        return false;
    }
    else{
        uerror.innerHTML="";
    }
    if (pwd=="") {
        pwderror.innerHTML="This Field Is Required"
        return false;
    }
    else{
        pwderror.innerHTML=""
    }
    return true;
}