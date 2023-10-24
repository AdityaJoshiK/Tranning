let num = 123.458

console.log(num.toFixed(2)) //it works after point means after point there is 2 digit
console.log(num.toPrecision(2)) //it works in whole number 

let money=10000;
console.log(money.toLocaleString('en-IN'));

// +++++++++++++ Maths +++++++++++++++++++++++++++++

// console.log(Math);
// console.log(Math.abs(-4));
// console.log(Math.round(4.6));
// console.log(Math.ceil(4.2));
// console.log(Math.floor(4.9));
// console.log(Math.min(4, 3, 6, 8));
// console.log(Math.max(4, 3, 6, 8));

console.log(Math.random()) //generate random number b/w 0 to 1
console.log(Math.random()*10+1)
console.log(Math.floor(Math.random()*10+1))

const min = 10;
const max = 20; 

console.log(Math.floor(Math.random() * (max - min + 1)) + min) //generate b/w min.max range