const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


reader.question("Would you like some tea?", function (answer) {
  console.log(`Hello ${answer}!`);
});

reader.question("Would you like biscuits?", function (answer2) {
  console.log(`Hello ${answer2}!`);
});

console.log(`So you ${firstAns} want tea and you ${secondAns} want coffee.`)
