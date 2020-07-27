---
title: "Add Digits"
date: 2020-07-26T01:00:52+01:00
author: Kareem
tags:
  - "Math"
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 26

## Problem Statement

Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

**Example:**
```
Input: 38
Output: 2 
```
Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.

**Follow up:**\
Could you do it without any loop/recursion in O(1) runtime?


## Inputs, Outputs, Constraints & Exceptions
- **I**: number {num}
- **O**: number
- **C**: num is non-negative (i.e. num >= 0)
- **E**: - num has only 1 digit
  - num is 0 

## PseudoCode
```
while num is > 9
  let sum = 0
  while num > 0
    sum += num % 10
    num /= 10
  num = sum
return num
```
## Code (iterative)

```js
/**
 * @param {number} num
 * @return {number}
 */
function addDigits(num) {
  while(num > 9){
    let sum = 0;
    while(num > 0){
      sum += num % 10
      num = Math.floor(num/10)
    }
    num = sum
  }
  return num
};
```

**_Time complexity_**: O($k * log\_{10}N$)\
\- where N is our input num, and k is the number of times we need to add digits\
**_Space complexity_**: O(1)

## Code (recursive)

```js
/**
 * @param {number} num
 * @return {number}
 */
function addDigits(num) {
  /* todo */
};
```