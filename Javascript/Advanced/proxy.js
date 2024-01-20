const user = {
    firstname:"Aditya",
    lastname:"Joshi",
    greet: function(name) {
        return `Hello, ${name}!`;
      }
};

const proxyUser = new Proxy(user,{
    get: function(target,property){
        return target[property];
    },

    set: function(target,property,value){
        target[property]=value;
    },

    apply: function(target, thisArg, argumentsList) {
        console.log(`Calling function: ${target.name || 'anonymous'}`);
        // You can modify or log the function call here
        return target.apply(thisArg, argumentsList);
      }
});

proxyUser.firstname = "Abc";
console.log(proxyUser.firstname)
console.log(proxyUser.lastname)
console.log(proxyUser.greet('Aditya'));