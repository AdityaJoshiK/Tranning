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
                    "cities": ["São Paulon", "Campinas", "Santo André"]
                },
                {
                    "name": "Rio de Janeiro",
                    "cities": ["Rio", "Niterói", "Nova Iguaçu"]
                }
            ]
        },
        {
            "name": "Canada",
            "states": [
                {
                    "name": "Ontario",
                    "cities": ["Toronto", "Ottawa", "Hamilton"]
                },
                {
                    "name": "Quebec",
                    "cities": ["Montreal", "Quebec City", "Laval"]
                }
            ]
        },
        {
            "name": "Australia",
            "states": [
                {
                    "name": "New South Wales",
                    "cities": ["Sydney", "Newcastle", "Wollongong"]
                },
                {
                    "name": "Victoria",
                    "cities": ["Melbourne", "Geelong", "Ballarat"]
                }
            ]
        },
        {
            "name": "Germany",
            "states": [
                {
                    "name": "Bavaria",
                    "cities": ["Munich", "Nuremberg", "Augsburg"]
                },
                {
                    "name": "North Rhine",
                    "cities": ["Cologne", "Düsseldorf", "Dortmund"]
                }
            ]
        },
        {
            "name": "Japan",
            "states": [
                {
                    "name": "Tokyo",
                    "cities": ["Tokyo City", "Yokohama", "Chiba"]
                },
                {
                    "name": "Osaka",
                    "cities": ["Osakaa", "Sakai", "Kobe"]
                }
            ]
        },
        {
            "name": "South Africa",
            "states": [
                {
                    "name": "Gauteng",
                    "cities": ["Johannesburg", "Pretoria", "Soweto"]
                },
                {
                    "name": "Western Cape",
                    "cities": ["Cape Town", "Stellenbosch", "George"]
                }
            ]
        },
        {
            "name": "Mexico",
            "states": [
                {
                    "name": "Mexico City",
                    "cities": ["Mexico City", "Ecatepec", "Nezahualcóyotl"]
                },
                {
                    "name": "Jalisco",
                    "cities": ["Guadalajara", "Zapopan", "Tlaquepaque"]
                }
            ]
        }
    ]
}


const countryCheckbox = document.getElementById("country");
const stateCheckbox = document.getElementById("state");
const cityCheckbox = document.getElementById("city");
// console.log(countryCheckbox)

data.countries.forEach(element => {
    const div = document.createElement("div")
    const input = document.createElement("input");
    const label = document.createElement("label");

    div.className = "chk"
    input.type = "checkbox";
    input.value = element.name;
    label.textContent = element.name;

    countryCheckbox.appendChild(div);
    div.appendChild(input);
    div.appendChild(label);
});

var selectedCountry;

countryCheckbox.addEventListener('change', (e) => {
    // console.log(e)
    // if (!e.target.checked) {

    //     stateCheckbox.innerHTML=""
    // }
    const checked = e.target.checked;
    console.log(checked)

    i = 0;
    selectedCountry = e.target.value;
    // console.log(e.target.value)
    data.countries.forEach((country) => {

        if (country.name == selectedCountry) {
            country.states.forEach((state) => {
                // alert(country.states.length)
                let cityLength = state.cities.length;
                let j = 0;

                if (e.target.checked) {

                    const div = document.createElement("div")
                    const input = document.createElement("input");
                    const label = document.createElement("label");

                    div.className = "chk";
                    input.type = "checkbox";
                    input.value = state.name;
                    input.id = state.name.replace(/\s/g, '');
                    label.textContent = state.name;

                    stateCheckbox.appendChild(div);
                    div.appendChild(input);
                    div.appendChild(label);
                }

                console.log("before", selectedStates)
                if (!checked) {
                    if (i != country.states.length) {
                        document.querySelector(`#${state.name.replace(/\s/g, '')}`).parentNode.remove()
                        i++;
                    }
                    else {
                        checked = true;
                    }
                    console.log(state, selectedStates.get(state.name))
                    if (selectedStates.has(state.name)) {
                        state.cities.forEach((city) => {
                            document.querySelector(`#${city.replace(/\s/g, '')}`).parentNode.remove()
                            selectedStates.delete(state.name)
                        })
                    }
                    console.log("after", selectedStates)
                }

            })
        }
    })
})
let selectedStates = new Map();

stateCheckbox.addEventListener('change', (e) => {
    const selectedState = e.target.value;

    const checked = e.target.checked;
    i = 0;

    data.countries.forEach((country) => {
        country.states.forEach((state) => {
            if (state.name == selectedState) {
                selectedStates.set(selectedState, country.name)
                state.cities.forEach((city) => {
                    if (checked) {
                        const div = document.createElement("div")
                        const input = document.createElement("input");
                        const label = document.createElement("label");

                        div.className = "chk";
                        input.type = "checkbox";
                        input.value = city;
                        input.id = city.replace(/\s/g, '');
                        label.textContent = city;

                        cityCheckbox.appendChild(div);
                        div.appendChild(input);
                        div.appendChild(label);
                    }
                    if (!checked) {
                        selectedStates.delete(state.name)
                        if (i != state.cities.length) {
                            document.querySelector(`#${city.replace(/\s/g, '')}`).parentNode.remove()
                            i++;
                        }
                        else {
                            checked = true;
                        }

                    }

                })
            }
        })
    })

    console.log(selectedStates)
})
