function Person(name,age) {
    this.name = name;
    this.age = age;
    this.getPerson = ()=>{
        return this.name+this.age;
    }
}

const p1 = new Person("Aditya",20);
console.log(p1)

//all objects inherit prototype , if we declare anything in prototype then it is global for an all objects (it is work on only objects which is created using new Keyword)
Person.prototype.age = 20;