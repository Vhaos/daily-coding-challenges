---
title: "Largest Time for Given Digits"
date: 2020-09-01T01:00:52+01:00
author: Kareem
tags:
  - Math
draft: true
---

<!-- LeetCode month and day here -->
# LeetCode September - Day 1

## Problem Statement

Given an array of 4 digits, return the largest 24 hour time that can be made.

The smallest 24 hour time is 00:00, and the largest is 23:59.  Starting from 00:00, a time is larger if more time has elapsed since midnight.

Return the answer as a string of length 5.  If no valid time can be made, return an empty string.

**Example 1:**
```
Input: [1,2,3,4]
Output: "23:41"
```
**Example 2:**
```
Input: [5,5,5,5]
Output: "" 
```
**Note:**
1. A.length == 4
2. 0 <= A[i] <= 9


## Inputs, Outputs, Constraints & Exceptions
- **I**: number[] {A}
- **O**: string
- **C**: - A.length == 4
  - A[i] in range [0, 9]
- **E**: - [0,0,0,0]
  - [2,3,5,9]


## Code (initial very buggy attempt)
```js
/**
 * @param {number} n
 * @return {number}
 */
const getMaxDigit = (A, n) => {
  for(let i = n; i >= 0; i--){
    for(let j = 0; j < A.length; j++){
      if(A[j] === i){
        return String(i)
      }
    }
  }
  return ''
}

/**
 * @param {number[]} A
 * @return {string}
 */
function largestTimeFromDigits(A) {
  const getMaxDigit = (n) => {
    for(let i = n; i >= 0; i--){
      for(let j = 0; j < A.length; j++){
        if(A[j] === i){
          return String(A.splice(j, 1))
        }
      }
    }
    return ''
  }
  
  const digit1 = getMaxDigit(2)
  const time =  digit1 + getMaxDigit(digit1 == 2 ? 3 : 9) + ':' + getMaxDigit(5) + getMaxDigit(9)
  return time.length === 5 ? time : '' 
};
```

## Code (working version)
credits for this idea goes to [knowledge center](https://www.youtube.com/channel/UCMn3_305DqmTylxJPFA8OJA)
```js
function largestTimeFromDigits(A) {
  let res = -1
  for(let i = 0; i < A.length; i++){
    for(let j = 0; j < A.length; j++){
      for(let k = 0; k < A.length; k++){
        if(i == j || j == k || k == i) continue;
        let hh = A[i] * 10 + A[j]
        let mm = A[k] * 10 + A[6-i-j-k]
        let hhmm = hh * 100 + mm
        if(hh < 24 && mm < 60 && hhmm > res){
          res = hhmm
        }
      }
    }
  }
  
  if(res === -1) {
    return ""
  } else {
    res = String(res)
    while(res.length < 4) res = '0'+res;
    let [h,hh,m,mm] = String(res)
    return h + hh + ':' + m + mm
  }
};
```

**_Time complexity_**: O(1) \
**_Space complexity_**: O(1)