class Car{
    constructor(name)
    {
        this.name = name;
    }

    static hello(name)
    {
        console.log(name)
    }
}

let c = new Car("A");
// c.hello(); error

Car.hello("A");