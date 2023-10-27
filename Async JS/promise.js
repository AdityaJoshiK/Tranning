const ticket = new Promise(function (resolve,reject)
{
    const isBoarded = false;
    if (isBoarded) {
        resolve("Your are not in the flight");
    }
    else{
        reject("Your flight has been cancelled")
    }
})

ticket
    .then((data)=>{
        console.log("yay",data);
    })
    .catch((data)=>{
        console.log("oh no",data)
    })