const data = {
    "countries": [
        {
            "name": "United States",
            "states": [
                {
                    "name": "New York",
                    "cities": ["New York City", "Buffalo", "Albany"]
                },
                {
                    "name": "California",
                    "cities": ["Los Angeles", "San Francisco", "San Diego"]
                }
            ]
        },
        {
            "name": "India",
            "states": [
                {
                    "name": "Maharashtra",
                    "cities": ["Mumbai", "Pune", "Nagpur"]
                },
                {
                    "name": "Tamil Nadu",
                    "cities": ["Chennai", "Coimbatore", "Madurai"]
                }
            ]
        },
        {
            "name": "United Kingdom",
            "states": [
                {
                    "name": "England",
                    "cities": ["London", "Birmingham", "Manchester"]
                },
                {
                    "name": "Scotland",
                    "cities": ["Glasgow", "Edinburgh", "Aberdeen"]
                }
            ]
        },
        {
            "name": "China",
            "states": [
                {
                    "name": "Beijing",
                    "cities": ["Beijing City", "Tongzhou", "Chaoyang"]
                },
                {
                    "name": "Shanghai",
                    "cities": ["Shanghai City", "Pudong", "Minhang"]
                }
            ]
        },
        {
            "name": "Brazil",
            "states": [
                {
                    "name": "São Paulo",
                    "cities": ["São Paulo", "Campinas", "Santo André"]
                },
                {
                    "name": "Rio de Janeiro",
                    "cities": ["Rio de Janeiro", "Niterói", "Nova Iguaçu"]
                }
            ]
        }
    ]
}

//now i want to above same using checkox instead of dropdown but in this code label is not coming

const countryCheckbox = document.getElementById("country");
const stateCheckbox = document.getElementById("state");
const cityCheckbox = document.getElementById("city");
console.log(countryCheckbox)

data.countries.forEach(element => {
    const div = document.createElement("div")
    const input = document.createElement("input");
    const label = document.createElement("label");

    div.className="chk"
    input.type = "checkbox";
    input.value = element.name;
    label.textContent = element.name;

    countryCheckbox.appendChild(div);
    div.appendChild(input);
    div.appendChild(label);
});

countryCheckbox.addEventListener('change', (e) => {
    console.log(e)
    if (!e.target.checked) {
        
        stateCheckbox.innerHTML=""
    }
    if (e.target.checked) {

        const selectedCountry = e.target.value;
        console.log(e.target.value)
        data.countries.forEach((country) => {

            if (country.name == selectedCountry) {
                country.states.forEach((state) => {
                    console.log(state)
                    const div = document.createElement("div")
                    const input = document.createElement("input");
                    const label = document.createElement("label");

                    div.className="chk";
                    input.type = "checkbox";
                    input.value = state.name;
                    label.textContent = state.name;

                    stateCheckbox.appendChild(div);
                    div.appendChild(input);
                    div.appendChild(label);
                })
            }
        })
    }
})

stateCheckbox.addEventListener('change',(e)=>{
    const selectedState = e.target.value;

    if (e.target.checked) {
        
    
    data.countries.forEach((country)=>{
        country.states.forEach((state)=>{
            if(state.name==selectedState){
                state.cities.forEach((city)=>{
                    const div = document.createElement("div")
                    const input = document.createElement("input");
                    const label = document.createElement("label");

                    div.className="chk";
                    input.type = "checkbox";
                    input.value = city;
                    label.textContent = city;

                    cityCheckbox.appendChild(div);
                    div.appendChild(input);
                    div.appendChild(label);
                })
            }
        })
    })
}
})