//object will be created using function
function Person(name,age) {
    this.name = name;
    this.age = age;
    this.getPerson = ()=>{
        return this.name+this.age;
    }
}

const p1 = new Person("Aditya",20);
console.log(p1)
console.log(p1.name)
console.log(p1.age)
console.log(p1.getPerson())

const p2 = new Person("AG",20);
console.log(p2)
//it is not efficient it is create new function for new object