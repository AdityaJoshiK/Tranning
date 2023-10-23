const str = "abaa";

let revstr = "";

for (let index = str.length-1; index >=0 ; index--) {
    revstr+=str.charAt(index);
}

if (str === revstr) {
    console.log("Palindrome");
}
else{
    console.log("Not Palindrome");
}