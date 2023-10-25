let str = "Aditya Joshi"

console.log(str.search(/Joshi/i));
console.log(str.match(/[abc]/gi));
console.log(str.match(/[a-z]/gi));
console.log(str.match(/\bJ/gi));

let exp = /A*/g
console.log(exp.exec(str));