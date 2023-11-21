let x="Aditya Joshi      ";

console.log(x.slice(1,5));

console.log(x.substring(0,6));

console.log(x.substr(0,6))

console.log(x.replace("Aditya","Jay"))

console.log(x.trim())

console.log(x.padStart(50,"A"))
console.log(x.padEnd(80,"J"))


console.log(x.length)
console.log(x)

x = "a,b,c,d,e"
console.log(x.split(','))
console.log(x)

let string1 = 'apple';
let string2 = 'banana';

let result = string1.localeCompare(string2);

if (result < 0) {
  console.log(`${string1} comes before ${string2}`);
} else if (result > 0) {
  console.log(`${string1} comes after ${string2}`);
} else {
  console.log(`${string1} is equal to ${string2}`);
}
