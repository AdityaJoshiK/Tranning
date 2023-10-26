class Car{
    constructor(name)
    {
        this.name = name;
    }

    get Carn(){
        return this.name;
    }

    set Car(name)
    {
        this.name = name;
    }

    printName() {
        console.log(this.name);
    }
}

class Model extends Car{
    constructor(name,mname)
    {
        super(name);
        this.mname = mname;
    }

    printmName() {
        this.printName();
        console.log(this.mname);
    }

}

let m = new Model("harrier","tata");
m.printmName();