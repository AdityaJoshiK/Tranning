const user = function(){
    console.log("hello user")
}

//arrow function is same as above just instead of function keywoard we use arrow

const newuser = () => {
    console.log("hello user");
}

const addTwo = (n1,n2) => {
    return n1+n2;
}

//we can do above same thing in one line using explicit fuction
const add = (n1,n2) => (n1+n2); //it return sum of n1+n2

//you can also return object
const obj = ()=> ({name:"Aditya"});

console.log(obj())