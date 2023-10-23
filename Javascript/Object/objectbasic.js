const symbol = Symbol("key");

const user = {
    name: "aditya",
    "full name" : "Aditya Joshi",
    [symbol] : "key1",
    email: "a@gmail.com",
    isLogedIn: true,
    lastLoginDays : ["Monday", "Friday"]
};

console.log(user.name);
console.log(user.email);
console.log(user.isLogedIn);
console.log(user.lastLoginDays[1]);
console.log(user["full name"]);
console.log(user[symbol]);

user.email="nw@mail.com";
console.log(user);

user.age = 18; //you can add new property also
console.log(user.age);

user.greeting = function greet() {
    console.log("GM");
    return "GM"
}

user.greeting = function greet(){
    console.log(`Hello ${user["full name"]}`);
}
console.log(user.greeting());

Object.freeze(user);

user.email="a@mail.com"; //after freezeing object value can't be change
// console.log(user);
