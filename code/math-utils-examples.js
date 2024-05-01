const Utils = require('./math-utils.js');

// Example Usage:
console.log(Utils.add(5, 3));  // 8
console.log(Utils.subtract(5, 3));  // 2
console.log(Utils.multiply(5, 3));  // 15
console.log(Utils.divide(5, 3));  // 1.6666666666666667
console.log(Utils.pow(2, 3));  // 8

const numbers = [1, 2, 3, 2, 1];
console.log(Utils.sum(numbers));  // 9
console.log(Utils.max(numbers));  // 3
console.log(Utils.min(numbers));  // 1
console.log(Utils.unique(numbers));  // [1, 2, 3]
console.log(Utils.flatten([1, [2, 3], [4, [5, 6]]]));  // [1, 2, 3, 4, 5, 6]

const setA = new Set([1, 2, 3]);
const setB = new Set([3, 4, 5]);
console.log(Utils.union(setA, setB));  // Set {1, 2, 3, 4, 5}
console.log(Utils.intersection(setA, setB));  // Set {3}
console.log(Utils.difference(setA, setB));  // Set {1, 2}

