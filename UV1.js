const getNumberOfSteps = (num) => {
  let step = 1;
  while (num !== 1) {
    if (num % 2) num = 3 * num + 1;
    else num /= 2;

    console.log(num);

    step++;
  }
  return step;
};

const uva100 = (low, heigh) => {
  let maxV = 0;
  for (let i = low; i <= heigh; i++) {
    const value = getNumberOfSteps(i);
    if (value > maxV) {
      maxV = value;
    }
  }
  return [low, heigh, maxV];
};




// console.log(uva100(1, 10));
console.log(uva100(10, 11));
// console.log(uva100(100, 200));
// console.log(uva100(201, 210));
// console.log(uva100(900, 1000));
