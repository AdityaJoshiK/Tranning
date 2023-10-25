const coding = ["js", "ruby", "java", "python", "cpp"]

// coding.forEach(function(value){
//     console.log(value);
// })

//also use arrow function
coding.forEach((value)=>{
    console.log(value)
})

coding.forEach(print)

function print(value) {
    console.log(value)
}

//3 paramers can be use
coding.forEach((value,index,arr)=>{
    console.log(value,index,arr)
})