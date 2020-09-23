---
title: "Fizz Buzz"
date: 2020-08-26T01:00:52+01:00
author: Kareem
tags:
  - Math
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 26

## Problem Statement

Write a program that outputs the string representation of numbers from 1 to n.

But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

**Example:**
```
n = 15,

Return:
[
    "1",
    "2",
    "Fizz",
    "4",
    "Buzz",
    "Fizz",
    "7",
    "8",
    "Fizz",
    "Buzz",
    "11",
    "Fizz",
    "13",
    "14",
    "FizzBuzz"
]
```
## Inputs, Outputs, Constraints & Exceptions
- **I**: number {n}
- **O**: string[]
- **C**: 1 <= n <= $10^{5}$
- **E**: n === 1


## Code

```js
/**
 * @param {number} n
 * @return {string[]}
 */
function fizzBuzz(n) {
  let res = []
  for(let i = 1; i < n + 1; i++){
    if(i % 3 === 0 && i % 5 === 0) res.push('FizzBuzz')
    else if(i % 3 === 0) res.push('Fizz')
    else if(i % 5 === 0) res.push('Buzz')
    else res.push(i.toString())
  }
  return res
};
```

**_Time complexity_**: O(N)\
**_Space complexity_**: O(1)