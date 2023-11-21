function setUsername(username) {
    this.username = username;
    console.log("set uname")
}

function createUser(username,email,pwd) {
    setUsername.call(this,username);
    this.email=email;
    this.pwd=pwd;
}

const user = new createUser("Aditya","a@gmail.com","123")
console.log(user)

console.log(user.email)