let obj = {
    name:"a"
};

// let user = obj;//it will store refrence of obje to prevent this we use shallow copy
let user = Object.assign({},obj) //way 1
user = {...obj} //way 2 for shallow copy
user.name="b";

console.log(user);
console.log(obj);


obj = {
    name:"a",
    address: {
        state: "GJ",
        city:"Raj"
    }
}

user = Object.assign({},obj);
user.address.state="RJ";
console.log(obj) //shallow copy not work in subobjects

obj = {
    name:"a",
    address: {
        state: "GJ",
        city:"Raj"
    }
}

//deep copy
user = JSON.parse(JSON.stringify(obj));
user.address.state="RJ";
console.log(obj) 

//disadvantage - deep copy not work when original object contains function

obj = {
    name:"a",
    address: {
        state: "GJ",
        city:"Raj"
    },
    getData: function(){
        return "data"
    }
}

user = JSON.parse(JSON.stringify(obj));
user.address.state="RJ";
console.log(obj)  

//we can solve it using loadsh libray
