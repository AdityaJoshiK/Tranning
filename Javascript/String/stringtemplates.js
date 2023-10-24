/*
We weite inside `` is called string literals
Template Literals use back-ticks (``) rather than the quotes ("") to define a string */

//we can define multiline strings
let text = `Hello`
console.log(text)

text=`Hello
World!`

console.log(text)

//Automatic replacing of variables with real values is called string interpolation.
let header = "Hello";

let tags = ["one","two","three"];

let html = `<h2>${header}</h2><ul>`
for (const i of tags) {
    html+=`<li>${i}</li>`
}
html+=`</ul>`

console.log(html)