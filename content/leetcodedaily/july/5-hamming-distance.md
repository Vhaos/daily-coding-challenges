---
title: "Hamming Distance"
date: 2020-07-05T01:00:52+01:00
author: Kareem
tags:
  - "Bit Manipulation"
---

<!-- LeetCode month and day here -->
# LeetCode July - Day 5

## Problem Statement

The Hamming distance between two integers is the number of positions at which the corresponding bits are different. Given two integers x and y, calculate the Hamming distance.

Note:
0 ≤ x, y < 2^31.

**Example:**

Input: x = 1, y = 4
Output: 2
Explanation:
```
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑
```
The above arrows point to positions where the corresponding bits are different.

## Inputs, Outputs, Constraints & Exceptions
- **I**: x {number}, y {number}
- **O**: number (number of bits that differ)
- **C**: 0 ≤ x, y < 2^31.
- **E**: x === y, x or y is === 0 

## PseudoCode

```js
hammingDistance(x ,y):
  initialise var for count
  calculate x ^ y and set to val
  while val > 0:
    if (val & 1) > 0:
      count++
    rightshift val
  return
```

## Code

```js
const hammingDistance = (x, y) => {
  let count = 0, val = x ^ y;
  while(val > 0){
    if(val & 1){count++};
    val = val >> 1;
  }
  return count
}
```

**_Time complexity_**: O(1)\
\- we can assume this to be constant time since we iterate through at most 32 bits
**_Space complexity_**: O(1)