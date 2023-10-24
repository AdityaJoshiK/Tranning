let x= "Aditya Joshi";

console.log(x.indexOf("Joshi"))
console.log(x.indexOf("Joshi",5)) //search starts from 5    

console.log(x.lastIndexOf("Aditya"))

console.log(x.search("tya"))

/*The two methods, indexOf() and search(), are equal?

They accept the same arguments (parameters), and return the same value?

The two methods are NOT equal. These are the differences:

The search() method cannot take a second start position argument.
The indexOf() method cannot take powerful search values (regular expressions). */

console.log(x.match("di")) //returns array of result

//global search
let text = "The rain in SPAIN stays mainly in the plain";
console.log(text.match(/ain/g));

console.log(text.matchAll("ain")) //retruns iteator

console.log(x.includes("dit")) //returns true or false

console.log(x.startsWith('D')) 
console.log(x.startsWith('d',1)) 
console.log(x.endsWith('i')) 

