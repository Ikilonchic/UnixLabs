const { argv } = require('./argv');

const mltp = (first, second) => {
    return first * second;
};

if (argv.length < 2) {
    console.log('Not enough args!');
} else {
    const first = Number(argv[0]);
    const second = Number(argv[1]);
    
    console.log(`${first} * ${second} = ${mltp(first, second)}`);
}