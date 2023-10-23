function greeting(msg = "GM") { //GM is default if user can't pass anything
    console.log(msg);
}

greeting();

//if function has multiple params and you don't know
function name(...params) {
    console.log(params);
}

name(1,2,3)

function a(a,b,...params) { //in below 1,2 store in a,b and rest of(3,4,5) store in parmas
    console.log(a,b,params);
}

a(1,2,3,4,5)

//you can also pass object and array in paramters
function obj(object) {
    console.log(`Your name is ${object.name}`);
}

const abc = {
    name: 'John',
};

obj(abc);

//using array
const myNewArray = [200, 400, 100, 600]

function returnSecondValue(getArray){
    return getArray[1]
}

console.log(returnSecondValue([200, 400, 500, 1000]));

call();//you can do this (fuctional call before define)
function call() {
    return
}

// called();//you can't call in this function defination it shows error
const called = function(){
    return
}