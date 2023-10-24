const date = new Date();
console.log(date);
console.log(date.toLocaleString());
console.log(date.toDateString());
console.log(date.toString());

// const newDate = new Date(2023,0,23);
// const newDate = new Date(2023,0,23,5,3);
const newDate =  new Date("01-14-2023");

console.log(newDate.toLocaleDateString());

let daten = new Date();

console.log(date.getDate())
console.log(date.getMonth()+1)
console.log(date.getDay())

newDate.toLocaleString('default',{
    weekday : 'long'
})