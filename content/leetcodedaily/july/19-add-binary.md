---
title: "Add Binary"
date: 2020-07-19T01:00:52+01:00
author: Kareem
tags:
  - "Bit Manipulation"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 19

## Problem Statement


Given two binary strings, return their sum (also a binary string).

The input strings are both non-empty and contains only characters 1 or 0.

**Example 1:**
```
Input: a = "11", b = "1"
Output: "100"
```
**Example 2:**
```
Input: a = "1010", b = "1011"
Output: "10101"
```

**Constraints:**

Each string consists only of '0' or '1' characters.\
1 <= a.length, b.length <= 10^4\
Each string is either "0" or doesn't contain any leading zero.

## Inputs, Outputs, Constraints & Exceptions
- **I**: string {a}, string {b}
- **O**: string
- **C**: none/optmise
- **E**: - a and b are 0
  - a or b is longer than the other
  - a 'carry' is needed

## Code 1 (obvious)

```js
const addBinary(a, b){
  return (parseInt(a, 2) + parseInt(b, 2)).toString(2);
}
```

## Code 2 (typical)

```js
/**
 * @param {string} a
 * @param {string} b
 * @return {string}
 */
const addBinary = (a, b) => {
  let res = []
  let i = a.length - 1, j = b.length - 1
  let carry = 0

  while(i >= 0 || j >= 0 || carry){
    let sum = carry

    if(i >= 0){
      sum += a[i] === '1' ?  1 : 0;
      i--
    } 
    
    if (j >= 0){
      sum += b[j] === '1' ?  1 : 0;
      j--
    }
    
    res.unshift(sum % 2)
    carry = Math.floor(sum/2)
  }
  
  return res.join('')
};
```

**_Time complexity_**: O(Max(a, b))\
**_Space complexity_**: O(Max(a, b))