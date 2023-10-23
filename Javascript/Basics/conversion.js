//number conversion

let score = 33;
console.log(typeof(score));

let n = "3a";
let valueInNumber = Number(n);
console.log(typeof valueInNumber)
console.log(valueInNumber) //NaN

/* "33" -> 33 
   "3a" -> NaN
   true->1,false->0
*/

// Boolean Converison
let a = 1;
a= ""
let valueInBoolean = Boolean(a);

console.log(valueInBoolean)

// 1 => true; 0 => false
// "" => false
// "aditya" => true

// String Conversion

let s = 21;
let valueInString = String(s);
console.log(valueInString);
console.log(typeof valueInString);