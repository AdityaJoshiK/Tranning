//for of loop use in array
const arr = [1,2,3,4,5];

for (const i of arr) {
    console.log(i);
}

//it can also use in string
const str = "hello world"
for (const char of str) {   
    console.log(char)
}

//map
const map = new Map();
map.set('IN', "India")

map.set('USA', "United States of America")
map.set('Fr', "France")
map.set('IN', "India") //map not insert duplicate value

for (const [key,value] of map) {
    console.log(key,':',value)
}

const user = {
    name : "Aditya",
    age : 20,
    branch : "CE"
};

//we can't  use for of loop in object like map (it shows error)
// for (const [key,value] of user) {
//     console.log(key+":"+value)
// }

for (const key in user) {
    console.log(key+":"+user[key])
}

//you can also use for in loop in array
for (const key in arr) {
    console.log(key+":"+arr[key])
}