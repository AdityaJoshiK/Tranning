const person = {
    firstName: "John",
    lastName: "Doe",
    language: "en",
    get lang(){
        return this.language;
    },
    set lang(lang){ 
        this.language = lang;
    }
}

person.lang = 'in'; // Use "lang" to set the property
console.log(person.langu); // This will work as expected
