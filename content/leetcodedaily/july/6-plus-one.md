---
title: "Plus One"
date: 2020-07-06T01:00:52+01:00
author: Kareem
tags:
  - "Array"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 6

## Problem Statement

Given a non-empty array of digits representing a non-negative integer, plus one to the integer. The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit. You may assume the integer does not contain any leading zero, except the number 0 itself.

**Example 1:**

Input: [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.

**Example 2:**

Input: [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.


## Inputs, Outputs, Constraints & Exceptions
- **I**: number[]
- **O**: number[]
- **C**: none / optimise
- **E**: array of size 1, multiple 9 digits in a row, integer has a leading 9


## Code

```js
const plusOne = (digits) => {
  let carry = 0, i = digits.length - 1;
  digits[i]++
  
  while(i > -1){
    let sum = carry + digits[i];
    carry = Math.floor(sum / 10);
    digits[i] = carry ? 0 : sum;
    i--
  }

  if (carry === 1){digits.unshift(1)}
  return digits
}
```

**_Time complexity_**: O(N) \
\- where N is the number of digits in the array\
**_Space complexity_**: O(1)