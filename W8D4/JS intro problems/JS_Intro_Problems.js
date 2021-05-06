
function titleize(array, callback){
  
    array.map(element => {
        return `Mx. ${element[0].toUpperCase()}${element.slice(1,element.length)} Schmidt`
    }).forEach(function(element) { 
        callback(element);
    })
}


console.log(titleize(["Mary", "Brian", "Leo"], (element)=>{
    console.log(element);
}));


function Elephant(name,height,arr){
    this.name=name;
    this.height=height;
    this.arr=[]
}

Elephant.prototype.trumpet=function(){
    console.log(`${this.name} the elephant goes'phrRRRRRRR!!!!'`)
}

Elephant.prototype.grow= function(){
    this.height+=12;
}

Elephant.prototype.addTrick=function(trick){
    this.arr.push(trick);
}

Elephant.prototype.play=function(){
    console.log(this.arr[Math.floor(Math.random() * this.arr.length)]);
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];
function paradeHelper(element){
        console.log(`${element} is trotting by!"`);
    }



function dinnerBreakfast(order){
    order = "I'd like cheesy scrambled eggs please";
    let bf =function(arg){
        order+=arg;
        return order;
    }
    return bf;
}