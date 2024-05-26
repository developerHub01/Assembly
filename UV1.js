const getNumberOfSteps = (num) => {
  let step = 1;
  while (num !== 1) {
    if (num % 2) num = 3 * num + 1;
    else num /= 2;

    // console.log(`STEP_VAL == ${step}`);
    // console.log(`NUM_VAL == ${num}`);
    
    step++;
  }
  // console.log(`STEP == ${step}`);
  return step;
};

const uva100 = (low, heigh) => {
  let maxV = 0;
  for (let i = low; i <= heigh; i++) {
    // console.log(`CUR_VAL == ${i}`);
    // console.log("====================");
    const value = getNumberOfSteps(i);
    if (value > maxV) {
      maxV = value;
    }
  }
  return [low, heigh, maxV];
};



// const getNumberOfSteps = (num) => {
//   let step = 1;
//   while (num !== 1) {
//     // console.log(`STEP === ${step}`);
//     // console.log(`NUM === ${num}`);
//     // console.log("====================");
//     console.log(`${num%2? "ODD": "EVEN"}`);
//     num--;
//     step++;
//   }
// };

// const uva100 = (low, heigh) => {
//   let maxV = 0;
//   for (let i = low; i <= heigh; i++) {
//     console.log(`CUR_VAL == ${i}`);
//     getNumberOfSteps(i);
//   }
//   return [low, heigh, maxV];
// };


console.log(uva100(3, 5));
console.log(uva100(3, 4));
console.log(uva100(10, 11));
console.log(uva100(100, 200));
console.log(uva100(201, 210));
console.log(uva100(900, 1000));
