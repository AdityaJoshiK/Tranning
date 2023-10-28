const arr = Array.from({ length: 10000 }, (_, i) => i + 1); // Array with 10,000 elements
const bigArr = Array.from({ length: 100000 }, (_, i) => i + 1); // Array with 100,000 elements

// Function to calculate sum using a for loop
function sumFor(arr) {
    let sum = 0;
    const start = performance.now(); // Start time

    for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
    }

    const end = performance.now(); // End time
    console.log(`Sum using for loop: ${sum}`);
    console.log(`Execution time (for loop): ${end - start} milliseconds`);
}

// Function to calculate sum using a for..of loop
function sumForOf(arr) {
    let sum = 0;
    const start = performance.now(); // Start time

    for (const num of arr) {
        sum += num;
    }

    const end = performance.now(); // End time
    console.log(`Sum using for..of loop: ${sum}`);
    console.log(`Execution time (for..of loop): ${end - start} milliseconds`);
}

// Function to calculate sum using a for..in loop
function sumForIn(arr) {
    let sum = 0;
    const start = performance.now(); // Start time

    for (const index in arr) {
        sum += arr[index];
    }

    const end = performance.now(); // End time
    console.log(`Sum using for..in loop: ${sum}`);
    console.log(`Execution time (for..in loop): ${end - start} milliseconds`);
}

// Function to calculate sum using forEach
function sumForEach(arr) {
    let sum = 0;
    const start = performance.now(); // Start time

    arr.forEach(num => {
        sum += num;
    });

    const end = performance.now(); // End time
    console.log(`Sum using forEach: ${sum}`);
    console.log(`Execution time (forEach): ${end - start} milliseconds`);
}

// Function to calculate sum using a while loop
function sumWhile(arr) {
    let sum = 0;
    const start = performance.now(); // Start time

    let i = 0;
    while (i < arr.length) {
        sum += arr[i];
        i++;
    }

    const end = performance.now(); // End time
    console.log(`Sum using while loop: ${sum}`);
    console.log(`Execution time (while loop): ${end - start} milliseconds`);
}

// Function to calculate sum using a do-while loop
function sumDoWhile(arr) {
    let sum = 0;
    const start = performance.now(); // Start time

    let i = 0;
    do {
        sum += arr[i];
        i++;
    } while (i < arr.length);

    const end = performance.now(); // End time
    console.log(`Sum using do-while loop: ${sum}`);
    console.log(`Execution time (do-while loop): ${end - start} milliseconds`);
}

// Call the functions with arr (10,000 iterations)
console.log("----- 10,000 iterations -----");
sumFor(arr);
sumForOf(arr);
sumForIn(arr);
sumForEach(arr);
sumWhile(arr);
sumDoWhile(arr);

// Call the functions with bigArr (100,000 iterations)
console.log("\n----- 100,000 iterations -----");
sumFor(bigArr);
sumForOf(bigArr);
sumForIn(bigArr);
sumForEach(bigArr);
sumWhile(bigArr);
sumDoWhile(bigArr);

// Function using Promises
function promiseExample() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve("Promise resolved");
        }, 1000);
    });
}

// Function using async/await
async function asyncExample() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve("Async/Await resolved");
        }, 1000);
    });
}

// Measure execution time using Promises
const promiseStart = performance.now();
promiseExample()
    .then(result => {
        const promiseEnd = performance.now();
        console.log(`${result}, Execution time using Promise: ${promiseEnd - promiseStart} milliseconds`);
    });

// Measure execution time using async/await
async function measureAsyncExecutionTime() {
    const asyncStart = performance.now();
    const result = await asyncExample();
    const asyncEnd = performance.now();
    console.log(`${result}, Execution time using Async/Await: ${asyncEnd - asyncStart} milliseconds`);
}

measureAsyncExecutionTime();
