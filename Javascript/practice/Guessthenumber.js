
   const call = ()=>{

        const n = Math.floor(Math.random()*100);

        // console.log(n);
        // document.write(n);
        let score =0;
        let a = prompt("Enter Number:");
        
        while (a!=n) {
            a=Number(a);
                
            if (a<n) {
                console.log("Choose some large number")
            }
            else{
                console.log("Choose some small number")
                
            }
            score++;
            a = prompt("Enter Number:");
        }
        
        console.log(`your score is ${100 - score}`)
    }
;
