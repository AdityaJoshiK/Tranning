//If Object Containe Symbol.Iterator then we can only iterate throught it and then it call as iterable 

//Array has Symbol.Iterator in protoype so we can iterate it.

let arr = [1,2,3,4,5];

//we can also change it's Symbol.Iterator method
arr[Symbol.iterator] = function(){
let nvalue = 100;
    return{
        next: function(){
            nvalue++;
            return{
                done :nvalue>110?true:false,
                value : nvalue>110?undefined:nvalue
            };
        }
    }
}

const arrIterator = arr[Symbol.iterator]();

console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())
console.log(arrIterator.next())