// function person() {
//     this.name="A";
//     this.age=18;
// }

const person = {
    firstName: "John",
    lastName : "Doe",
    language : "EN"
  };
  
  Object.defineProperty(person, "language", {enumerable:false});
  Object.getOwnPropertyNames(person);  // Returns an array of properties

// let a = Object.create(person);
// console.log(a)

a = Object.getOwnPropertyNames(person)
console.log(a)
a= Object.getPrototypeOf(person)
console.log(a)
a=Object.keys(person)
console.log(a)
a=Object.getOwnPropertyNames(person);
console.log(a)