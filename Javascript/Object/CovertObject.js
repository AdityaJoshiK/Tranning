const person = {
    name: "John",
    age: 30,
    city: "New York"
  };
  
//to array
const arrPerson = Object.entries(person);//it stores both key and value in array
console.log(arrPerson) 

let arr = Object.values(person);//it only take values in array
console.log(arr)


//convert obj to string

let strObj = JSON.stringify(person); //converts object into a json string
console.log(strObj)

//convert string to array
let myString = JSON.stringify(arr);
console.log(myString)