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

const countrydropdown = document.getElementById("country")
const stateDropdown = document.getElementById("state")
const cityDropdown = document.getElementById("city")


data.countries.forEach(element => {
    const option = document.createElement("option")
    option.text = element.name;
    option.className = "countryid"
    option.value = element.name
    countrydropdown.appendChild(option)
});


countrydropdown.addEventListener("change", () => {
    const selectedCountry = countrydropdown.value;
    console.log(countrydropdown.value)
    stateDropdown.innerHTML = '<option value="">Select a State</option>';
    cityDropdown.innerHTML = '<option value="">Select a City</option>';

    data.countries.forEach((country) => {
        if (country.name == selectedCountry) {
            console.log(country.states)
            country.states.forEach((n) => {
                console.log(n.name)
                const option = document.createElement("option")
                option.text = n.name;
                stateDropdown.appendChild(option)
            })
            return true
        }
    });
});

stateDropdown.addEventListener('change', () => {
    const selectedState = stateDropdown.value;
    cityDropdown.innerHTML = '<option value="">Select a City</option>';

    data.countries.forEach((country) => {
        country.states.forEach((state) => {
            if (state.name == selectedState) {
                state.cities.forEach((city) => {
                    const option = document.createElement("option")
                    option.text = city;
                    cityDropdown.appendChild(option)
                })
            }
        })
    })
})