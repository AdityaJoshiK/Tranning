//foreach
let numbers = [45, 4, 9, 16, 25];

numbers.forEach((value,index,array)=>{
    console.log(value,index,array)
})

//map - with map we can return our output in new array
let newArr = numbers.map((value)=>{
    return value * 2;
})
console.log(newArr)

//flatmap
numbers=[10,[1,2],20]
newArr=numbers.flatMap((value)=>{
    return value;
})
console.log(newArr)

//filter
numbers = [45, 4, 9, 16, 25];
newArr = numbers.filter((value)=>{
    return value>18
})
console.log(newArr)


//reduce
newArr = numbers.reduce((total, value, index, arra)=>{
    return total+value
})
console.log(newArr)


//every
let rep =numbers.every((value)=>{  //checks all element pass the condition or not
    return value>15
})
console.log(rep)

//some
rep =numbers.some((value)=>{  //checks any one element pass the condition or not
    return value>15
})
console.log(rep)

//indexof
const fruits = ["Apple", "Orange", "Apple", "Mango"];
let position = fruits.indexOf("Apple",2) + 1; //(item,start)
console.log(position)

//find -  returns the value of the first array element that passes a test function.
rep =numbers.find((value)=>{  //checks any one element pass the condition or not
    return value>15
})
console.log(rep)

//create arrray from string
let arr1 = "Aditya";
let arr2= Array.from(arr1);
console.log(arr2);

//keys
arr = numbers.keys();
for (let x of arr) {
    console.log(x)
  }

//entries - returns an Array Iterator object with key/value pairs
arr = numbers.entries();
for (let x of arr) {
    debugger;
    console.log(x)
  }

//includes - return true or false
rep =fruits.includes("Mango")
console.log(rep)