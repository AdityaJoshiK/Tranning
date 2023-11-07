let form = $(".loginform");
let uname="",loginpwd="";

// Login Form Validation Start
$(document).ready(function () {
    form.on("keyup",function() {
        uname = form[0].uname.value;
        loginpwd = form[0].loginpwd.value;
        login();
    })
})

//Login Validation Function
function login() {
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
    else if (uname.length>10) {
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
    done.css("visibility","visible");
}

function clearDone(element) {
    let done = $(`.regdone__${element}`)
    done.css("visibility","hidden");
}

function clearError(element) {
    let errortag = $(`.regerror__${element}`);
    errortag.html("");
}
// Common Functions End

//Registration Form Validaton Start


//Registration Form Validaton End