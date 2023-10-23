const user={};

user.id = 123;
user.email = "abc@gmail.com"
user.isLogedIn = false;

console.log(user);

//nested object
const person={
    email : "new@gmail.com",
    fullname : {
        personfullname: {
            firstname : "Aditya",
            lastname : "Joshi"
        },
    }
}

console.log(person);
console.log(person.fullname.personfullname.firstname);

//Merge Objects
const obj1 = {1:'a',2:'b'};
const obj2 = {3:'a',4:'b'};
const obj3 = {5:'a',6:'b'}; 

let obj4 = {obj1 , obj2}; // but it stores both as diffrent object not merge it values

obj4 = Object.assign({},obj1,obj2,obj3);

//using destructuring
obj4 = {...obj1 , ...obj2 , ...obj3 }
console.log(obj4);

//get seprate keys and value in array from object
console.log(Object.keys(user));
console.log(Object.values(user));
console.log(Object.entries(user));//get arrat of all separate key,value pair

//destructuring 

user.email;//here we need to write many times user. for all but with destructuring we can sort it

const { email } = user;
const { email : e} = user; //change name email as e

console.log(email);
console.log(e);