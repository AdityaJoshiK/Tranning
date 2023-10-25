//set not allowed duplicate
let set = new Set([1,2,3,4]);

/*
new Set()	Creates a new Set
add()	Adds a new element to the Set
delete()	Removes an element from a Set
has()	Returns true if a value exists in the Set
forEach()	Invokes a callback for each element in the Set
values()	Returns an iterator with all the values in a Set
*/

set.add(5);

let a=6;
set.add(a);
// set.forEach((value)=>{
//     console.log(value)
// })
console.log("-----------------------------------")
set.delete(1)
for (let x of set.values()) {
    console.log(x)
  }
