const myarr = [0,1,2,3,4,5,6];
const strs = ["Aditya","Joshi"];

const arr = new Array(1,2,3,4)
console.log(arr[0])

arr.push(5);
arr.sort()
arr.push(6);

arr.pop();

console.log(arr)

arr.unshift(0); //add at front
console.log(arr)

arr.shift(); //remove from first
console.log(arr)

console.log(arr.includes(2)) //returns true or false
console.log(arr.indexOf(4))

const newArr = arr.join()
console.log(newArr) // join method convert array to string

//slice vs splice
/*Slice method not change in original array
  splice method change in original array
*/

console.log("Before slice",arr)
const a1 = arr.slice(1,3);
console.log("After slice",arr)

console.log("Before splice",arr)
const a2 = arr.splice(1,3);
console.log("After splice",arr)

//delete
delete arr[0];
console.log(arr)

//merge two arays
const arr1 = [1,2,3];
const arr2 = [4,5,6];

// const arr3 = arr1.concat(arr2); //conact
const arr3 = [...arr1,...arr2]; //second way    
console.log(arr3)

//Array Sorting

const nam = ["Joshi","Aditya"];
console.log(nam.sort())

const points = [40, 100, 1, 5, 25, 10]; //sort numeic array
points.sort(function(a, b){return a - b});

console.log(points);