
const result = document.querySelector('#results');

const form = document.querySelector("form");

form.addEventListener('submit',function (e){
    e.preventDefault();
    const height = parseInt(document.querySelector('#height').value);
    const weight = parseInt(document.querySelector('#weight').value);

    if (height === '' || isNaN(height) || height<0) {
        result.innerHTML = "Please Enter Valid Input"
    }
    else if (weight === '' || isNaN(weight) || weight<0) {
        result.innerHTML = "Please Enter Valid Input"
    }
    else{
        const bmi = (weight / ((height * height) / 10000)).toFixed(2);
    //show the result
    result.innerHTML = `<span>${bmi}</span>`;
    }

})