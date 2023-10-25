try{
    // Define the URL of the API
let url = "https://630f6650498924524a8ce046.mockapi.io/laptop";

// Use fetch() to send a GET request to the API
fetch(url)
  // Handle the response object
  .then((response) => {
    // Check if the request was successful
    if (response.ok) {
      // Return the response as JSON
      return response.json();
    } else {
      // Throw an error if the status code is not 200
      throw new Error("Something went wrong");
    }
  })

  // Handle the JSON data
  .then((data) => {
    // Loop through the array of users
    debugger;
    for (let user of data) {
      // Display the name and email of each user
      console.log(user.name);
    }
  })
  // Handle any errors
  .catch((error) => {
    // Display the error message
    console.log(error.message);
  });

    // throw "Hi1";
}
catch(e)
{
    console.log(e)
}