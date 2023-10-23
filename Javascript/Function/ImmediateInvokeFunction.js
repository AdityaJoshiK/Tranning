//this type function executes automatically when program run

(function name(params) {
    console.log("DB Connected")
})();  //semi column complusory otherwise second function can't be executed

(() => {
    console.log("first")
})();

((name) => {
    console.log(`Hello ${name}`)
})("Aditya")