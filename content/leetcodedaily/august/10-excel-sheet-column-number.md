---
title: "Excel Sheet Column Number"
date: 2020-08-10T01:00:52+01:00
author: Kareem
tags:
  - String
---

<!-- LeetCode month and day here -->
# LeetCode August - Day 10

## Problem Statement

Given a column title as appear in an Excel sheet, return its corresponding column number.

For example:
```
    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
    ...
```
**Example 1:**
```
Input: "A"
Output: 1
```
**Example 2:**
```
Input: "AB"
Output: 28
```
**Example 3:**
```
Input: "ZY"
Output: 701
```
**Constraints:**

1 <= s.length <= 7\
s consists only of uppercase English letters.\
s is between "A" and "FXSHRXW".

## Inputs, Outputs, Constraints & Exceptions
- **I**: string
- **O**: number
- **C**: - s.length in range [1,7]
  - chars are BASIC ASCII uppercase chars
  - s is between "A" and "FXSHRXW"
- **E**: - s.length is 1
  - s is "FXSHRXW"

## Code

```js
/**
 * @param {string} s
 * @return {number}
 */
function titleToNumber(s) {
  let sum = 0, mag = 1
  for(let i = s.length - 1; i >= 0; i--){
    let digit = s.charCodeAt(i) - 'A'.charCodeAt(0) + 1
    sum += mag * digit
    mag *= 26
  }
  return sum
};
```

**_Time complexity_**: O(n)\
\- where n is the number of chars in s\
**_Space complexity_**: O(1)