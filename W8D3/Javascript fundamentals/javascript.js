function madLib(verb,adjective,noun){
    verb=verb.toUpperCase()
    adjective=adjective.toUpperCase()
    noun=noun.toUpperCase()
    return `We shall ${verb} the ${adjective} ${noun}`
}

console.log(madLib('make','best','guac'))

function isSubstring(searchString, subString){
    for(let i = 0; i< searchString.length; i++){
        for(let j=i+1; j<searchString.length; j++){
            let sub=searchString.substring(i,j)
            if (sub === subString){
                   return true
            }
        }
    }
    return false
}

console.log(isSubstring("time to program", "time"))
console.log(isSubstring("Jump for joy", "joys"))

function fizzBuzz(array){
    let arr = [];
    array.forEach(element => {
        if((element%3===0 || element%5===0) && !(element%3===0 && element%5===0)){
            arr.push(element)
        }
    });
return arr
}

console.log(fizzBuzz([10,3,5,15,20]))


function isPrime(number){
    if (number<2){
        return false
    }
    for(i=2; i<number; i++){
        if(number%i===0){
            return false
        }
    }
    return true
}

console.log(isPrime(2))
console.log(isPrime(10))
console.log(isPrime(15485863))
console.log(isPrime(3548563))

function sumOfNPrimes(n){
    let sum=0
    let i=0
    let j=0
    while(j<n){
        if(isPrime(i)){
            sum+=i
            j++
        }
        i++
    }
    return sum
}

console.log(sumOfNPrimes(0))


console.log(sumOfNPrimes(1))



console.log(sumOfNPrimes(4))
