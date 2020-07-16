---
title: "Pow(x, n)"
date: 2020-07-16T01:00:52+01:00
author: Kareem
tags:
  - "Math"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 16

## Problem Statement

Implement pow(x, n), which calculates x raised to the power n (xn).

**Example 1:**
```
Input: 2.00000, 10
Output: 1024.00000
```
**Example 2:**
```
Input: 2.10000, 3
Output: 9.26100
```
**Example 3:**
```
Input: 2.00000, -2
Output: 0.25000
```
Explanation: $2^{-2} = \frac{1}{2 * 2} = \frac{1}{4} = 0.25$

Note:

-100.0 < x < 100.0\
n is a 32-bit signed integer, within the range [−231, 231 − 1]


## Inputs, Outputs, Constraints & Exceptions
- **I**: number {x}, number {n}
- **O**: number {ans}
- **C**: value of n can be large, optimise
- **E**: n is 0


## Code (obvious)

```js
/**
 * @param {number} x
 * @param {number} n
 * @return {number}
 */
function myPow(x, n) {
    return Math.pow(x, n)
};
```

## Code (typical)

```js
/**
 * @param {number} x
 * @param {number} n
 * @return {number}
 */
function myPow(x, n) {
  if(n === 0) return 1;

  let ans = 1;
  let pow = Math.abs(n);
  
  while(pow > 0){
    if((pow & 1) === 1){
      ans *= x;;
    }
    pow >>>= 1;
    x *= x
  }
  
  return n < 0 ? 1/ans : ans;
};
```

**_Time complexity_**:  O(LogN)\
\- we are dividing `n` by 2 in the while loop with each iteration i.e. `pow >>>= 1`. You could make the case this is O(1) as there would be at most 32 iterations given the input constraints of `n`\
**_Space complexity_**: O(1)