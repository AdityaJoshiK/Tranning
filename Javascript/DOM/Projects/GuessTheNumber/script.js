const form = document.querySelector('form');
let guesses = 10;

let min=1,max=100;

let guess = Math.floor(Math.random()*(max-min))+1;
// document.write(guess);

form.addEventListener('submit',function(e){
    e.preventDefault();
    const inp = parseInt(document.querySelector("#guessField").value);

    if(inp === guess){
        alert("Congratulations! You've got it right!");
        location.reload();
    }
    else if (inp<guess) {
        document.querySelector(".lowOrHi").innerHTML = "Number is to low"
    }
    else{
        document.querySelector(".lowOrHi").innerHTML = "Number is to high"
    }

    const prevNode = document.createTextNode(inp+" ");
    let prevGuesses = document.querySelector(".guesses");
    prevGuesses.appendChild(prevNode);

    guesses--;
    document.querySelector(".lastResult").innerHTML=guesses;
    if (guesses==0) {
        alert(`Try Next Time! Number is ${guess}`);
        
        location.reload();
    }
})