const students = {
    "a":90,
    "b":88,
    "c":70,
    "d":65,
    "e":50
};

for (let index = 0; index < Object.keys(students).length; index++) {
    console.log(`Marks of ${Object.keys(students)[index]} are ${students[Object.keys(students)[index]]}`)
}

//using forin
for (const i in students) {
    console.log(`The Marks Of Student ${i} is ${students[i]}`)
}