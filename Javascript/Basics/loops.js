const user = {
    name : "Aditya",
    age : 20,
    branch : "CE"
};

for (const key in user) {
    console.log(key)
}
for (const key of user) {
    console.log(key)
}