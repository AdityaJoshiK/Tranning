const myObj = {
    name: "John",
    age: 30,
    cars: [
      {name:"Ford", models:["Fiesta", "Focus", "Mustang"]},
      {name:"BMW", models:["320", "X3", "X5"]},
      {name:"Fiat", models:["500", "Panda"]}
    ]
  }

  for (const key in myObj.cars) {
    // console.log(key,myObj.cars[key])
    for (const model in myObj.cars[key].models) {
       console.log(myObj.cars[key].models[model])
    }
   
  }