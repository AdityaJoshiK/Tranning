class Car{
    constructor(name)
    {
        this.name = name;
    }

    printName() {
        console.log(this.name);
    }
}

let c = new Car("Harrier");
c.printName();